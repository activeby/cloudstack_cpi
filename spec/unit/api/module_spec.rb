require 'spec_helper'
include Bosh::CloudStackCloud
describe Api do
  let(:subject){Api}
  let(:correct_connection_params){{cloudstack_host: 'test.host', cloudstack_api_key: 'test', cloudstack_secret_access_key: 'test'}}
  let(:incorrect_connection_params){{foo: :bar}}
  before(:each) do
    subject.break_connection
  end
  describe '#authorize' do
    it 'create connection with correct params' do
      expect {subject.authorize(correct_connection_params)}.should_not raise_error
    end
    it 'raise error with incorrect params' do
      expect {subject.authorize(incorrect_connection_params)}.should raise_error ArgumentError
    end
  end

  describe '#connection' do
    it 'return connection if it exists' do
      connection = mock(Fog::Compute::Cloudstack)
      Fog::Compute::Cloudstack.stub(:new).and_return connection
      subject.authorize({})
      subject.connection.should == connection
    end
    it 'raise connection error if it not exists' do
      Fog::Compute::Cloudstack.stub(:new).and_return nil
      subject.authorize({})
      expect {subject.connection}.to raise_error Bosh::CloudStackCloud::ConnectionError
    end
  end
end