# frozen_string_literal: true

module IdentityParade
  module Matchers
    # This matcher checks the similarity of two hashes. For this purpose, it
    # iterates over all elements and creates a new matcher for every type.
    class HashMatcher < Matcher
      def score
        sub_scores.sum / sub_scores.size.to_f
      end

      # @return [Float] The sum of all sub scores
      def sub_scores
        left.map do |key, value|
          next nil if blacklisted_keys.include?(key.to_s)

          next 0 unless right.key?(key)

          IdentityParade::Match.new(value, right[key]).score
        end.compact
      end

      # @return [Array<String>] the list of blacklisted keys
      # :reek:UtilityFunction because it's a shorthand
      def blacklisted_keys
        IdentityParade.config.blacklisted_keys
      end

      # @return [Array<String>] the list of permitted keys
      def permitted_keys
        left.keys.map(&:to_s) - blacklisted_keys
      end
    end
  end
end
