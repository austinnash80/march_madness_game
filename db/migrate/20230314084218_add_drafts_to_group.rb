class AddDraftsToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :draft_order_1, :integer
    add_column :groups, :draft_order_2, :integer
    add_column :groups, :draft_order_3, :integer
    add_column :groups, :draft_order_4, :integer
  end
end
