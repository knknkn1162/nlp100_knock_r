readLines("../input.jsonl") |>
  map(\(x) (fromJSON(x) |> as_tibble())) |>
  list_rbind() |>
  filter(title=="イギリス") |>
  pull(text) |>
  str_split_1("\n") |>
  str_extract_all("^==+.*") |>
  unlist() |>
  as_tibble() |>
  mutate(section=str_remove_all(value, "[= ]"), level=str_count(value, "=")/2 - 1) |>
  select(section, level) |>
  print(n=Inf)