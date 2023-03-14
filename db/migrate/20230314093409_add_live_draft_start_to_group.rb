class AddLiveDraftStartToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :live_draft_start, :boolean
    add_column :groups, :auto_draft_start, :boolean
  end
end
