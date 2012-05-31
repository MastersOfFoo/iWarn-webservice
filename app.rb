require "nancy/base"
class IWarnApi < Nancy::Base
  get "/" do
    "Hello World"
  end

  get "/events" do
    "All Currents Evetns With Json"
  end

  
end
