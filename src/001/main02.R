"パタトクカシーー" |>
  str_split_1("") |>
  as_tibble() |>
  filter(row_number() %% 2 == 1) |>
  pull(1) |>
  str_flatten()