read_tsv("https://nlp100.github.io/data/popular-names.txt", col_names=c("name", "sex", "numberOfPeople", "year")) |>
  group_by(ntile(n=(readline() |>
    parse_number()))) |>
  group_map(\(x,y) write_tsv(x, str_glue("group_{y}.txt")))