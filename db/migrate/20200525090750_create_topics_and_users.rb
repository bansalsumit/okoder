class CreateTopicsAndUsers < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
      t.belongs_to :topic
      t.belongs_to :user
    end
  end
end
