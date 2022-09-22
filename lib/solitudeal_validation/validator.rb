# frozen_string_literal: true

module SolitudealValidation
  ##
  # Abstract class to let applicaiton validators inherit from.
  #
  # UserValidator < SolitudealValidation::Validator
  #   validates :email, presence: true, allow_blank: false
  #   validates_with self
  #
  #   def call
  #     errors.add(:base, :evil, message: 'Only nice users are allowed in this space!') if record.email =~ /evil/
  #   end
  # end
  #
  # User.new.valid => false, errors.full_messages => 'Email missing...'
  # User.new(email: 'dr_evil@man.now').valid => false, errors.full_messages => 'Only nice ...'
  class Validator < ActiveModel::Validator
    class << self
      ##
      # Inferred model on which validation statements are called on.
      # UserValidator will vdelegate validates to User
      def model
        @model ||= name.demodulize[..-10].constantize
      end

      ##
      # Adds call to provides method upon validation. The methods should be
      # defined on the the validator instance. Prefer using `validates_with self`
      # and adding methods to be called in the call method as this allready describes
      # the validations to be called.
      def validate(*methods)
        klass = self
        model.validate do |rec|
          klass.new do |validator|
            validator.record = rec
            methods.each do |meth|
              validator.send(meth)
            end
          end
        end
      end

      delegate :validates, :validates_each, :validates_with, to: :model
    end

    ##
    # Record to perform valdations on
    attr_accessor :record

    def initialize(opts = {}, &block)
      super(opts)
      block&.call(self)
    end

    ##
    # Delegates with method_missing to @record
    def method_missing(meth, *args, **kwargs, &block)
      return @record.send(meth, *args, **kwargs, &block) if respond_to_missing?(meth)

      super(meth, *args, **kwargs, &block)
    end

    def respond_to_missing?(meth, _include_private = false)
      @record.respond_to?(meth)
    end

    ##
    # Sets record to validate and calls the validation procedure provided in the
    # call method.
    def validate(rec)
      self.record = rec
      call
    end

    # Override this method in subclasses with validation logic, adding errors
    # to the records +errors+ array where necessary.
    def call
      raise NotImplementedError, %(`#{self.class.name}` is missing implementation of
        either `call` or `validate` hence `#{self.class.name}` does not work as an
        instance validator. Define eiter methods to use `#{self.class.name}` as a
        validator.)
    end
  end
end
