require 'rails_helper'

RSpec.describe 'Integration of SolitudealValidation' do
  it 'has added autoload_path models/validators' do
    path = Rails.application.root.to_s + '/app/models/validators'
    expect(Rails.application.config.autoload_paths).to include path
  end
end