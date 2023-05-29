class ExpensesGroup < ApplicationRecord
  belongs_to :group
  belongs_to :expenses
end

