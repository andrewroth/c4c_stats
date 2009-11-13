# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stats_session',
  :secret      => '17f2ed096f7a9821f72649bd04c1b429a801ccfe0af4f1e4d3ed716926e96a8e1cfa2b6cdb5521425c70d87dad3053a1878f61213bb8acbb2eaac4773286b9bb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
