require 'rails_helper'

RSpec.describe User do
  def find_error(attr, type)
    @subject.errors.find { |error| error.attribute == attr && error.type == type }
  end

  describe 'UserValidator has implemented validations adding errors:' do
    before :all do
      @subject = User.new
      @subject.valid?
    end

    [
      %i[email invalid],
      %i[password_digest presence],
      %i[composition logic],
      %i[base digest_extra],
      %i[base email_extra]
    ].each do |attr, type|
      it "`#{type}` on `#{attr}`" do
        expect(find_error(attr, type)).to_not be_nil
      end
    end
  end
end