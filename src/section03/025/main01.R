readLines("../input.jsonl") |>
  map(\(x) (fromJSON(x) |> as_tibble())) |>
  list_rbind() |>
  filter(title=="イギリス") |>
  pull(text) |>
  str_match_all("\\|(.+?)\\s=\\s*(.+)") |>
  _[[1]] |>
  as_tibble() |>
  select(V2,V3) |>
  rename(key = V2, value = V3) |>
  print(n=Inf)