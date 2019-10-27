json.extract! book, :id, :service, :genre, :title, :old_filename, :created_at, :updated_at
json.url book_url(book, format: :json)
