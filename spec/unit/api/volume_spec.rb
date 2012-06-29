require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe Volume do
  let(:subject){Volume}
  let(:creation_volume_params){{'name' => 'foo',
   'zoneid' => 'by',
   'diskofferingid' => 1}}

  describe '#create' do
    it 'send request to fog' do
      Api.connection.should_receive(:create_volume).and_return empty_fog_response
      subject.create(creation_volume_params)
    end
    it 'return instance of self' do
      subject.create(creation_volume_params).should be_instance_of subject
    end
  end

end