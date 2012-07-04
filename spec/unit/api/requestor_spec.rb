require 'spec_helper'
include Bosh::CloudStackCloud::Api

describe FogRequestor do
  let(:subject){FogRequestor}
  describe '#request' do
    it 'send request to fog' do
      subject.stub(:extract_data_from_response).and_return []
      Api.connection.should_receive(:list_virtual_machines)
      subject.request(:list_virtual_machines)
    end
    it 'extract data from responce' do
      subject.request(:list_virtual_machines).should == {"count"=>0, "virtualmachine"=>[]}
    end
  end
end
