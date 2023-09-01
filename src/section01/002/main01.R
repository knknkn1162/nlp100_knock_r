c("パトカー", "タクシー") |>
  str_split_fixed("", 10) |>
  t() |>
  as_tibble() |>
  unite("dummy", everything(), sep="") |>
  pull() |>
  str_flatten() |>
  print()