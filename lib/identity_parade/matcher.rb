module IdentityParade
  # The base class for all matchers implements the basic interface for all
  # matchers.
  #
  # Every matcher MUST implement a score method that returns a Number.
  class Matcher
    attr_reader :left, :right

    def initialize(left, right)
      @left = left
      @right = right
    end

    def score
      raise NotImplementedError
    end
  end
end
