# A trip is the central unit in Rover. It defines the actual trip, has many
# activities, and belongs to a user.
class Trip
  include Hanami::Entity

  attributes :name, :start_date, :end_date, :user_id

  # Returns the user that owns this trip.
  #
  # @return [User] The owner.
  def user
    UserRepository.find(self.user_id)
  end

  # Sets the user that owns this trip.
  #
  # @param [User] _user The new owner.
  # @return [User] The user back to you.
  def user=(_user)
    self.user_id = _user.id
  end
end
