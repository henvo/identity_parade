module IdentityParade
  module Matchers
    # This matcher checks the similarity of two hashes. For this purpose, it
    # iterates over all elements and creates a new matcher for every type.
    class Hash < Matcher
      def score
        sum / left.keys.size.to_f
      end

      # @return [Float] The sum of all sub scores
      def sum
        left.map do |key, value|
          next nil if blacklist.include?(key)

          right_val = right[key]

          next 0 unless right_val

          IdentityParade::Match.new(value, right_val).score
        end.compact.sum
      end

      # @return [Array<String>] the list of blacklisted keys
      # :reek:UtilityFunction because it's a shorthand
      def blacklist
        IdentityParade.config.blacklisted_keys
      end
    end
  end
end
