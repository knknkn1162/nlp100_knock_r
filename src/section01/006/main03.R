bigram <- function(str) {
  res <- str |>
    str_split_1("") |>
    embed(2) |>
    as_tibble() |>
    mutate(z = str_c(V2,V1)) |>
    pull()
  return(res)
}
a <- bigram("paraparaparadise")
b <- bigram("paragraph")
union(a,b) |> print()
intersect(a,b) |> print()
setdiff(a,b) |> print()
c(any(a %in% "se"), any(b %in% "se")) |> print()