class MakeAllAuthorsVisible < SeedMigration::Migration
  def up
    Author.all.each do |author| 
      author.update_column(:visible, true)
    end
  end

  def down
    Author.all.each do |author| 
      author.update_column(:visible, nil)
    end
  end
end
