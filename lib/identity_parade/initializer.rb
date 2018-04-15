# frozen_string_literal: true

# Set some basic configuration settings. This can be overwritten in the
# application in the same fashion.
IdentityParade.configure do |config|
  config.blacklisted_keys = []
  config.match_score = 0.5
end
