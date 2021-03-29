class CreateWebsiteConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :website_configs do |t|
      t.string :ar_title, limit: 255
      t.string :en_title, limit: 255
      t.string :tr_title, limit: 255
      t.string :slug, limit: 255, index: true
      t.string :val, limit: 255
      t.string :t, limit: 10, default: 'text'
      t.timestamps
    end
  end
end
