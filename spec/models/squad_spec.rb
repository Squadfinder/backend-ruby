require 'rails_helper'

RSpec.describe Squad, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:event_time) }
    it { should validate_presence_of(:number_players) }
    it { should validate_numericality_of(:number_players).is_a?(Integer) }
    it { should validate_inclusion_of(:competitive).in_array([true, false]) }
  end

  describe 'relationships' do
    it { should have_many :user_squads }
    it { should have_many(:users).through(:user_squads) }
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
