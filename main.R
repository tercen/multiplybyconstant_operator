library(tercen)
library(dplyr)


ctx = tercenCtx()

multiply_factor = ifelse(is.null(ctx$op.value('multiply_factor')), 1, as.numeric(ctx$op.value('multiply_factor')))

df.out<-ctx %>% 
  select(.y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  mutate(value = multiply_factor*.y) %>%
  ctx$addNamespace()
  
df.out %>%
  ctx$save()

