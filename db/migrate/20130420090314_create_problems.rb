class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :account
      t.string :name
      t.integer :points

      t.timestamps
    end
    add_index :problems, :account_id
  end
end
