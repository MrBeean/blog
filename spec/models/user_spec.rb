require 'spec_helper'

RSpec.describe User, type: :model do
  let(:model) { FactoryGirl.create(:user) }

  it 'has a valid factory' do
    expect(model).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:info) }
end
