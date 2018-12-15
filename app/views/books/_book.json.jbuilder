json.extract! book, :id, :work_done, :genre, :title, :old_filename, :created_at, :updated_at
json.url book_url(book, format: :json)
