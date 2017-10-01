require 'rails_helper'

RSpec.describe User, type: :model do
  let(:model) { FactoryGirl.create(:feedback) }

  it 'has a valid factory' do
    expect(model).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:info) }
end
