require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe VirtualMachine do
  let(:subject){VirtualMachine}
  describe 'class methods' do
    let(:virtual_machines){[{"id" => 1}, {"id" => 2}]}
    before do
      Requestor.stub(:request).with(:list_virtual_machines).and_return virtual_machines
    end
    describe '#all' do
      it 'return array of vm' do
        subject.all.should == virtual_machines
      end
    end

    describe '#get' do
      it 'return one vm by id' do
        subject.get(1).should == virtual_machines.first
      end
    end
  end
end