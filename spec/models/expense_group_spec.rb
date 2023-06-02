require 'rails_helper'

RSpec.describe ExpensesGroup, type: :model do
  before(:each) do
    @user = User.create(name: 'Rita Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @group = Group.create(name: 'Food', icon: 'food_icon.png', user_id: @user.id)
    @expense = Expense.create(name: 'Test expense', amount: 100, author_id: @user.id)
    @expense_group = ExpensesGroup.create(expense_id: @expense.id, group_id: @group.id)
  end
  it 'is valid with valid attributes' do
    expect(@expense_group).to be_valid
  end
  it 'is not valid without an expense_id' do
    @expense_group.expense_id = nil
    expect(@expense_group).to_not be_valid
  end
  it 'is not valid without a group_id' do
    @expense_group.group_id = nil
    expect(@expense_group).to_not be_valid
  end
end
