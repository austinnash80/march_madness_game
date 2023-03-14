class CreatePicks < ActiveRecord::Migration[7.0]
  def change
    create_table :picks do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :school_id

      t.timestamps
    end
  end
end
