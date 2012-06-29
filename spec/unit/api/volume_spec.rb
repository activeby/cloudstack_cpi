require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe Volume do
  describe '#create' do
    let(:volume_params){{'name' => 'foo'}}
    it 'send request to fog' do
      Api.connection.should_receive(:create_volume).and_return empty_fog_response
      Volume.create(volume_params)
    end
  end
end