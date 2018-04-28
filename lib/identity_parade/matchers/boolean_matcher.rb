module IdentityParade
  module Matchers
    # This matcher checks the similarity of booleans
    class BooleanMatcher < Matcher
      def score
        @left.class == @right.class ? 1 : 0
      end
    end
  end
end
