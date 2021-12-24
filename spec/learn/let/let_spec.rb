# frozen_string_literal: true

RSpec.describe 'let' do
  describe 'let' do
    let(:current_time) { Time.now }

    before(:each) do
      puts "==== Example ===="
    end

    it "should be evaluated only once in this example(because lazy-evaluated)" do
      puts <<~DOC
        * 這邊會讀取一次
        current_time = #{current_time}
      DOC

      sleep(3)
      puts "* 睡了三秒"

      puts <<~DOC
        * 這邊不讀取，用cache的資料
        current_time = #{current_time}
      DOC
    end

    it "it should be evaluated again in this example" do
      puts "這邊會讀取一次"
      puts current_time
    end
  end
end