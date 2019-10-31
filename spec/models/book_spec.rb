# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  it "has a valid factory" do
    expect(create(:book)).to be_valid
  end
end
