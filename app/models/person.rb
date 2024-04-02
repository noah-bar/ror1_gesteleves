class Person < ApplicationRecord
  has_secure_password
  before_save :downcase_email
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  def full_name
    first_name + " " + last_name
  end

  def is_teacher?
    type == 'Teacher'
  end

  def is_student?
    type == 'Student'
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
