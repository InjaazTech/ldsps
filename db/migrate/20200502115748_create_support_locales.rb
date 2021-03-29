class CreateSupportLocales < ActiveRecord::Migration[5.2]
  def change
    create_table :support_locales do |t|
      t.string :ar_title, limit: 255
      t.string :en_title, limit: 255
      t.string :tr_title, limit: 255
      t.string :iso_code, limit: 3, index: true
      t.timestamps
    end
  end
end
