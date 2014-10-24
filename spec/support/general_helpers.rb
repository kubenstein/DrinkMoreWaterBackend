def stub_db!
  allow(DB).to receive(:[]).and_return(double.as_null_object)
end
