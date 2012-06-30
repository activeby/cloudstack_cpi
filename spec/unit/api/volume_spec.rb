require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe Volume do
  let(:subject){Volume}
  let(:volumes){[{"id" => 'volume-1'}, {"id" => 'volume-2'}]}
  before do
    FogRequestor.stub(:list).with(:volumes).and_return volumes
  end
  describe 'class methods' do
    describe '#all' do
        it 'return array of vm instances' do
          vms = subject.all
          vms.first.should be_instance_of subject
        end
      end

    describe '#get' do
      it 'return one instance of volume by id' do
        volume = subject.get('volume-1')
        volume.should be_instance_of subject
        volume.id.should == volumes[0]['id']
      end
    end

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
  describe 'instance methods' do
    let(:instance){subject.get('volume-1')} 
    describe '#delete!' do
      it 'send request to fog' do
        Api.connection.should_receive(:delete_volume).and_return empty_fog_response
        instance.delete!
      end
    end
  end

end