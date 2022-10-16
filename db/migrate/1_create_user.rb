class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :gamertag
      t.string :platform
      
      t.timestamps
    end
  end
end
