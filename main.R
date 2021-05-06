library(tercen)
library(dplyr)

ctx = tercenCtx()

multiply_factor = ifelse(is.null(ctx$op.value('multiply_factor')), 1, as.numeric(ctx$op.value('multiply_factor')))

ctx %>% 
  select(.y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  "*"(multiply_factor) %>%
  ctx$addNamespace() %>%
  ctx$save()