class CustomError < StandardError; end

RSpec.describe 'raise_error matcher' do
  def some_method
    x
  end

  it 'should raise a specific error' do
    # NOTE: This Fails before assertion!!! because some_method is called first
    # expect(some_method).to raise_error(NameError)
    expect { some_method }.to raise_error(NameError)
    expect { 10 / 0 }.to raise_error(ZeroDivisionError)
    expect { raise CustomError }.to raise_error(CustomError)
  end
end
