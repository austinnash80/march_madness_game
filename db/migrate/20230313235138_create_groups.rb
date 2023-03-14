class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :buy_in
      t.string :note_1
      t.string :note_2

      t.timestamps
    end
  end
end
