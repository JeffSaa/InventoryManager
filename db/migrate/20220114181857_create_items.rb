class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity, default: 0
      t.string :description
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
