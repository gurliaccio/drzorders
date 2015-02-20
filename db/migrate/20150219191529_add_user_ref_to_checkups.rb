class AddUserRefToCheckups < ActiveRecord::Migration
  def change
    add_reference :checkups, :user, index: true
    add_foreign_key :checkups, :users
  end
end
