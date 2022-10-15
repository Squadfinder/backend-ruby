class CreateSquad < ActiveRecord::Migration[5.2]
  def change
    create_table :squads do |t|
      t.string :game
      t.string :day
      t.string :time
      t.integer :number_players
      t.boolean :competitive

      t.timestamps
    end
  end
end
