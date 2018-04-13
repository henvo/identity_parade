module IdentityParade
  # The base class for all matchers
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
