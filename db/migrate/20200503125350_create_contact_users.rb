class CreateContactUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_users do |t|
      t.string :name, limit: 255
      t.string :email, limit: 255
      t.string :phone, limit: 20
      t.string :subject, limit: 255
      t.string :service, limit: 255
      t.text :message, limit: 1000
      t.timestamps
    end
  end
end
