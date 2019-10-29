# frozen_string_literal: true

FactoryBot.define do
    factory :author do
        first_name { "string" }
        last_name { "string" }
        full_name { "string" }
        featured_author { true }
        testimonial { "string" }
        website { "string" }
        slug { "slug" }
        visible { true }
    end
  end
  