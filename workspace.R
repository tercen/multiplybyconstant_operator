library(tercen)
library(dplyr)

options("tercen.workflowId" = "119e20e1121a1ac50b16db38b0000a3d")
options("tercen.stepId"     = "23aa280b-9816-4425-a19c-0df1586ab443")

ctx = tercenCtx()

multiply_factor = ifelse(is.null(ctx$op.value('multiply_factor')), 1, as.numeric(ctx$op.value('multiply_factor')))

ctx %>% 
  select(.y, .ri, .ci) %>% 
  group_by(.ri, .ci) %>%
  mutate(value = multiply_factor*.y) %>%
  ctx$addNamespace() %>%
  ctx$save()