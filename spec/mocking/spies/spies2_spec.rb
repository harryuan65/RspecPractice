class Car
  def initialize(model)
    @model = model
  end
end

class Garage
  attr_reader :storage

  def initialize
    @storage = []
  end

  def add_to_collection(model)
    @storage << Car.new(model) # need to fake the Car.new and instance
  end
end

RSpec.describe Garage do
  let(:car) { instance_double(Car) }

  before do
    allow(Car).to receive(:new).and_return(car) # don't actually do #new and return a car instance, since we are not testing Car
  end

  it 'adds car to its storage' do
    subject.add_to_collection('Honda Civic')

    # 1. Car has received new
    expect(Car).to have_received(:new).with('Honda Civic')
    # 2. storage contains 'Honda Civic
    expect(subject.storage.length).to eq(1)
    expect(subject.storage.first).to eq(car)
    expect(subject.storage).to contain_exactly(car)
  end
end

RSpec.describe Garage do
  let(:car) { instance_double(Car) }

  before do
    @car_klass = class_double(Car, new: car).as_stubbed_const
  end

  it 'adds car to its storage' do
    subject.add_to_collection('Honda Civic')

    # 1. Car has received new
    expect(@car_klass).to have_received(:new).with('Honda Civic')
    # 2. storage contains 'Honda Civic
    expect(subject.storage.length).to eq(1)
    expect(subject.storage.first).to eq(car)
    expect(subject.storage).to contain_exactly(car)
  end
end
