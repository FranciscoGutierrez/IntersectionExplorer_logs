#
# This is an R file to process data from Intersection Explorer logfiles.
#

# Reading the csv files.
bookmarks <- read.csv("bookmarks.csv") 

# create some lists to keep the data
ls.names              <- c()
ls.1agent             <- c() 
ls.1agent1Tag         <- c() 
ls.1agent2Tags        <- c() 
ls.agent1User         <- c() 
ls.1agentUserTag      <- c() 
ls.1agent2Users       <- c() 
ls.1agent2Users1Tag   <- c() 
ls.1agent3Users       <- c() 
ls.1agent3Users1Tag   <- c()  
ls.agents             <- c() 
ls.2agentsTag         <- c() 
ls.2agents2Tags       <- c() 
ls.2agents1User       <- c() 
ls.2agentsUserTag     <- c() 
ls.2agentsUser2Tags   <- c() 
ls.2agents2Users      <- c() 
ls.2agents3Users      <- c() 
ls.2agents4Users      <- c() 
ls.2agents5Users      <- c() 
ls.3agents            <- c() 
ls.3agents1tag        <- c() 
ls.3agents2tags       <- c() 
ls.3agents1user       <- c() 
ls.3agents2users      <- c() 
ls.3agents2users1tag  <- c() 
ls.3agents2users3tags <- c() 
ls.3agents3users      <- c() 
ls.3agents3users1tag  <- c() 
ls.3agents4users      <- c() 
ls.3agents5users      <- c() 
ls.3agents6users      <- c() 
ls.4agents            <- c() 
ls.1tag               <- c() 
ls.2tags              <- c() 
ls.1user              <- c() 
ls.2users             <- c() 
ls.3users             <- c() 
ls.4users             <- c() 
ls.5users             <- c() 
ls.6users             <- c() 

split.bookmarks <- split(bookmarks, bookmarks$name)

for (users in split.bookmarks){
    x1agent             <- 0 
    x1agent1Tag         <- 0 
    x1agent2Tags        <- 0 
    x1agent1User        <- 0 
    x1agentUserTag      <- 0 
    x1agent2Users       <- 0 
    x1agent2Users1Tag   <- 0 
    x1agent3Users       <- 0 
    x1agent3Users1Tag   <- 0 
    x2agents            <- 0 
    x2agentsTag         <- 0 
    x2agents2Tags       <- 0 
    x2agents1User       <- 0 
    x2agentsUserTag     <- 0 
    x2agentsUser2Tags   <- 0 
    x2agents2Users      <- 0 
    x2agents3Users      <- 0 
    x2agents4Users      <- 0 
    x2agents5Users      <- 0 
    x3agents            <- 0 
    x3agents1tag        <- 0 
    x3agents2tags       <- 0 
    x3agents1user       <- 0 
    x3agents2users      <- 0 
    x3agents2users1tag  <- 0 
    x3agents2users3tags <- 0 
    x3agents3users      <- 0 
    x3agents3users1tag  <- 0 
    x3agents4users      <- 0 
    x3agents5users      <- 0 
    x3agents6users      <- 0 
    x4agents            <- 0 
    x1tag               <- 0 
    x2tags              <- 0 
    x1user              <- 0 
    x2users             <- 0 
    x3users             <- 0 
    x4users             <- 0 
    x5users             <- 0 
    x6users             <- 0 
    
    # name, time, agent, user, tag, selected
    for (i in 1:nrow(users)) {
        
        agent <- users$agent[i] # agent
        user  <- users$user[i]  # user
        tag   <- users$tag[i]   # tag
        name <- users$name[1]  # name
        
        if ((agent == 1) & (user == 0) & (tag == 0)) x1agent             <- x1agent             + 1
        if ((agent == 1) & (user == 0) & (tag == 1)) x1agent1Tag         <- x1agent1Tag         + 1
        if ((agent == 1) & (user == 0) & (tag == 2)) x1agent2Tags        <- x1agent2Tags        + 1
        if ((agent == 1) & (user == 1) & (tag == 0)) x1agent1User        <- x1agent1User        + 1
        if ((agent == 1) & (user == 1) & (tag == 1)) x1agentUserTag      <- x1agentUserTag      + 1
        if ((agent == 1) & (user == 2) & (tag == 0)) x1agent2Users       <- x1agent2Users       + 1 
        if ((agent == 1) & (user == 2) & (tag == 1)) x1agent2Users1Tag   <- x1agent2Users1Tag   + 1
        if ((agent == 1) & (user == 3) & (tag == 0)) x1agent3Users       <- x1agent3Users       + 1    
        if ((agent == 1) & (user == 3) & (tag == 1)) x1agent3Users1Tag   <- x1agent3Users1Tag   + 1
        if ((agent == 2) & (user == 0) & (tag == 0)) x2agents            <- x2agents            + 1
        if ((agent == 2) & (user == 0) & (tag == 1)) x2agentsTag         <- x2agentsTag         + 1
        if ((agent == 2) & (user == 0) & (tag == 2)) x2agents2Tags       <- x2agents2Tags       + 1
        if ((agent == 2) & (user == 1) & (tag == 0)) x2agents1User       <- x2agents1User       + 1
        if ((agent == 2) & (user == 1) & (tag == 1)) x2agentsUserTag     <- x2agentsUserTag     + 1
        if ((agent == 2) & (user == 1) & (tag == 2)) x2agentsUser2Tags   <- x2agentsUser2Tags   + 1
        if ((agent == 2) & (user == 2) & (tag == 0)) x2agents2Users      <- x2agents2Users      + 1
        if ((agent == 2) & (user == 3) & (tag == 0)) x2agents3Users      <- x2agents3Users      + 1
        if ((agent == 2) & (user == 4) & (tag == 0)) x2agents4Users      <- x2agents4Users      + 1
        if ((agent == 2) & (user == 5) & (tag == 0)) x2agents5Users      <- x2agents5Users      + 1
        if ((agent == 3) & (user == 0) & (tag == 0)) x3agents            <- x3agents            + 1
        if ((agent == 3) & (user == 0) & (tag == 1)) x3agents1tag        <- x3agents1tag        + 1  
        if ((agent == 3) & (user == 0) & (tag == 2)) x3agents2tags       <- x3agents2tags       + 1 
        if ((agent == 3) & (user == 1) & (tag == 0)) x3agents1user       <- x3agents1user       + 1 
        if ((agent == 3) & (user == 2) & (tag == 0)) x3agents2users      <- x3agents2users      + 1
        if ((agent == 3) & (user == 2) & (tag == 1)) x3agents2users1tag  <- x3agents2users1tag  + 1 
        if ((agent == 3) & (user == 2) & (tag == 3)) x3agents2users3tags <- x3agents2users3tags + 1
        if ((agent == 3) & (user == 3) & (tag == 0)) x3agents3users      <- x3agents3users      + 1
        if ((agent == 3) & (user == 3) & (tag == 1)) x3agents3users1tag  <- x3agents3users1tag  + 1
        if ((agent == 3) & (user == 4) & (tag == 0)) x3agents4users      <- x3agents4users      + 1
        if ((agent == 3) & (user == 5) & (tag == 0)) x3agents5users      <- x3agents5users      + 1
        if ((agent == 3) & (user == 6) & (tag == 0)) x3agents6users      <- x3agents6users      + 1
        if ((agent == 4) & (user == 0) & (tag == 0)) x4agents            <- x4agents            + 1
        if ((agent == 0) & (user == 0) & (tag == 1)) x1tag               <- x1tag               + 1 
        if ((agent == 0) & (user == 0) & (tag == 2)) x2tags              <- x2tags              + 1
        if ((agent == 0) & (user == 1) & (tag == 0)) x1user              <- x1user              + 1
        if ((agent == 0) & (user == 2) & (tag == 0)) x2users             <- x2users             + 1
        if ((agent == 0) & (user == 3) & (tag == 0)) x3users             <- x3users             + 1
        if ((agent == 0) & (user == 4) & (tag == 0)) x4users             <- x4users             + 1
        if ((agent == 0) & (user == 5) & (tag == 0)) x5users             <- x5users             + 1
        if ((agent == 0) & (user == 6) & (tag == 0)) x6users             <- x6users             + 1
    }             
    ls.names              <- c(ls.names,              toString(name))
    ls.1agent             <- c(ls.1agent,             x1agent)
    ls.1agent1Tag         <- c(ls.1agent1Tag,         x1agent1Tag) 
    ls.1agent2Tags        <- c(ls.1agent2Tags,        x1agent2Tags) 
    ls.agent1User         <- c(ls.agent1User,         x1agent1User) 
    ls.1agentUserTag      <- c(ls.1agentUserTag,      x1agentUserTag) 
    ls.1agent2Users       <- c(ls.1agent2Users,       x1agent2Users) 
    ls.1agent2Users1Tag   <- c(ls.1agent2Users1Tag,   x1agent2Users1Tag) 
    ls.1agent3Users       <- c(ls.1agent3Users,       x1agent3Users) 
    ls.1agent3Users1Tag   <- c(ls.1agent3Users1Tag,   x1agent3Users1Tag)  
    ls.agents             <- c(ls.agents,             x2agents) 
    ls.2agentsTag         <- c(ls.2agentsTag,         x2agentsTag) 
    ls.2agents2Tags       <- c(ls.2agents2Tags,       x2agents2Tags) 
    ls.2agents1User       <- c(ls.2agents1User,       x2agents1User) 
    ls.2agentsUserTag     <- c(ls.2agentsUserTag,     x2agentsUserTag) 
    ls.2agentsUser2Tags   <- c(ls.2agentsUser2Tags,   x2agentsUser2Tags) 
    ls.2agents2Users      <- c(ls.2agents2Users,      x2agents2Users) 
    ls.2agents3Users      <- c(ls.2agents3Users,      x2agents3Users) 
    ls.2agents4Users      <- c(ls.2agents4Users,      x2agents4Users) 
    ls.2agents5Users      <- c(ls.2agents5Users,      x2agents5Users) 
    ls.3agents            <- c(ls.3agents,            x3agents) 
    ls.3agents1tag        <- c(ls.3agents1tag,        x3agents1tag) 
    ls.3agents2tags       <- c(ls.3agents2tags,       x3agents2tags) 
    ls.3agents1user       <- c(ls.3agents1user,       x3agents1user) 
    ls.3agents2users      <- c(ls.3agents2users,      x3agents2users) 
    ls.3agents2users1tag  <- c(ls.3agents2users1tag,  x3agents2users1tag) 
    ls.3agents2users3tags <- c(ls.3agents2users3tags, x3agents2users3tags) 
    ls.3agents3users      <- c(ls.3agents3users,      x3agents3users) 
    ls.3agents3users1tag  <- c(ls.3agents3users1tag,  x3agents3users1tag) 
    ls.3agents4users      <- c(ls.3agents4users,      x3agents4users) 
    ls.3agents5users      <- c(ls.3agents5users,      x3agents5users) 
    ls.3agents6users      <- c(ls.3agents6users,      x3agents6users) 
    ls.4agents            <- c(ls.4agents,            x4agents) 
    ls.1tag               <- c(ls.1tag,               x1tag) 
    ls.2tags              <- c(ls.2tags,              x2tags) 
    ls.1user              <- c(ls.1user,              x1user) 
    ls.2users             <- c(ls.2users,             x2users) 
    ls.3users             <- c(ls.3users,             x3users) 
    ls.4users             <- c(ls.4users,             x4users) 
    ls.5users             <- c(ls.5users,             x5users) 
    ls.6users             <- c(ls.6users,             x6users) 
}

# create a dataframe for the output
output <- data.frame(ls.names,            
                     ls.1agent,            
                     ls.1agent1Tag,        
                     ls.1agent2Tags,       
                     ls.agent1User,        
                     ls.1agentUserTag,     
                     ls.1agent2Users,      
                     ls.1agent2Users1Tag,  
                     ls.1agent3Users,      
                     ls.1agent3Users1Tag,  
                     ls.agents,        
                     ls.2agentsTag,      
                     ls.2agents2Tags,      
                     ls.2agents1User,      
                     ls.2agentsUserTag,    
                     ls.2agentsUser2Tags,  
                     ls.2agents2Users,     
                     ls.2agents3Users,     
                     ls.2agents4Users,     
                     ls.2agents5Users,     
                     ls.3agents,           
                     ls.3agents1tag,      
                     ls.3agents2tags,      
                     ls.3agents1user,      
                     ls.3agents2users,     
                     ls.3agents2users1tag, 
                     ls.3agents2users3tags,
                     ls.3agents3users,     
                     ls.3agents3users1tag, 
                     ls.3agents4users,     
                     ls.3agents5users,     
                     ls.3agents6users,     
                     ls.4agents,           
                     ls.1tag,             
                     ls.2tags,             
                     ls.1user,             
                     ls.2users,            
                     ls.3users,            
                     ls.4users,           
                     ls.5users,            
                     ls.6users)

write.csv(output, file = "bookmarks_out.csv")

