# == Schema Information
#
# Table name: administrators
#
#  id              :integer          not null, primary key
#  login_name      :string(255)
#  password_digest :string(255)
#  deleted_at      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

class Administrator < ActiveRecord::Base
  require 'bcrypt'

  attr_accessor :password, :password_confirmation, :setting_password
  alias_method :setting_password?, :setting_password

  validates :login_name, presence: true

  validates :password, presence: true,
  confirmation: { allow_blank: true }

  # scope :active, -> { where(deleted_at: nil) }

  before_save do
    if setting_password?
      self.password_digest = BCrypt::Password.create(password)
    end
  end

  def authenticate(raw_password)
    if password_digest && BCrypt::Password.new(password_digest) == raw_password
      self
    else
      false
    end
  end

end
