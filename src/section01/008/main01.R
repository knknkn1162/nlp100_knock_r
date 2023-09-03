readline() |>
  str_split_1("") |>
  as_tibble() |>
  # The arguement of utf8ToInt takes only scalar value, so we need to do process rowwise
  rowwise() |>
  mutate(code = utf8ToInt(value), code2 = if_else(str_detect(value, "[a-z]"), 219-code, code), ans = intToUtf8(code2)) |>
  pull(ans) |>
  str_flatten() |>
  print()