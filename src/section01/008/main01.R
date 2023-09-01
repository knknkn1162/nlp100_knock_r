readline() |>
  str_split_1("") |>
  as_tibble() |>
  rowwise() |>
  mutate(code = utf8ToInt(value), code2 = if_else(str_detect(value, "[a-z]"), 219-code, code), ans = intToUtf8(code2)) |>
  pull(ans) |>
  str_flatten() |>
  print()