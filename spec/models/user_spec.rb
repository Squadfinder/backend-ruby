require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:gamertag) }
    it { should validate_presence_of(:platform) }
  end

  describe 'relationships' do
    it { should have_many :user_squads }
    it { should have_many(:squads).through(:user_squads) }
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
