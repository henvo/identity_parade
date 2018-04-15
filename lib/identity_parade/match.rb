# frozen_string_literal: true

module IdentityParade
  # The initial starting point for a matching.
  class Match
    def initialize(left, right)
      @left = left
      @right = right
    end

    def score
      return unless Kernel.const_defined?(matcher_class_name)

      matcher.new(@left, @right).score
    end

    def matcher
      matcher_class_name.constantize
    end

    def matcher_class_name
      "identity_parade/matchers/#{@left.class}_matcher".classify
    end
  end
end
