RSpec.describe 'let' do
  describe 'let' do
    let!(:current_time) { Time.now }

    before(:each) do
      puts <<~DOC
        ======================
            Example 開始
        ======================
      DOC
    end

    it "should still use the already-evaluated value before it blocks" do
      sleep(2)
      puts <<~DOC
        * 睡了兩秒
          current_time = #{current_time} (這個是在it以前就讀取的!)
          Time.now = #{Time.now}
      DOC
    end
  end
end