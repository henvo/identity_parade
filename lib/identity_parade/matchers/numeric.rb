module IdentityParade
  module Matchers
    # This matcher checks the similarity of two numerics.
    class Numeric < Matcher
      def score
        [left, right].min / [right, left].max.to_f
      end
    end
  end
end
