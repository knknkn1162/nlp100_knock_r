readLines("../input.jsonl") |>
  map(\(x) (fromJSON(x) |> as_tibble())) |>
  list_rbind() |>
  filter(title=="イギリス") |>
  pull(text) |>
  str_match_all(str_glue("{x}ファイル:(.*){y}", x = str_escape("[["), y = str_escape("]]"))) |>
  _[[1]] |>
  as_tibble() |>
  mutate(ans = str_split_i(V2, str_escape("|"), 1)) |>
  pull(ans) |>
  print()