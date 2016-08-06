require 'bcrypt'

# A user of the site. Associated with trips.
class User
  include Hanami::Entity

  attributes :name, :email, :password_digest

  def password
    BCrypt::Password.new(self.password_digest)
  end

  def password=(unencrypted)
    self.password_digest = BCrypt::Password.create(unencrypted)
  end

  def password?(unencrypted)
    self.password == unencrypted
  end
end
