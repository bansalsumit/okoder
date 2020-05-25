class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.references :topic, index: true, foreign_key: true
    end
  end
end
