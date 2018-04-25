module IdentityParade
  module Matchers
    # This matcher checks the similarity of booleans
    class BooleanMatcher < Matcher
      def score
        return 0 unless [TrueClass, FalseClass].include?(@right.class)

        @left == @right ? 1 : 0
      end
    end
  end
end
