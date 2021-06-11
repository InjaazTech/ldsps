class AddEnCoverToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :en_attachment_id, :bigint
  end
end
