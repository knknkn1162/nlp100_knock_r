tb <- read_lines("../neko.txt.mecab") |>
  str_replace_all("\t", ",") |>
  as_tibble() |>
  filter(value != "EOS") |>
  # 表層形\t品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用型,活用形,原形,読み,発音
  separate_wider_delim(value, ",", names = c("surface", "pos", "pos1", "pos2", "pos3", "pos4", "pos5", "base", "read", "pron"), too_few = "align_start") |>
  select(surface, base, pos, pos1) |>
  mutate(idx = row_number())
tb |>
  filter(pos == "名詞") |>
  mutate(diff = idx - lag(idx)) |>
  group_by(consecutive_id(diff)) |>
  filter(diff == 1) |>
  summarize(n = n(), nidx = first(idx)-1) |>
  filter(n == max(n)) |>
  rowwise() |>
  group_map(\(x,y) tb |>
    slice((x$nidx):(x$nidx+x$n)) |>
    pull(surface) |>
    str_flatten()
  ) |>
  unlist() |>
  print()