"stressed" |>
  str_split_1("") |>
  as_tibble() |>
  arrange(desc(row_number())) |>
  pull(1) |>
  str_flatten()