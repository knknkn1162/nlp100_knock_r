tb <- read_lines("../neko.txt.mecab") |>
  str_replace_all("\t", ",") |>
  as_tibble() |>
  filter(value != "EOS") |>
  # 表層形\t品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用型,活用形,原形,読み,発音
  separate_wider_delim(value, ",", names = c("surface", "pos", "pos1", "pos2", "pos3", "pos4", "pos5", "base", "read", "pron"), too_few = "align_start") |>
  select(surface, base, pos, pos1) |>
  summarise(n = n(), .by = base) |>
  arrange(desc(n)) |>
  print()