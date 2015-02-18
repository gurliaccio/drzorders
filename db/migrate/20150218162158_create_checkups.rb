class CreateCheckups < ActiveRecord::Migration
  def change
    create_table :checkups do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
