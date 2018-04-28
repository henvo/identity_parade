# frozen_string_literal: true

module IdentityParade
  # The initial starting point for a matching.
  class Match
    def initialize(left, right)
      @left = left
      @right = right
    end

    # @return [Float] the matching score
    def score
      return unless Kernel.const_defined?(matcher_class_name)

      matcher.new(@left, @right).score
    end

    # @return [Class] The matcher class
    def matcher
      matcher_class_name.constantize
    end

    # @return [String] the matcher class name
    def matcher_class_name
      "identity_parade/matchers/#{@left.class.name.underscore}_matcher".classify
    end
  end
end
