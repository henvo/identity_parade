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
require 'identity_parade/matchers/boolean_matcher'
require 'identity_parade/matchers/true_class_matcher'
require 'identity_parade/matchers/false_class_matcher'

# This gem allows to compare two types.
module IdentityParade
  class << self
    # :reek:Attribute because we want to share the config
    def config
      @config ||= RecursiveOpenStruct.new
    end

    # Allows to configure the global configuration
    def configure
      yield(config)
    end
  end

  module_function

  # Get the matching score of two basic data types
  #
  # @param left [Number, String, Array, TrueClass, FalseClass] left
  # @param right [Number, String, Array, TrueClass, FalseClass] right
  #
  # @return [Float] the matching score
  def match(left, right)
    IdentityParade::Match.new(left, right).score
  end

  # Checks if a matching score is higher than the globally configure
  # match_score.
  #
  # @param left [Number, String, Array, TrueClass, FalseClass] left
  # @param right [Number, String, Array, TrueClass, FalseClass] right
  #
  # @return [TrueClass, FalseClass] the result
  def match?(left, right)
    match(left, right) >= IdentityParade.config.match_score
  end
end

require 'identity_parade/initializer'
