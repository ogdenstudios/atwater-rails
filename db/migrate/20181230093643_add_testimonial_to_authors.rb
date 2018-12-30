class AddTestimonialToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :testimonial, :text
  end
end
