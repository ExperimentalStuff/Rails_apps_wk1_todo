class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :content
      t.boolean :status
      t.integer :event_order

      t.timestamps null: false
    end
  end
end
