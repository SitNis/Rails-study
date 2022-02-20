class AddRuleParameterToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_parameter, :string
  end
end
