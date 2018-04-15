module IdentityParade
  module Matchers
    # This matcher checks the similarity of two numerics.
    class NumericMatcher < Matcher
      def score
        return 1 if max == min
        return 0 if max.zero?

        min / max
      end

      def max
        floats.max
      end

      def min
        floats.min
      end

      def floats
        [left.to_f, right.to_f]
      end
    end
  end
end
