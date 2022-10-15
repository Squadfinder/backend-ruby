require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:gamertag) }
  end

  describe 'relationships' do

  end

  before :each do

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
