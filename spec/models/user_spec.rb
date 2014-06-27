require 'rails_helper'
require 'shoulda'

describe User, :type => :model do
    before { @user = User.create!(searches: 'soccer') }
  subject { @user }

   it { should have_many(:searches) }


end