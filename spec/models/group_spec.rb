require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Rita Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @group = Group.create(name: 'Test group', icon: 'food_icon.png', user_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@group).to be_valid
  end
  it 'is not valid without a name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end
  it 'is not valid without an icon' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
  it 'is not valid without an user_id' do
    @group.user_id = nil
    expect(@group).to_not be_valid
  end
end
