require 'rails_helper'

RSpec.describe SolitudealValidation::Validator do
  Structure = Struct.new(:name)

  let :struct do
    Structure.new('Test')
  end

  let :with_struct do 
    described_class.new do |inst|
      inst.record = struct
    end
  end

  describe 'class' do
    let :subject do
      described_class
    end

    it { is_expected.to respond_to :validates }
    it { is_expected.to respond_to :validates_each }
    it { is_expected.to respond_to :validate }
    it { is_expected.to respond_to :validates_with }

    it 'superclass is ActiveModel::Validator' do
      expect(subject.superclass).to be ActiveModel::Validator
    end

    it 'model raises NameError' do
      expect { subject.model }.to raise_error NameError
    end
  end

  it { is_expected.to respond_to :record }
  it { is_expected.to respond_to :record= }

  it 'can intialize with a block' do 
    expect(with_struct.record).to be struct
  end

  it 'delegates methods record' do
    expect(with_struct.name).to be struct.name
    expect { with_struct.missing_method }.to raise_error NoMethodError
  end

  it '#call raises NotImplementedError' do
    expect { subject.call }.to raise_error NotImplementedError
  end

  it '#validate sets record' do
    expect { subject.validate(struct) }.to raise_error NotImplementedError
    expect( subject.record ).to be struct
  end
end