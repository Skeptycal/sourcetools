library(microbenchmark)
library(sourcetools)

# Obviously not fair to compare R's parser to a tokenizer but it
# helps establish a baseline for the tokenizer + how much 'wiggle
# room' we have in our parser
file <- "R/sourcetools.R"
microbenchmark(
  tokenize_file(file),
  parse(file, keep.source = FALSE)
)

contents <- read(file)
mb <- microbenchmark(
  tokenize_string(contents),
  parse(text = contents, keep.source = FALSE)
)
print(mb)
