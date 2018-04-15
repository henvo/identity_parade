# frozen_string_literal: true

require 'json'
require 'spec_helper'

RSpec.describe IdentityParade do
  let(:dummies) do
    JSON.parse(File.read('spec/fixtures/files/dummies.json'))
  end

  let(:addresses) do
    JSON.parse(File.read('spec/fixtures/files/addresses.json'))
  end

  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.match' do
    context 'when two identical elements are given' do
      it 'returns 1.0' do
        expect(described_class.match(dummies.first, dummies.first))
          .to eq(1.0)
      end
    end

    context 'when two different elements are given' do
      it 'returns a number between 0 and 1' do
        expect(described_class.match(dummies.first, dummies.last))
          .to be_between(0, 1)
      end
    end

    context 'when hash contains blacklisted item' do
      before do
        described_class.configure do |config|
          config.blacklisted_keys << 'foo'
        end
      end

      it 'ignores the key' do
        expect(described_class.match({ foo: 1, bar: 2 }, { foo: 4, bar: 2 }))
          .to eq(1)
      end
    end

    context 'when no matcher is available' do
      let(:created_at) { Time.now }

      it 'returns nil' do
        expect(described_class.match(created_at, created_at))
          .to eq(nil)
      end
    end
  end

  describe '.match?' do
    context 'when two identical elements are given' do
      it 'is true' do
        expect(described_class.match?(dummies.first, dummies.first))
          .to eq(true)
      end
    end

    context 'when completely different elements are given' do
      it 'is false' do
        expect(described_class.match?(dummies.first, {}))
          .to eq(false)
      end
    end
  end
end
