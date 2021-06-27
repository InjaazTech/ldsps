class AddExtraFields < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :custom_date, :date
    add_column :wpages, :ar_subtitle, :string, limit: 1000
    add_column :wpages, :en_subtitle, :string, limit: 1000
    add_column :wpages, :tr_subtitle, :string, limit: 1000
  end
end
