defmodule InfoCare.UpdateBookingsTest do
  use ExUnit.Case, async: false
  use InfoCare.ConnCase

  alias InfoCare.Booking
  alias InfoCare.Availability
  alias InfoCare.BookingMocks
  alias InfoCare.Repo
  alias InfoCare.Child
  alias InfoCare.Service
  alias InfoCare.ServiceFixtures
  alias InfoCare.ChildFixtures
  alias InfoCare.RoomFixtures
  alias InfoCare.Room

  import Mock
  import Ecto.Query
  import IEx

  defp prepare_db do
    service = ServiceFixtures.service_1 |> Repo.insert!
    ChildFixtures.child_1(service) |> Repo.insert!
    ChildFixtures.child_2(service) |> Repo.insert!
    ChildFixtures.child_3(service) |> Repo.insert!
    service
  end

  defp add_age_to_booking_test(child, is_over) do
    booking = %{date: ~N[2016-06-01 09:00:00]}
    booking_updated = InfoCare.UpdateBookings.add_age_to_booking(booking, child)
    assert booking_updated.over_2 == is_over
  end

  test "saves bookings to database" do
    prepare_db
    with_mock HTTPoison, [post: fn(_url, _body, _header) -> {:ok, BookingMocks.valid_response} end] do
      HTTPoison.post(@get_bookings_url, %{}, [foo: :bar])
      InfoCare.UpdateBookings.run
      assert Repo.one(from b in Booking, select: count("*")) == 191
    end
  end

  test "add_age_to_booking updates booking correctly for children older than two" do
    service = prepare_db
    child = ChildFixtures.child_1(service)
    add_age_to_booking_test(child, true)
  end

  test "add_age_to_booking updates booking correctly for children under two" do
    service = prepare_db
    child = ChildFixtures.child_2(service)
    add_age_to_booking_test(child, false)
  end

  test "add_age_to_booking updates booking correctly for children that are two" do
    service = prepare_db
    child = ChildFixtures.child_3(service)
    add_age_to_booking_test(child, true)
  end

  test "booking is associated with service, parent and child" do
    prepare_db
    with_mock HTTPoison, [post: fn(_url, _body, _header) -> {:ok, BookingMocks.valid_response} end] do
      HTTPoison.post(@get_bookings_url, %{}, [foo: :bar])
      InfoCare.UpdateBookings.run

      ic_child_id = "672"
      child =  Repo.one(from c in Child, where: c.ic_child_id == ^ic_child_id, preload: [:bookings, :service])
      assert length(child.bookings) == 9

      ic_booking_id = "136743"
      booking =  Repo.one(from b in Booking, where: b.ic_booking_id == ^ic_booking_id, preload: [:service, :child])
      assert booking.child_id == child.id
      assert booking.service.ic_service_id == "671"

    end
  end

  test "will update booking information if it changes" do
    prepare_db
    with_mock HTTPoison, [post: fn(_url, _body, _header) -> {:ok, BookingMocks.valid_response} end] do
      HTTPoison.post(@get_bookings_url, %{}, [foo: :bar])
      InfoCare.UpdateBookings.run
    end

    with_mock HTTPoison, [post: fn(_url, _body, _header) -> {:ok, BookingMocks.update_response} end] do
      HTTPoison.post(@get_bookings_url, %{}, [foo: :bar])
      InfoCare.UpdateBookings.run

      ic_booking_id = "136743"
      booking =  Repo.one(from b in Booking, where: b.ic_booking_id == ^ic_booking_id, preload: [:service, :child])
      assert booking.absent == true
    end
  end
end
