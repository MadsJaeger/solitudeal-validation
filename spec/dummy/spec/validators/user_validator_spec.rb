require 'rails_helper'

RSpec.describe UserValidator do
  describe 'Class' do
    it 'responds_to validates' do
      expect(described_class).to respond_to :validates
    end

    it 'responds_to validate' do
      expect(described_class).to respond_to :validates
    end

    it 'responds_to validates_each' do
      expect(described_class).to respond_to :validates
    end

    it 'superclass is ApplicationValidator' do
      expect(described_class).to be ApplicationValidator
    end
  end
end