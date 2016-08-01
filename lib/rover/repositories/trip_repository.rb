# Database access for trips.
class TripRepository
  include Hanami::Repository

  # A query for all trips belonging to a user.
  #
  # @param [User] user The owning user.
  # @return [Hanami::Model::Adapters::Sql::Query] The query object.
  def self.for_user(user)
    query { where(user_id: user.id) }
  end
end
