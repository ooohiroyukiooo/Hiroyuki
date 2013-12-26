class AdminPasswordAuthenticator
  class << self
    def verify(login, password)
      return false unless login.present? && password.present?
      admin = Administrator.find_by_login_name(login)
      admin && admin.authenticate(password)
    end
  end
end
