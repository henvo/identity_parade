# frozen_string_literal: true

require 'spec_helper'

RSpec.describe IdentityParade::Matchers::HashMatcher do
  context 'when hash has no keys' do
    it 'returns nil' do
      expect(IdentityParade.match({}, {})).to eq(nil)
    end
  end
end
