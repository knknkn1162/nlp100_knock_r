"Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can." |>
  word(1:100) |>
  as_tibble() |>
  mutate(pick2 = row_number() %in% c(1, 5, 6, 7, 8, 9, 15, 16, 19), pos = row_number()) |>
  drop_na() |> 
  mutate(sub = str_sub(value, 1, 2-pick2)) |>
  select(sub, pos) |>
  print()