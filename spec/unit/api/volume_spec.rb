require 'spec_helper'
include Bosh::CloudStackCloud::Api
describe Volume do
  let(:subject){Volume}
  describe 'class methods ' do

    context 'list request' do
      let(:volumes){[{"id" => 'volume-1'}, {"id" => 'volume-2'}]}
      before do
        subject.stub(:request).with(:list_volumes).and_return volumes
      end
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
    end
    describe '#create' do
      let(:volume_params){{'name' => 'foo',
       'zoneid' => 'by',
       'diskofferingid' => 1}}
      it 'send request to fog' do
        subject.should_receive(:request).with(:create_volume, volume_params).and_return empty_fog_response
        subject.create(volume_params)
      end
      it 'return instance of self' do
        subject.create(volume_params).should be_instance_of subject
      end
    end
  end
  describe 'instance methods' do
    let(:instance){subject.new('id' => 'volume-1')} 
    describe '#delete!' do
      it 'send request to fog' do
        instance.should_receive(:request).with(:delete_volume, {"id"=>"volume-1"}).and_return empty_fog_response
        instance.delete!
      end
    end
  end

end