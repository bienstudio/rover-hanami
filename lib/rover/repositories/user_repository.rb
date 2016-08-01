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
end
