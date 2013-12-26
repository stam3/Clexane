# Be sure to restart your server when you modify this file.

Clexane::Application.config.session_store :cookie_store, key: '_clexane_session', :expire_after => 60.minutes 
#20.years.from_now.utc #30.minutes

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Clexane::Application.config.session_store :active_record_store
