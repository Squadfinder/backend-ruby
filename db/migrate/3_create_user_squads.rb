class CreateUserSquads < ActiveRecord::Migration[5.2]
  def change
    create_table :user_squads do |t|
      t.references :user, foreign_key: true
      t.references :squad, foreign_key: true
      t.integer :host_id
      t.integer :status, :default => 'pending'

      t.timestamps
    end
  end
end
