"I couldn’t believe that I could actually understand what I was reading : the phenomenal power of the human mind ." |>
  word(1:100) |>
  as_tibble() |>
  drop_na() |>
  mutate(p1 = str_sub(value, 1,1), p2 = str_sub(value, 2,-2), p3 = if_else(str_length(value)>1, str_sub(value, -1), "")) |>
  # Without rowwise, str_split returns list, make it complicated.
  rowwise() |>
  mutate(p2_shuf = sample(p2 |> str_split_1("")) |> str_flatten("")) |>
  ungroup() |>
  mutate(new = str_c(p1, p2_shuf, p3) ) |>
  pull(new) |>
  str_flatten(" ") |>
  print()