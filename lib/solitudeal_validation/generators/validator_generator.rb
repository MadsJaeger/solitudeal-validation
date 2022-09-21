module SolitudealValidation::Generators
  class ValidatorGenerator < Rails::Generators::Base
    def create_validator
      raise ArgumentError, 'Name of validator missing. Provide a name like `User` or `user`' unless arg

      create_file file_name, file
    end

    private
    def file_name
      "#{Rails.root}/app/models/validators/#{name}_validator.rb"
    end

    def arg
      ARGV[0]
    end

    def name
      arg.underscore
    end

    def klass
      arg.camelize
    end

    def file
      %Q(class #{klass}Validator < ApplicationValidator\nend)
    end
  end
end