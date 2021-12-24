# frozen_string_literal: true

RSpec.describe '#event?' do
  # it 'should return true if number is even'
  # it 'should return true if number is odd'
  # if number is... this is context!

  describe 'with even number' do
    it 'should return true' do
      expect(4.even?).to eq(true)
    end
  end

  describe 'with odd number' do
    it 'should return true' do
      expect(3.odd?).to eq(true)
    end
  end
end

# principle: "it" should be simply message.
# output:
# #event?
#   with even number
#     should return true
#   with odd number
#     should return true
