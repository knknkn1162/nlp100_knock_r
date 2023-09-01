c("パトカー", "タクシー") |>
  str_split_fixed("", 10) |>
  t() |>
  as_tibble() |>
  rowwise() |>
  mutate(z = str_flatten(c_across(everything()))) |>
  pull() |>
  str_flatten() |>
  print()