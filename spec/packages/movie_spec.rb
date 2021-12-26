class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def light_on_fire
    'SHAZAM!'
  end

  def confront
    'YOU SHALL NOT PASS'
  end

  def fall_off_ladder
    'GANDALF, NOOOOOOOOOOO'
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if actor.ready?
      puts actor.light_on_fire # only cares about if this guy can light_on_fire/confront/fall_off_ladder
      puts actor.confront
      puts actor.fall_off_ladder
    end
  end
end

# actor = Actor.new('Ian McKellen')
# movie = Movie.new(actor)
# movie.start_shooting

RSpec.describe Movie do
  before(:all) do
    puts <<-DOC
      \e[33m Movie uses an instance of Actor to shoot.
      \e[36m
        The movie can ask actor to do 3 actions.
        Since we are testing the Movie, we don't want the Actor to be an encumbrance.
        Instead we create a test double to simulate an instance of Actor.
      \e[0m
    DOC
  end

  let(:stuntman) do
    double('Mr. Danger', ready?: true, light_on_fire: 'any string', confront: 'any string',
                         fall_off_ladder: 'any string')
  end

  subject { described_class.new(stuntman) }

  describe '#start_shooting' do
    it 'can ask the actor to do 3 methods' do
      # run expectations before the spec is running
      expect(stuntman).to receive(:ready?)
      expect(stuntman).to receive(:light_on_fire)
      expect(stuntman).to receive(:confront)
      expect(stuntman).to receive(:fall_off_ladder)
      subject.start_shooting
    end
  end
end
