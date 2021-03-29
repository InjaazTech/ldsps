class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.references :attachment
      t.string :link, limit: 255
      t.string :ar_link_title, limit: 255
      t.string :en_link_title, limit: 255
      t.string :tr_link_title, limit: 255
      t.string :ar_title, limit: 255
      t.string :en_title, limit: 255
      t.string :tr_subtitle, limit: 255
      t.string :ar_subtitle, limit: 255
      t.string :en_subtitle, limit: 255
      t.string :tr_title, limit: 255
      t.integer :order_position, default: 0
      t.boolean :hidden, default: false
      t.timestamps
    end
  end
end
