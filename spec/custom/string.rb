# frozen_string_literal: true

RSpec.describe String do
  describe "String.new" do
    context "If it has initial value" do
      it "should an empty string" do
        initial_value = "123"
        string = String.new(initial_value)
        expect(string).not_to eq("")
        expect(string).to be_instance_of(String)
      end
    end
    context "If NO initial value" do
      it "should an empty string" do
        expect(String.new).to eq("")
      end
    end
  end
end