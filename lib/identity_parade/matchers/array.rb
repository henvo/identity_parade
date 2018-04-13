module IdentityParade
  module Matchers
    # This matcher checks the similarity of two arrays. For this purpose, it
    # iterates over all elements and creates a new matcher for every type.
    class Array < Matcher
      def score
        sum / left.size.to_f
      end

      def sum
        left.map.with_index do |item, index|
          right_element = right[index]

          next 0 unless right_element

          IdentityParade::Match.new(item, right_element).score
        end.sum
      end
    end
  end
end
