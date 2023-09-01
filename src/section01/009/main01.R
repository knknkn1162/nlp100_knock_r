tb <- str |>
  word(1:100) |>
  as_tibble() |>
  drop_na()
new <- tb |>
  rowwise() |>
  mutate(p1 = str_sub(value, 1,1), p2 = str_sub(value, 2,-2), p3 = if_else(str_length(value)>1, str_sub(value, -1), "")) |>
  mutate(new = str_c(p1, sample(p2 |> str_split_1("")) |> str_flatten(""), p3) ) |>
  pull(new) |>
  str_flatten(" ") |>
  print()