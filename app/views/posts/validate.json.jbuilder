if @valid.size < 1
  json.message render(partial: "posts/validation", formats: :html, locals: {message: "This is a valid username ✅"})
else
  json.message render(partial: "posts/validation", formats: :html, locals: {message: "Not a valid username!"})
end