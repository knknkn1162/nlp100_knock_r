read_lines("../neko.txt.mecab") |>
  str_replace_all("\t", ",") |>
  as_tibble() |>
  filter(value != "EOS") |>
  # 表層形\t品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用型,活用形,原形,読み,発音
  separate_wider_delim(value, ",", names = c("surface", "pos", "pos1", "pos2", "pos3", "pos4", "pos5", "base", "read", "pron"), too_few = "align_start") |>
  select(surface, base, pos, pos1) |>
  slice_head(n=20000) |>
  slide(\(x) x |> summarize(center = nth(surface, n=2), words = str_flatten(surface)), .before=1, .after=1, .complete=TRUE) |>
  list_rbind() |>
  filter(center == "猫") |>
  separate_wider_delim(words, delim="猫", names = c("before", "after")) |>
  pivot_longer(cols = c(before, after), names_to = "label", values_to = "word") |>
  summarize(n = n(), .by = word) |>
  arrange(desc(n)) |>
  slice_head(n=10) |>
  ggplot(aes(x = fct_reorder(word, desc(n)), y = n)) + geom_bar(stat="identity") |>
  (\(g) print(g))()