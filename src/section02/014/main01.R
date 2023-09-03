tb <- read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year"))
N <- readline() |> parse_number()
tb |>
  slice_head(n=N) |>
  print()