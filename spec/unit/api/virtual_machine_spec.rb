require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe VirtualMachine do
  let(:subject){VirtualMachine}
  let(:virtual_machines){[{"id" => 'virtualmachine-1'}, {"id" => 'virtualmachine-2'}]}
  before do
    FogRequestor.stub(:list).with(:virtual_machines).and_return virtual_machines
  end

  describe 'class methods' do
    describe '#all' do
      it 'return array of vm instances' do
        vms = subject.all
        vms.first.should be_instance_of subject
      end
    end

    describe '#get' do
      it 'return one instance of vm by id' do
        vm = subject.get('virtualmachine-1')
        vm.should be_instance_of subject
        vm.id.should == virtual_machines[0]['id']
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

      it 'return instance of self' do
        subject.deploy(deploy_parameters).should be_instance_of subject
      end
    end
  end

  describe 'instance methods' do
    let(:instance){subject.get('virtualmachine-1')}
    describe '#attach_volume' do
      let(:volume){Volume.new({'id' => 'volume-1'})}
        
      it 'send fog request' do
        Api.connection.should_receive(:attach_volume).and_return empty_fog_response
        instance.attach_volume(volume)
      end
      it 'add id of self, and id of disk in request' do
        instance.should_receive(:request) do |name, options|
          options.should == {'virtualmachineid' => instance.id, 'id' => volume.id}
        end
        instance.attach_volume(volume)
      end
      it 'raise error if volume is not a instance of Volume object' do
        expect{ instance.attach_volume({}) }.should raise_error Bosh::CloudStackCloud::Api::IncorrectParameters
      end
    end
  end
end