str <- "I am an NLPer"
str |>
  word(1:100) |>
  as_tibble() |>
  mutate(value1 = lead(value)) |>
  drop_na() |>
  rowwise() |>
  mutate(res = str_flatten(c_across(everything()), collapse = " ")) |>
  pull(res) |>
  print()
str |>
  str_split_1("") |>
  as_tibble() |>
  mutate(value1 = lead(value)) |>
  drop_na() |>
  rowwise() |>
  mutate(res = str_flatten(c_across(everything()), collapse = "")) |>
  pull(res) |>
  print()