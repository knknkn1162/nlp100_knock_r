"Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can." |>
  word(1:100) |>
  as_tibble() |>
  drop_na() |> 
  mutate(pos = row_number(), pick2 = pos %in% c(1, 5, 6, 7, 8, 9, 15, 16, 19)) |>
  mutate(sub = str_sub(value, 1, 2-pick2)) |>
  select(sub, pos) |>
  print(n=Inf)