class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :post_type, :attachment
      t.string :ar_title, limit: 255
      t.string :en_title, limit: 255
      t.string :tr_title, limit: 255
      t.string :ar_slug, limit: 255, index: true
      t.string :en_slug, limit: 255, index: true
      t.string :tr_slug, limit: 255, index: true
      t.string :ar_subtitle, limit: 255
      t.string :en_subtitle, limit: 255
      t.string :tr_subtitle, limit: 255
      t.text :ar_content
      t.text :en_content
      t.text :tr_content
      t.integer :order_position, default: 0
      t.boolean :is_published, default: false
      t.timestamps
    end
  end
end
