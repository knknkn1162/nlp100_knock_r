read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year")) |>
  summarize(n=n(), .by = name) |>
  arrange(desc(n)) |>
  pull(name) |>
  print()