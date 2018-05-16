require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  subject { user }

  it { should be_valid }
  it { should validate_presence_of(:name) }
end
