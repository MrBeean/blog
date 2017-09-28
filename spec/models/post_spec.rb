require 'spec_helper'

RSpec.describe Post, type: :model do
  let(:model) { FactoryGirl.create(:post) }

  it 'has a valid factory' do
    expect(model).to be_valid
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:post) }
  it { is_expected.to validate_presence_of(:user) }
end
