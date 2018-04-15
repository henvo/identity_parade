require 'recursive-open-struct'
require 'active_support/all'

require 'identity_parade/version'
require 'identity_parade/match'
require 'identity_parade/matcher'
require 'identity_parade/matchers/hash_matcher'
require 'identity_parade/matchers/string_matcher'
require 'identity_parade/matchers/array_matcher'
require 'identity_parade/matchers/numeric_matcher'
require 'identity_parade/matchers/integer_matcher'
require 'identity_parade/matchers/float_matcher'

# This gem allows to compare two types.
module IdentityParade
  class << self
    # :reek;Attribute because we want to share the config
    def config
      @config ||= RecursiveOpenStruct.new
    end

    def configure
      yield(config)
    end
  end

  module_function

  def match(left, right)
    IdentityParade::Match.new(left, right).score
  end

  def match?(left, right)
    match(left, right) >= IdentityParade.config.match_score
  end
end

require 'identity_parade/initializer'
