class FixExpensesGroupsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses_groups, :expenses_id, :expense_id
  end
end
