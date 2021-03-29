class CreateFaQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :fa_questions do |t|
      t.string :ar_question, limit: 500
      t.string :en_question, limit: 500
      t.string :tr_question, limit: 500
      t.text :ar_answer, limit: 2000
      t.text :en_answer, limit: 2000
      t.text :tr_answer, limit: 2000
      t.integer :order_position, default: 0
      t.boolean :hidden, default: false
      t.timestamps
    end
  end
end
