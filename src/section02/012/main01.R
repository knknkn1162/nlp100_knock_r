tb <- read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year"))
1:2 |>
  map(\(x) tb |>
    select(x) |>
    write_tsv(str_glue("col{x}.txt"))
  )