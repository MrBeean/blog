require "rails_helper"

RSpec.describe Feedback, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:email) }
end
