class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
      t.references :attachment
      t.string :ar_name, limit: 255
      t.string :en_name, limit: 255
      t.string :tr_name, limit: 255
      t.string :ar_text, limit: 255
      t.string :en_text, limit: 255
      t.string :tr_text, limit: 255
      t.integer :order_position, default: 0
      t.boolean :show_homepage, default: false
      t.timestamps
    end
  end
end
