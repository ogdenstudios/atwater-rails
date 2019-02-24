class FixBrokenAuthors < SeedMigration::Migration
  def up
    [
      {
        slug: "victoria k.-chase",
        new_slug: "victoria-chase"
      },
      {
        slug: "earl e-hardman",
        new_slug: "earl-hardman"
      },
      {
        slug: "j.e.-taylor",
        new_slug: "je-taylor"
      },
      {
        slug: "joan riley-ford",
        new_slug: "joan-ford"
      },
      {
        slug: "greta rose-evans",
        new_slug: "greta-evans"
      }
    ].each do |data|
      Author.find_by(slug: data[:slug]).update_column(:slug, data[:new_slug])
    end
  end

  def down

  end
end
