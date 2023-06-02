require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'Rita Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @group = Group.create(name: 'Food', icon: 'food_icon.png', user_id: @user.id)
    @expense = Expense.create(name: 'Food expense', amount: 10.00, author_id: @user.id)
    @expense_group = ExpensesGroup.create(expense_id: @expense.id, group_id: @group.id)
  end

  describe 'GET /sign_in' do
    it 'returns http success' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
    it 'renders the new template' do
      get new_user_session_path
      expect(response).to render_template('new').or(render_template('devise/sessions/new'))
    end
    it 'displays the sign in form' do
      get new_user_session_path
      expect(response.body).to include('Log in')
    end
  end
  describe 'GET /sign_up' do
    it 'returns http success' do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
    it 'renders the new template' do
      get new_user_registration_path
      expect(response).to render_template('new').or(render_template('devise/registrations/new'))
    end
    it 'displays the sign up form' do
      get new_user_registration_path
      expect(response.body).to include('Sign up')
    end
  end
end
