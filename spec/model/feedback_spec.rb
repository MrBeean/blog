require "rails_helper"

RSpec.describe Feedback, type: :model do
  let(:feedback) { FactoryBot.build(:feedback) }
  subject { feedback }

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:email) }

  it { should validate_length_of(:name).is_at_most(40).with_message(
      "слишком большой длины (не может быть больше чем 40 символов)") }
end
