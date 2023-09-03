str <- "I am an NLPer"
str |>
  word(1:100) |>
  as_tibble() |>
  drop_na() |>
  slide(\(x) 
    x |>
      summarize(bigram = str_flatten(value, " ")),
    .after=1, .complete=TRUE) |>
  list_rbind() |>
  pull(bigram) |>
  print()

str |>
  str_split_1("") |>
  as_tibble() |>
  drop_na() |>
  slide(\(x) 
        x |>
          summarize(bigram = str_flatten(value, "")),
        .after=1, .complete=TRUE) |>
  list_rbind() |>
  pull(bigram) |>
  print()