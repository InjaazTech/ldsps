class CreatePostTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_types do |t|
      t.string :ar_title, limit: 255
      t.string :en_title, limit: 255
      t.string :tr_title, limit: 255
      t.string :slug, limit: 50, index: true
      t.timestamps
    end
  end
end
