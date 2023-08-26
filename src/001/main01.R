"パタトクカシーー" |>
  str_split_1("") |>
  (\(x) {x[1:10 * 2 - 1]})() |>
  discard(is.na) |>
  str_flatten() |>
  print()