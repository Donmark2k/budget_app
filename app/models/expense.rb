class Expense < ApplicationRecord
    belongs_to :author
  has_many :expenses_groups, dependent: :destroy
  has_many :groups, through: :expenses_groups
end
