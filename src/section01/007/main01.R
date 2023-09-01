list(x=12, y="気温", z=22.4) |>
  (\(lst) str_glue("{x}時の{y}は{z}", x = lst[["x"]], y = lst[["y"]], z = lst[["z"]]))() |>
  print()