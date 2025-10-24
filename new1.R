VADeaths()
class(VADeaths)
VADeaths[, c(1 , 3)]
VADeaths[c(3,4,5),c(1,3)]
colMeans(VADeaths)
VADeaths = rbind(VADeaths , ave_col = colMeans(VADeaths))
VADeaths

df = data.frame("product" = c("a1" , "a3" , "a3" , "a4") , "price" = c(10,20,30,40) , "monthly_demand" = c(100,200,300,400) , "brand" = c("s","d","f","g")) # nolint
df
df$monthly_rev = df$price * df$monthly_demand
df
sum(df$monthly_rev[df$brand == "d"])

df$monthly_rev / sum(df$monthly_rev)

round(df$monthly_rev / sum(df$monthly_rev) * 100 , 1)
df$revenue_share = round(df$monthly_rev / sum(df$monthly_rev) * 100 , 1)
df
install.packages("readxl")
