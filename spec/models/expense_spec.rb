require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'Rit Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @group = Group.create(name: 'Food', icon: 'food_icon.png', user_id: @user.id)
    @expense = Expense.create(name: 'Test expense', amount: 100, user_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@expense).to be_valid
  end
  it 'is not valid without a name' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end
  it 'is not valid without an amount' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end
  it 'is not valid without an user_id' do
    @expense.user_id = nil
    expect(@expense).to_not be_valid
  end
end