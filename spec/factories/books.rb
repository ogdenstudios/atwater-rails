# frozen_string_literal: true

FactoryBot.define do
    factory :book do
        author { create(:author) }
        genre { create(:genre) }
        subgenre { create(:subgenre) }
        title { "string" }
    end
  end
  