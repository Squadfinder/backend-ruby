class CreateSquad < ActiveRecord::Migration[5.2]
  def change
    create_table :squads do |t|
      t.string :game
      t.datetime :event_time
      t.integer :number_players, :default => 4
      t.boolean :competitive
      
      t.timestamps
    end
  end
end
