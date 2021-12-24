RSpec.describe 'include matcher' do
  before(:all) do
    puts <<-DOC
      \e[36m String, Array, Hash that has #include? can use:\e[33m
      #include(*arg)
      \e[0m
    DOC
  end

  describe 'hot chocolate' do
    it 'check inclusion of string' do
      expect(subject).to include('hot')
      expect(subject).to include('oco')
    end

    it { is_expected.to include('hot') }
  end

  describe [10, 20, 30] do
    it 'check inclusion in the array, Does Not care Ordering' do
      expect(subject).to include(10)
      expect(subject).to include(10, 20)
      expect(subject).to include(20, 10)
      expect(subject).to include(20, 10, 30)
    end
  end

  describe({ name: 'harry', role: 'Rails Developer' }) do
    it 'checks inclusion in the hash, for key existence' do
      expect(subject).to include(:name)
      expect(subject).to include(:role)
      expect(subject).to include(:name, :role)
    end

    it 'checks inclusion in the hash, for key-value pair' do
      expect(subject).to include(name: 'harry')
      expect(subject).to include(role: 'Rails Developer')
    end

    it { is_expected.to include(name: 'harry') }
  end
end
