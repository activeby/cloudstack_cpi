require 'spec_helper'
include Bosh::CloudStackCloud

describe Api::Base do
  let(:subject){Api::Base}

  context 'method_missing' do
    let(:item){subject.new({:param => :value})}

    it 'return data by call instance method' do
      item.param.should == :value
    end
    it 'return data by call indexer' do
      item[:param].should == :value
    end

  end
end