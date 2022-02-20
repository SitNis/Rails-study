class RemoveRulesFromBadge < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :rules, :string
  end
end
