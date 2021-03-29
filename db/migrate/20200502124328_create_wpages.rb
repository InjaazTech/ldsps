class CreateWpages < ActiveRecord::Migration[5.2]
  def change
    create_table :wpages do |t|
      t.string :ar_title, limit: 255
      t.string :en_title, limit: 255
      t.string :tr_title, limit: 255
      t.string :ar_slug, limit: 255, index: true
      t.string :en_slug, limit: 255, index: true
      t.string :tr_slug, limit: 255, index: true
      t.text :ar_content
      t.text :en_content
      t.text :tr_content
      t.boolean :show_header, default: false
      t.boolean :show_footer, default: false
      t.timestamps
    end
  end
end
