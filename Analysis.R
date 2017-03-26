#market basket analysis

install.packages("arules")
install.packages("arulesViz")
install.packages("datasets")
library("RColorBrewer")
data("Groceries")


itemFrequencyPlot(Groceries,topN=20,type="absolute")

#setting the ruls for supportm, confidence

rules <- apriori(Groceries,parameter = list(supp=0.001,conf=0.5,maxlen=3))

#show top 5 with only 2 digits.
options(digits=2)

rules <- sort(rules, by="confidence",decreasing = T)
inspect(rules[1:5])


# now changing the rules based on the items.

rules1 <- apriori(data=Groceries,parameter = list(supp=0.001,conf=0.2),
                 appearance = list(default="lhs",rhs="whole milk"))
rules1 <- sort(rules,by="confidence",decreasing = T)
inspect(rules1[1:5])



rules2<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.1,minlen=2), 
                appearance = list(default="rhs",lhs="whole milk"),
                control = list(verbose=F))
rules2<-sort(rules2, decreasing=TRUE,by="confidence")
inspect(rules2[1:5])

#visualization
library(arulesViz)
plot(rules1,method="graph",interactive = T,shading = NA)
plot(rules2,method="graph",interactive = T,shading = NA)



