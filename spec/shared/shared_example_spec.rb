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
