require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe Volume do
  let(:subject){Volume}

  describe '#create' do
    let(:volume_params){{'name' => 'foo',
     'zoneid' => 'by',
     'diskofferingid' => 1}}
    it 'send request to fog' do
      Api.connection.should_receive(:create_volume).and_return empty_fog_response
      subject.create(volume_params)
    end
    it 'return instance of self' do
      subject.create(volume_params).should be_instance_of subject
    end
  end

end