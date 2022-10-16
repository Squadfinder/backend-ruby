require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:game_id) }
    it { should validate_numericality_of(:game_id).is_a?(Integer) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:game_title) }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
