
module SolitudealValidation::Generators
  class InstallGenerator < Rails::Generators::Base
    def create_application_validator
      create_file "#{Rails.root}/app/models/validators/application_validator.rb", file
    end

    private
    def file
      %Q(class ApplicationValidator < SolitudealValidation::Validator\nend)
    end
  end
end