require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
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
  describe 'group page' do
    scenario 'should have a group page' do
      visit user_groups_path(@user)
      expect(page).to have_content('CATEGORIES')
    end
    scenario 'should have a name of group' do
      visit user_groups_path(@user)
      expect(page).to have_content('Food')
    end

    scenario 'when user clicks on add a new category link it will redirect to new group page' do
      visit user_groups_path(@user)
      expect(page).to have_content('CATEGORY')
    end
  end

  describe 'new group page' do
    scenario 'should have a new group page' do
      visit new_user_group_path(@user)
      expect(page).to have_content('Chose icon')
    end
  end
end
