defmodule InfoCare.ServiceMocks do
  def invalid_response do
    response_body = ~s(
      {
        "error": {
          "code": "",
          "message": "Authorization has been denied for this request."
        }
      }
    )
    %HTTPoison.Response{status_code: 200, body: response_body}
  end

  def less_rooms_response do
    response_body = ~s({})
    %HTTPoison.Response{status_code: 200, body: response_body}
  end

  def update_response_body do
      ~s(
        {"Status":"OK","Services":[{"ServiceID":"671","Name":"Infocare Test 2","Email":"russell@info-care.biz","Currency":"NZD","PhoneNumber":"09 5799553","AddressStreat":"3-92 Churchill Road","AddressSuburb":"Rothesay Bay","AddressPostCode":"1311","AddressCountry":"New Zealand","MaxChildren":"35","MaxU2":"10","MaxO2":"35","Rooms":[{"Name":"Vacation"},{"Name":"Tui Room"}]},{"ServiceID":"672","Name":"First Steps Parnell","Email":"iain@info-ware.biz","Currency":"NZD","PhoneNumber":"09 479955","AddressStreat":"3-92 Churchill Road","AddressSuburb":"Rothesay Bay","AddressPostCode":"1311","AddressCountry":"New Zealand","MaxChildren":"20","MaxU2":"0","MaxO2":"20","Rooms":[{"Name":"MTWTH"},{"Name":"MWF"}]},{"ServiceID":"673","Name":"Montessori @ Herne Bay","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"P O Box 101479","AddressSuburb":"North Shore","AddressPostCode":"0745","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]},{"ServiceID":"674","Name":"Edukids Remuera","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]},{"ServiceID":"675","Name":"Edukids Stoddard","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"60","MaxU2":"60","MaxO2":"60","Rooms":[]},{"ServiceID":"676","Name":"Infocare Homebased","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"25","MaxO2":"25","Rooms":[]},{"ServiceID":"677","Name":"ABC Albany","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]},{"ServiceID":"679","Name":"Edukids Albany","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]}]}
      )
  end

  def over_2_capacity_is_zero do
      ~s(
        {"Status":"OK","Services":[{"ServiceID":"671","Name":"Infocare Test","Email":"russell@info-care.biz","Currency":"NZD","PhoneNumber":"09 4799553","AddressStreat":"3-92 Churchill Road","AddressSuburb":"Rothesay Bay","AddressPostCode":"1311","AddressCountry":"New Zealand","MaxChildren":"45","MaxU2":"10","MaxO2":"0","Rooms":[{"Name":"Holiday"},{"Name":"Tui Room"}]}]}
      )
  end


  def valid_response_body do
      ~s(
        {"Status":"OK","Services":[{"ServiceID":"671","Name":"Infocare Test","Email":"russell@info-care.biz","Currency":"NZD","PhoneNumber":"09 4799553","AddressStreat":"3-92 Churchill Road","AddressSuburb":"Rothesay Bay","AddressPostCode":"1311","AddressCountry":"New Zealand","MaxChildren":"35","MaxU2":"10","MaxO2":"35","Rooms":[{"Name":"Holiday"},{"Name":"Tui Room"}]},{"ServiceID":"672","Name":"First Steps Parnell","Email":"iain@info-ware.biz","Currency":"NZD","PhoneNumber":"09 479955","AddressStreat":"3-92 Churchill Road","AddressSuburb":"Rothesay Bay","AddressPostCode":"1311","AddressCountry":"New Zealand","MaxChildren":"20","MaxU2":"0","MaxO2":"20","Rooms":[{"Name":"MTWTH"},{"Name":"MWF"}]},{"ServiceID":"673","Name":"Montessori @ Herne Bay","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"P O Box 101479","AddressSuburb":"North Shore","AddressPostCode":"0745","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]},{"ServiceID":"674","Name":"Edukids Remuera","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]},{"ServiceID":"675","Name":"Edukids Stoddard","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"60","MaxU2":"60","MaxO2":"60","Rooms":[]},{"ServiceID":"676","Name":"Infocare Homebased","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"25","MaxO2":"25","Rooms":[]},{"ServiceID":"677","Name":"ABC Albany","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]},{"ServiceID":"679","Name":"Edukids Albany","Email":"","Currency":"NZD","PhoneNumber":"","AddressStreat":"","AddressSuburb":"","AddressPostCode":"","AddressCountry":"New Zealand","MaxChildren":"25","MaxU2":"0","MaxO2":"0","Rooms":[]}]}
      )
  end

  def valid_response do
    %HTTPoison.Response{status_code: 200, body: valid_response_body}
  end

  def update_response do
    %HTTPoison.Response{status_code: 200, body: update_response_body}
  end

end
