# Reading the csv files.

conference <- read.csv("ECTEL_2014.csv") 

ls.user     <- c()
ls.userid   <- c()
ls.bookmark <- c() 

for (i  in 1:nrow(conference)) {
    if (conference$attribute[i] == "name")
        ls.user     <- c(ls.user,      toString(conference$value[i]))
    if (conference$attribute[i] == "userID")
        ls.userid   <- c(ls.userid,   conference$value[i]) 
    if (conference$attribute[i] == "contentID")
        ls.bookmark <- c(ls.bookmark, conference$value[i]) 
}

bookmarks <- data.frame(ls.user,            
                        ls.userid,            
                        ls.bookmark)

write.csv(bookmarks, file = "bookmarks_1.csv")

#Split the data by users
split.bookmarks <- split(bookmarks, bookmarks$ls.userid)

bm.usr1  <- c()
bm.usr2  <- c()
bm.name1 <- c()
bm.name2 <- c()
bm.sim   <- c()
bm.bmk1  <- c()
bm.bmk2  <- c()
bm.inter <- c()
bm.union <- c()

# Loop for jaccard index
for (user.a in split.bookmarks) {
    usera.bookmarks <- nrow (user.a)
    for (user.b in split.bookmarks) {
        userb.bookmarks <- nrow (user.b)
        
        if (user.a$ls.userid[1] != user.b$ls.userid[1]) {
        union     <- length(union(user.a$ls.bookmark,user.b$ls.bookmark))
        intersect <- length(intersect(user.a$ls.bookmark,user.b$ls.bookmark))
            
        union     <- usera.bookmarks + userb.bookmarks
        # Send it to data frame...
        bm.usr1   <- c(bm.usr1, user.a$ls.userid[1])
        bm.usr2   <- c(bm.usr2, user.b$ls.userid[1])
        bm.name1  <- c(bm.name1, toString(user.a$ls.user[1]))
        bm.name2  <- c(bm.name2, toString(user.b$ls.user[1]))
        bm.bmk1   <- c(bm.bmk1,  usera.bookmarks)
        bm.bmk2   <- c(bm.bmk2,  userb.bookmarks)
        bm.union  <- c(bm.union, union)
        bm.inter  <- c(bm.inter, intersect)
        bm.sim    <- c(bm.sim,   (intersect)/(union - intersect))
        }
    }
}

results <- data.frame(bm.usr1,
                      bm.usr2,
                      bm.bmk1,
                      bm.bmk2,
                      bm.inter,
                      bm.union,
                      bm.sim)

write.csv(results, file = "ECTEL_2014_out.csv")

print("done!")
