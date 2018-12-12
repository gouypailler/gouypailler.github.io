library(data.table)
library(igraph)
setwd("d:/46cours/TelecomSudParis_WebSocialNetworkAnalysis/2018-2019/td1/")
ee <- fread("imdb_actor_edges.tsv", col.names = c("id_actor1", "id_actor2"), select = 1:2)
kk <- fread("imdb_actors_key.tsv")
x0 <- merge(ee, kk[, list(ID, name_actor1=name)], by.x="id_actor1", by.y="ID", )
x <- merge(x0[, list(id_actor2,name_actor1)], kk[, list(ID, name_actor2=name)], by.x="id_actor2", by.y="ID", )
x[, id_actor2:=NULL]

g <- graph_from_data_frame(x)



