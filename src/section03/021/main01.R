readLines("../input.jsonl") |>
  map(\(x) (fromJSON(x) |> as_tibble())) |>
  list_rbind() |>
  filter(title=="イギリス") |>
  pull(text) |>
  str_split_1("\n") |>
  str_extract_all(str_glue("^{x}.*", x = str_escape("[[Category"))) |>
  unlist() |>
  print()