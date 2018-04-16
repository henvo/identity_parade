require 'fuzzystringmatch'

module IdentityParade
  module Matchers
    # This matcher checks the similarity of two strings.
    class StringMatcher < Matcher
      def score
        jarow.getDistance(left.to_s, right.to_s)
      end

      def jarow
        FuzzyStringMatch::JaroWinkler.create(:native)
      end
    end
  end
end
