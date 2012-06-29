require 'spec_helper'
include Bosh::CloudStackCloud::Api

describe FogRequestor do
  let(:subject){FogRequestor}
  describe '#list' do
    it 'send correct list request' do
      subject.stub(:parse_list).and_return []
      subject.should_receive(:request).with('list_virtual_machines')
      subject.list(:virtual_machines)
    end
    it 'extract array of data from responce' do
      subject.list(:virtual_machines).should be_instance_of Array
    end
  end
end
