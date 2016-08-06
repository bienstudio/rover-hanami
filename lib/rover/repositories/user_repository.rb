# Database access for users.
class UserRepository
  include Hanami::Repository

  # Finds the first user associated with an email.
  #
  # @param [String] email The email to query.
  # @return [User,NilClass] The first user found or nil.
  def self.find_by_email(email)
    query { where(email: email) }.first
  end

  def self.authenticate(email:, password:)
    user = find_by_email(email)

    return nil unless user
    return nil unless user.password?(password)

    user
  end
end
