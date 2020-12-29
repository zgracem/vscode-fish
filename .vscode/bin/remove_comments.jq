walk(
  if type == "object" then
    if has("name") or has("begin") or has("patterns") or has("include") or has("match") then
      del(.comment) else . end
  else . end
)
