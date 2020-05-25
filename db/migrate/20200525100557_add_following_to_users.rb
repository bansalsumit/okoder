class AddFollowingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :follow, :integer, array: true, default: []
  end
end
