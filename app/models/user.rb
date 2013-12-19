# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login_name      :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  validate :password, presence: { on: :create },
    confirmation: { allow_blank: true }

  def password=(val)
    if val.present?
      self.password_digest = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def authenticate(name, password)
      user = User.find_by_login_name(name)
      if user && user.password_digest.present? &&
          BCrypt::Password.new(user.password_digest) == password
        user
      else
       nil
      end
    end
  end


end
