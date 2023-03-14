class AddFieldsToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :auto_draft_complete, :boolean
    add_column :groups, :live_draft_complete, :boolean
  end
end
