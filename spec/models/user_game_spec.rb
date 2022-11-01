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

    @user = User.create!(gamertag: "sorryIMbad", platform: "x-box", email: "test1@gmail.com")
    @user_2 = User.create!(gamertag: "IMbad", platform: "x-box", email: "test2@gmail.com")

    @usergame1 = UserGame.create!(user_id: @user.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")
    @usergame2 = UserGame.create!(user_id: @user.id, game_id: 2387, image_url: "www.pic.com/image.img", game_title: "Squad")
    @usergame3 = UserGame.create!(user_id: @user.id, game_id: 2323, image_url: "www.pic.com/image.img", game_title: "Scorn")
    @usergame4 = UserGame.create!(user_id: @user.id, game_id: 2356, image_url: "www.pic.com/image.img", game_title: "Rocket Leauge")
    @usergame5 = UserGame.create!(user_id: @user_2.id, game_id: 2343, image_url: "www.pic.com/image.img", game_title: "Halo")

  end

  describe 'class methods' do

  end

  describe 'instance methods' do

    it 'can list user_games by user id' do
    expect(UserGame.list(@user.id).count).to eq(4)
    end

  end
end
