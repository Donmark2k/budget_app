class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses_groups, dependent: :destroy
  has_many :expenses, through: :expenses_groups
  validates :name, :icon, presence: true
end
