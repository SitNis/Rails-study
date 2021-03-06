class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, defualt: 0
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end

    add_index :tests, %i[title level], unique: true
  end
end
