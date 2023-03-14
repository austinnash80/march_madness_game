class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :seed
      t.string :region
      t.boolean :w1
      t.boolean :w2
      t.boolean :w3
      t.boolean :w4
      t.boolean :w5
      t.boolean :w6

      t.timestamps
    end
  end
end
