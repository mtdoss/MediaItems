class AddPrivateToItems < ActiveRecord::Migration
  def change
    add_column :items, :private, :boolean, default: false
  end
end
