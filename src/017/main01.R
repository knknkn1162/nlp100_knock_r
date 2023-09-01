read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year")) |>
  distinct(name) |>
  arrange(name) |>
  pull() |>
  print()