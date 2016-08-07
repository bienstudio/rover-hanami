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

  def viewable_by?(_user)
    self == _user
  end

  def creatable_by?(_user)
    true
  end

  def updatable_by?(_user)
    self == _user
  end

  def destroyable_by?(_user)
    self == _user
  end

  def ==(_user)
    self.email == _user.email
  end
end
