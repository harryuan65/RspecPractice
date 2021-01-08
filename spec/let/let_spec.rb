RSpec.describe 'let' do
  describe 'let' do
    let(:current_time) { Time.now }

    it "should be evaluated only once in this example(because lazy-evaluated)" do
      puts current_time # => 2021-01-08 14:42:49 +0800

      sleep(3)

      puts current_time # => 2021-01-08 14:42:49 +0800
    end

    it "it should be evaluated again in this example" do
      puts "This is run 3 seconds later"
      puts current_time # => 2021-01-08 14:42:52 +0800
    end
  end
end