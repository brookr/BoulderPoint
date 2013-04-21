class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user
      t.references :problem
      t.string :notes

      t.timestamps
    end
    add_index :routes, :user_id
    add_index :routes, :problem_id
  end
end
