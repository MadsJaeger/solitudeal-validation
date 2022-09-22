require 'rails_helper'

RSpec.describe UserValidator do
  describe 'Class' do
    let :subject do
      described_class
    end

    it '#superclass is ApplicationValidator' do
      expect(subject.superclass).to be ApplicationValidator
    end

    it '#model is User' do
      expect(subject.model).to be User
    end
  end
end