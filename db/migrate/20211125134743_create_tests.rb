class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, defualt: 0
      t.references :tests, :user, foreign_key: true, null: false
      t.references :tests, :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
