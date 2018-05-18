require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  subject { user }

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(35).with_message(
      "слишком большой длины (не может быть больше чем 35 символов)") }
  it { should validate_length_of(:info).is_at_most(500).with_message(
      "слишком большой длины (не может быть больше чем 500 символов)") }
end
