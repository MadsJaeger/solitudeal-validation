# SolitudealValidation
A Rails plugin to assist the developer in placing validations in solitude. As your Rails application grows models may become complicated, so why not decomplicate them by moving out the validation logic? By moving out the validation logic a dedicted class might better handle the validation, and maybe faster. Also, your validator classes can have common interface allowing you to extract data out of the application. Finally your code might become easier to read!

## To come
This is a very simple gem, the real purpose is to create a common way to define rules in a short shareable manner. This will allow you to share rules in your api-documentation, or provide metadata for the front-end to set up forms with validations.

## Usage
Start by creating an `ApplicationValidator`:

```shell
$ rails g solitudeal_validation:install
  +create+ app/models/validators/application_validator.rb
```

```ruby
# app/models/validators/application_validator.rb
class ApplicationValidator < SolitudealValidation::Validator
end
```

Now add validations to a model:

```shell
$ rails g solitudeal_validation:validator User
  +create+ app/models/validators/user_validator.rb
```

```ruby
# app/models/validators/user_validator.rb
class UserValidator < ApplicationValidator
end

> UserValidator.model
=> User
```

The `UserValidator` class provides same validation methods as as the model simply by delegating them to the model. Also, it acts 
as an `ActiveModel::Validator` allowing you to let the model `validates_with` the class. Thus, there is nothing different in using the Validator to placing validations in the model. Now you may add validations:

```ruby
# app/models/validators/user_validator.rb
class UserValidator < ApplicationValidator
  ##
  # Use validates_with self to let the user model validate with instance methods on this
  # class by defining `call`
  validates_with self

  def call
    # Some complex logic about the record, to withc we delgate method missing with
    errors.add(:base, :type, message: 'Notice this!') if ...
  end
  
  ##
  # OR, define validate as you otherwise would in a ActiveModel::Validator
  def validate(record)
    # same as call, but @record has not been set
    record.errors.add(:base, :type, message: 'Notice this!') if ...
  end

  ##
  # To leverage inbuild validators use the conventional syntax:
  validates :email, format: ...

  ##
  # To explicitly call a method to validate with which you for some reason do not want to 
  # call in the `call` method your may do as follow:
  validate :funky_stuff

  def funky_stuff
    errors.add(...) if ...
  end
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "solitudeal_validation"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install solitudeal_validation
```

## Contributing
Get in touch to contribute!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
