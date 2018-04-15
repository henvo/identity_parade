module IdentityParade
  module Matchers
    # This matcher checks the similarity of two arrays. For this purpose, it
    # iterates over all elements and creates a new matcher for every type.
    class ArrayMatcher < Matcher
      def score
        return if left.empty?
        return 0 unless right.is_a? Array

        1 - ((left - right).size / left.size.to_f)
      end
    end
  end
end
