read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year")) |>
  arrange(desc(numberOfPeople)) |>
  print(n=Inf)