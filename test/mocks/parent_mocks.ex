defmodule InfoCare.ParentMocks do
  def valid_response do
    %HTTPoison.Response{status_code: 200, body: valid_response_body}
  end

  def valid_response_body do
    ~s(
      {"Status":"OK","Parents":[{"ParentID":"5303","FirstName":"Phil","LastName":"Snowdon","Children":[{"ChildID":"712","ServiceID":"671","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"},{"ChildID":"739","ServiceID":"679","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"}]},{"ParentID":"5284","FirstName":"Mary","LastName":"White","Children":[{"ChildID":"713","ServiceID":"671","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"},{"ChildID":"740","ServiceID":"679","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"}]}]}
    )
  end

  def update_response_body do
    ~s(
      {"Status":"OK","Parents":[{"ParentID":"5303","FirstName":"Bill","LastName":"Snowdon","Children":[{"ChildID":"712","ServiceID":"671","FirstName":"Barry","LastName":"Susan","DOB":"2012-01-10"},{"ChildID":"739","ServiceID":"679","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"}]},{"ParentID":"5284","FirstName":"Mary","LastName":"White","Children":[{"ChildID":"713","ServiceID":"671","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"},{"ChildID":"740","ServiceID":"679","FirstName":"Barry","LastName":"White","DOB":"2012-01-10"}]}]}
    )
  end

  def update_response do
    %HTTPoison.Response{status_code: 200, body: update_response_body}
  end
end
