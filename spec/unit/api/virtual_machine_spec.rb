require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe VirtualMachine do
  let(:subject){VirtualMachine}
  describe 'class methods' do
    let(:virtual_machines){[{"id" => 1}, {"id" => 2}]}
    before do
      FogRequestor.stub(:list).with(:virtual_machines).and_return virtual_machines
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

    describe '#deploy' do
      let(:deploy_parameters){{
        'zoneid' => 'c554c592-e09c-9df5-7688-4a32754a4305',
        'templateid' => '8a31cf9c-f248-0588-256e-9dbf58785216',
        'serviceofferingid' => '4437ac6c-9fe3-477a-57ec-60a5a45896a4'
        }}
      it 'send request to fog' do
        Api.connection.should_receive(:deploy_virtual_machine).with(deploy_parameters).and_return empty_fog_response
        subject.deploy deploy_parameters
      end

      it 'return a vm instance' do
        subject.deploy(deploy_parameters).should be_instance_of VirtualMachine
      end
    end
  end

  describe 'instance methods' do
    
  end
end