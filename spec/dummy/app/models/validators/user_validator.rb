class UserValidator < ApplicationValidator
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_each :password_digest do |record, attr, value|
    record.errors.add(attr, :presence, message: 'must exists') if value.blank?
  end
  validates_with self
  validate :email_extra, :digest_extra

  def email_extra
    errors.add(:base, :email_extra, message: 'Additional custom validation message when email is blank') if email.blank?
  end

  def digest_extra
    errors.add(:base, :digest_extra, message: 'Additional custom validation message when digest is blank') if password_digest.blank?
  end

  def call
    errors.add(:composition, :logic, message: 'Composite validation renders record invalid!')
  end
end