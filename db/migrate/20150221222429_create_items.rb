class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :ttype, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
