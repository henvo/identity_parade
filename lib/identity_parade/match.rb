# frozen_string_literal: true

module IdentityParade
  # The initial starting point for a matching.
  class Match
    def initialize(left, right)
      @left = left
      @right = right
    end

    def score
      return Matchers::Hash.new(@left, @right).score if @left.is_a? Hash
      return Matchers::Array.new(@left, @right).score if @left.is_a? Array
      return Matchers::Numeric.new(@left, @right).score if @left.is_a? Numeric
      return Matchers::String.new(@left, @right).score if @left.is_a? String
    end
  end
end
