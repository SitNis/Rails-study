class AddRuleTypeToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_type, :string
  end
end
