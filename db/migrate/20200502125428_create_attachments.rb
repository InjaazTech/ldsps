class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :upload
      t.string :t, limit: 20
      t.references :user
      t.timestamps
    end
  end
end
