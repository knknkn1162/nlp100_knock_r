readLines("../input.jsonl") |>
  map(\(x) (fromJSON(x) |> as_tibble())) |>
  list_rbind() |>
  filter(title=="イギリス") |>
  pull(text) |>
  str_split_1("\n") |>
  str_match_all(str_glue("^{x}(.*){y}", x = str_escape("[[Category:"), y = str_escape("]]"))) |>
  unlist() |>
  matrix(ncol = 2, byrow=TRUE) |>
  as_tibble() |>
  pull(V2) |>
  print()