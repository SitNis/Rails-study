class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :test_passage, foreign_key: true, null: false
      t.references :question, null: false, foreign_key: true
      t.string :url, null: false, default: ''
      t.string :user_email, null: false, default: ''

      t.timestamps
    end
  end
end
