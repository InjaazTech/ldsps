class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.references :post, :attachment
      t.timestamps
    end
  end
end
