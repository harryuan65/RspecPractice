# One of the most powerful matcher.

RSpec.describe 'satisfy matcher' do
  subject { 'racecar' } # Palindrome
  it 'is a palindrome' do
    expect(subject).to(satisfy { |value| value == value.reverse })
  end

  it 'can accept a custom error message' do
    # raise "expected "racecar" to be a palindrome" when failed
    expect(subject).to satisfy('be a palindrome') do |value|
      value == value.reverse
    end
  end
end
