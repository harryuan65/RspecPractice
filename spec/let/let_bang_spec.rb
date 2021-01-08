RSpec.describe 'let' do
  describe 'let' do
    let!(:current_time) { Time.now }

    before(:each) do
      puts Time.now
    end

    it "let! is loaded before all it blocks, should not evaluated in this example" do
      puts current_time
      sleep(3)
      puts current_time
    end

    it "should still use the already-evaluated value before it blocks" do
      puts "This is run 3 seconds later"
      puts current_time # => 2021-01-08 14:42:52 +0800
    end
  end
end