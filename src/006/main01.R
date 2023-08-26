bigram <- function(str) {
  res <- str |>
    str_split_1("") |>
    as_tibble() |>
    mutate(value1 = lead(value)) |>
    drop_na() |>
    rowwise() |>
    mutate(res = str_flatten(c_across(everything()), collapse = "")) |>
    pull(res)
  return(res)
}
a <- bigram("paraparaparadise")
b <- bigram("paragraph")
union(a,b) |> print()
intersect(a,b) |> print()
setdiff(a,b) |> print()
c(any(a %in% "se"), any(b %in% "se")) |> print()