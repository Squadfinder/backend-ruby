class CreateUserGames < ActiveRecord::Migration[5.2]
  def change
    create_table :user_games do |t|
      t.references :user, foreign_key: true
      t.integer :game_id

      t.timestamps
    end
  end
end
