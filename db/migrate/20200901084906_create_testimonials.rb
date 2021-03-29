class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.string :ar_name, limit: 255
      t.string :en_name, limit: 255
      t.string :tr_name, limit: 255

      t.string :ar_position, limit: 255
      t.string :en_position, limit: 255
      t.string :tr_position, limit: 255

      t.string :ar_text, limit: 255
      t.string :en_text, limit: 255
      t.string :tr_text, limit: 255

      t.integer :order_position, default: 0
      
      t.timestamps
    end
  end
end
