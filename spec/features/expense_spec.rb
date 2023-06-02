require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
  before(:each) do
    @user = User.create(name: 'Rita Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @group = Group.create(name: 'Food', icon: 'icons/abroad.PNG', user_id: @user.id)
    @expense = Expense.create(name: 'Food expense', amount: 10.00, author_id: @user.id)
    @expense_group = ExpensesGroup.create(expense_id: @expense.id, group_id: @group.id)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end
  describe 'Expense detail page' do
    scenario 'should have a expense detail page' do
      visit user_group_path(@group.user, @group)
      expect(page).to have_content(@group.name)
    end
    scenario 'should have a expense total' do
      visit user_group_path(@group.user, @group)
      expect(page).to have_content(@group.expenses.sum(:amount))
    end
    scenario 'should have add new expense link' do
      visit new_user_group_expense_path(user_id: @group.user.id, group_id: @group.id)
      expect(page).to have_content('Add Transaction')
    end
    scenario 'When user click add a new transaction button will redirect to transaction new page' do
      visit new_user_group_expense_path(user_id: @group.user.id, group_id: @group.id)
      expect(page).to have_content('TRANSACTION')
    end
  end
  describe 'Expense new page' do
    scenario 'should have a expense new page' do
      visit new_user_group_expense_path(user_id: @group.user.id, group_id: @group.id)
      expect(page).to have_content('Add Transaction')
    end
  end
end
