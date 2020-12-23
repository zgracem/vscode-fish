walk(
  if type == "object" then
    if has("name") or has("begin") or has("patterns") or has("include") or has("match") then
      del(.comment) else . end
  else . end
)
| . | .uuid="73fe8880-b0d7-4073-8543-e923d65dad79"
