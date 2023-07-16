class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expenses_groups, dependent: :destroy
  has_many :groups, through: :expenses_groups
  validates :name, presence: true
  validates :amount, numericality: { is_decimal: true }
  attr_accessor :group_id
end
