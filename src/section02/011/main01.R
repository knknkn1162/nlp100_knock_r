read_file("https://nlp100.github.io/data/popular-names.txt") |>
  str_replace_all("\t", " ") |>
  cat()