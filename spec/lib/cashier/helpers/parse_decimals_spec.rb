# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe ParseDecimals do
  describe 'Parse currency' do
    subject(:currency) { described_class.big_decimal(decimal) }

    context 'with a o like decimal' do
      let(:decimal) { BigDecimal('0') }

      it 'returns a float number' do
        expect(currency).to eq 0.0
      end
    end

    context 'with decimal no t 0' do
      let(:decimal) { BigDecimal('100') }

      it 'returns a float number' do
        expect(currency).to eq 100.0
      end
    end
  end
end
