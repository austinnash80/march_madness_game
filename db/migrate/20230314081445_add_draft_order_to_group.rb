class AddDraftOrderToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :draft_order, :string
  end
end
