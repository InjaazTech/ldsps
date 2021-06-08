class IncreaseLimitWesiteConfig < ActiveRecord::Migration[6.1]
  def change
    change_column :website_configs, :val, :string, limit: 1000
  end
end
