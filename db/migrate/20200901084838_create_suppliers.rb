class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.references :attachment
      t.string :link
      t.integer :order_position, default: 0
      t.timestamps
    end
  end
end
