require 'spec_helper'
include Bosh::CloudStackCloud
describe Api do
  let(:correct_connection_params){{cloudstack_host: 'test.host', cloudstack_api_key: 'test', cloudstack_secret_access_key: 'test'}}
  let(:incorrect_connection_params){{foo: :bar}}
  describe '#authorize' do
    it 'create connection with correct params' do
      expect {Api.authorize(correct_connection_params)}.should_not raise_error
    end
    it 'raise error with incorrect params' do
      expect {Api.authorize(incorrect_connection_params)}.should raise_error ArgumentError
    end
  end

  describe '#connection' do
    it 'return connection if it exists' do
      connection = mock(Fog::Compute::Cloudstack)
      Fog::Compute::Cloudstack.stub(:new).and_return connection
      Api.authorize({})
      Api.connection.should == connection
    end
    it 'raise connection error if it not exists' do
      Fog::Compute::Cloudstack.stub(:new).and_return nil
      Api.authorize({})
      expect {Api.connection}.to raise_error Bosh::CloudStackCloud::ConnectionError
    end
  end
end