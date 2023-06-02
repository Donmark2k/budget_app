require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'Rit Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @expense = Expense.create(name: 'Food expense', amount: 100.00, author_id: @user.id)
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
  it 'is not valid without an author_id' do
    @expense.author_id = nil
    expect(@expense).to_not be_valid
  end
end
