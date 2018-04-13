require 'fuzzystringmatch'

module IdentityParade
  module Matchers
    # This matcher checks the similarity of two strings.
    class String < Matcher
      def score
        jarow.getDistance(left, right)
      end

      def jarow
        FuzzyStringMatch::JaroWinkler.create(:native)
      end
    end
  end
end
