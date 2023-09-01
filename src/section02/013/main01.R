str_glue("inputs/col{x}.txt", x = 1:2) |>
  map(read_csv) |>
  bind_cols() |>
  write_tsv("res.txt")