require 'spec_helper'

describe Cielo::Connection do
  before do
    FakeWeb.allow_net_connect = true

    @connection = Cielo::Connection.new
  end

  after do
    FakeWeb.allow_net_connect = false
  end
  
  it "should estabilish connection when was created" do
    @connection.environment.should_not be_nil
  end

  describe "making a request" do
    it "should make a request" do
      response = @connection.request! :data => "Anything"

      response.body.should_not be_nil
      response.should be_kind_of Net::HTTPSuccess
    end
  end
end