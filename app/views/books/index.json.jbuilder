json.array!(@books) do |book|
  json.extract! book, :id, :title, :location, :description
  json.url book_url(book, format: :json)
end
