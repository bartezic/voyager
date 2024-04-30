class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.references :owner, null: false, index: true

      t.timestamps
    end
    add_foreign_key :teams, :users, column: :owner_id
  end
end
