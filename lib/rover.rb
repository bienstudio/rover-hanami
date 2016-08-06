require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/rover/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * File System adapter
  #    adapter type: :file_system, uri: 'file:///db/bookshelf_development'
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/rover_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/rover_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/rover_development'
  #    adapter type: :sql, uri: 'mysql://localhost/rover_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  mapping do
    collection :users do
      entity      User
      repository  UserRepository

      attribute :id,              Integer
      attribute :name,            String
      attribute :email,           String
      attribute :password_digest, String
    end

    collection :trips do
      entity      Trip
      repository  TripRepository

      attribute :id,          Integer
      attribute :name,        String
      attribute :start_date,  Date
      attribute :end_date,    Date
      attribute :user_id,     Integer
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/rover/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
