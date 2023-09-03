N <- readline() |> parse_number()
read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year")) |>
  group_by(ntile(n=N)) |>
  group_map(\(x,y) write_tsv(x, str_glue("group_{y}.txt")))