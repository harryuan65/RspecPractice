RSpec.describe 'double spec' do
  before(:all) do
    puts <<-DOC
      \e[33m Mocking: emulate something, close enough to be the real thing.
      \e[36m
        Sometimes complex class/methods are coupled together, apart from testing it as a whole (integration test),
        we also want to test it individually.
        \e[33m#double('identifier', method1: return_val1, method2: return_val2,...) \e[36m : creates a TestDouble that acts like a stuntman or ditto
        it is a strict double, if you call an undefined method it will raise: received unexpected message
      \e[0m
    DOC
  end

  it 'only allows defined methods to be invoked' do
    stuntman = double('Mr. Danger', fall_off_ladder: 'Ouch!', light_on_fire: 'Ouch!')
    expect(stuntman.fall_off_ladder).to eq('Ouch!')
    expect(stuntman.light_on_fire).to eq('Ouch!')
  end

  it 'only #allow-ed defined methods to be invoked' do
    stuntman = double('Mr. Danger')
    allow(stuntman).to receive(:do_nothing)
    expect(stuntman.do_nothing).to be_nil

    allow(stuntman).to receive(:fall_off_ladder).and_return 'Ouch!'
    expect(stuntman.fall_off_ladder).to eq('Ouch!')
  end

  it 'only #allow-ed MULTIPLE defined methods to be invoked' do
    stuntman = double('Mr. Danger')
    allow(stuntman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to eq(true)
  end
end
