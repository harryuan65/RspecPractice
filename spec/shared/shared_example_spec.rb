puts <<~DOC
  \e[36m
  The include_examples method injects predefined examples into an example group.
  RSpec.describe Array do
    subject { [1, 2, 3] }

    \e[33mit 'returns the number of items' do
      expect(subject.length).to eq(3)
    end\e[36m
  end

  RSpec.describe String do
    subject { 'abb' }

    \e[33mit 'returns the number of items' do
      expect(subject.length).to eq(3)  => duplicated
    end\e[36m
  end

  RSpec.describe Hash do
    subject { { a: 1, b: 2, c: 3 } }

    \e[33mit 'returns the number of items' do
      expect(subject.length).to eq(3)  => duplicated
    end\e[36m
  end

  class SausageLink
    def length
      3
    end
  end

  RSpec.describe SausageLink  do
    \e[33mit 'returns the number of items' do
      expect(subject.length).to eq(3)  => duplicated
    end\e[0m
  end
DOC

RSpec.shared_examples 'a Ruby object with three elements' do
  it 'returns the number of items' do
    expect(subject.length).to eq(3) # Dynamically loaded, because it is a method!
  end
end

RSpec.describe Array do
  subject { [1, 2, 3] }
  include_examples 'a Ruby object with three elements'
end

RSpec.describe String do
  subject { 'abb' }
  include_examples 'a Ruby object with three elements'
end

RSpec.describe Hash do
  subject { { a: 1, b: 2, c: 3 } }
  include_examples 'a Ruby object with three elements'
end

class SausageLink
  def length
    3
  end
end

# 這邊忍術xD，利用 subject 會自動 .new 所以不用明講 subject
RSpec.describe SausageLink do
  include_examples 'a Ruby object with three elements'
end

RSpec.shared_examples 'able to add two elements' do |param1, param2|
  it "#{param1} can add #{param2}" do
    expect(param1).to respond_to(:+).with(1).argument
    expect(param1 + param2).to be_truthy
  end
end

RSpec.describe String do
  include_examples 'able to add two elements', 'harry', 'jack'
end

RSpec.describe Integer do
  include_examples 'able to add two elements', 1, 2
end

class Summary
  attr_accessor :total

  def initialize(total)
    @total = total
  end

  def +(other)
    @total += other.total
    puts Rainbow("\tNow total is #{@total}").green.underline
    @total
  end
end

RSpec.describe Summary do
  include_examples 'able to add two elements', Summary.new(1), Summary.new(3)
end
