require 'rails_helper'

RSpec.describe UserSquad, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:squad_id) }
    it { should validate_numericality_of(:user_id) }
    it { should validate_numericality_of(:squad_id) }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :squad }
  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
