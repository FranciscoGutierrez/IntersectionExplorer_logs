#
# This is an R file to process data from Intersection Explorer logfiles.
#

# Reading the csv files.
items <- read.csv("items.csv") 

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

split.items <- split(items, items$name)

for (users in split.items) {
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
    # name, time, agent, user, tag, items
    for (i in 1:nrow(users)) {
        
        agent <- users$agent[i] # agent
        user  <- users$user[i]  # user
        tag   <- users$tag[i]   # tag
        item  <- users$items[i] # items
        name  <- users$name[1]  # name
        
        # So many posibilities 
        if ((agent == 1) & (user == 0) & (tag == 0)) x1agent             <- item + x1agent
        if ((agent == 1) & (user == 0) & (tag == 1)) x1agent1Tag         <- item + x1agent1Tag
        if ((agent == 1) & (user == 0) & (tag == 2)) x1agent2Tags        <- item + x1agent2Tags
        if ((agent == 1) & (user == 1) & (tag == 0)) x1agent1User        <- item + x1agent1User
        if ((agent == 1) & (user == 1) & (tag == 1)) x1agentUserTag      <- item + x1agentUserTag
        if ((agent == 1) & (user == 2) & (tag == 0)) x1agent2Users       <- item + x1agent2Users 
        if ((agent == 1) & (user == 2) & (tag == 1)) x1agent2Users1Tag   <- item + x1agent2Users1Tag
        if ((agent == 1) & (user == 3) & (tag == 0)) x1agent3Users       <- item + x1agent3Users    
        if ((agent == 1) & (user == 3) & (tag == 1)) x1agent3Users1Tag   <- item + x1agent3Users1Tag
        if ((agent == 2) & (user == 0) & (tag == 0)) x2agents            <- item + x2agents
        if ((agent == 2) & (user == 0) & (tag == 1)) x2agentsTag         <- item + x2agentsTag
        if ((agent == 2) & (user == 0) & (tag == 2)) x2agents2Tags       <- item + x2agents2Tags
        if ((agent == 2) & (user == 1) & (tag == 0)) x2agents1User       <- item + x2agents1User
        if ((agent == 2) & (user == 1) & (tag == 1)) x2agentsUserTag     <- item + x2agentsUserTag
        if ((agent == 2) & (user == 1) & (tag == 2)) x2agentsUser2Tags   <- item + x2agentsUser2Tags
        if ((agent == 2) & (user == 2) & (tag == 0)) x2agents2Users      <- item + x2agents2Users
        if ((agent == 2) & (user == 3) & (tag == 0)) x2agents3Users      <- item + x2agents3Users
        if ((agent == 2) & (user == 4) & (tag == 0)) x2agents4Users      <- item + x2agents4Users
        if ((agent == 2) & (user == 5) & (tag == 0)) x2agents5Users      <- item + x2agents5Users
        if ((agent == 3) & (user == 0) & (tag == 0)) x3agents            <- item + x3agents
        if ((agent == 3) & (user == 0) & (tag == 1)) x3agents1tag        <- item + x3agents1tag  
        if ((agent == 3) & (user == 0) & (tag == 2)) x3agents2tags       <- item + x3agents2tags 
        if ((agent == 3) & (user == 1) & (tag == 0)) x3agents1user       <- item + x3agents1user 
        if ((agent == 3) & (user == 2) & (tag == 0)) x3agents2users      <- item + x3agents2users
        if ((agent == 3) & (user == 2) & (tag == 1)) x3agents2users1tag  <- item + x3agents2users1tag 
        if ((agent == 3) & (user == 2) & (tag == 3)) x3agents2users3tags <- item + x3agents2users3tags
        if ((agent == 3) & (user == 3) & (tag == 0)) x3agents3users      <- item + x3agents3users
        if ((agent == 3) & (user == 3) & (tag == 1)) x3agents3users1tag  <- item + x3agents3users1tag
        if ((agent == 3) & (user == 4) & (tag == 0)) x3agents4users      <- item + x3agents4users
        if ((agent == 3) & (user == 5) & (tag == 0)) x3agents5users      <- item + x3agents5users
        if ((agent == 3) & (user == 6) & (tag == 0)) x3agents6users      <- item + x3agents6users
        if ((agent == 4) & (user == 0) & (tag == 0)) x4agents            <- item + x4agents
        if ((agent == 0) & (user == 0) & (tag == 1)) x1tag               <- item + x1tag 
        if ((agent == 0) & (user == 0) & (tag == 2)) x2tags              <- item + x2tags
        if ((agent == 0) & (user == 1) & (tag == 0)) x1user              <- item + x1user
        if ((agent == 0) & (user == 2) & (tag == 0)) x2users             <- item + x2users
        if ((agent == 0) & (user == 3) & (tag == 0)) x3users             <- item + x3users
        if ((agent == 0) & (user == 4) & (tag == 0)) x4users             <- item + x4users
        if ((agent == 0) & (user == 5) & (tag == 0)) x5users             <- item + x5users
        if ((agent == 0) & (user == 6) & (tag == 0)) x6users             <- item + x6users
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

write.csv(output, file = "items_out.csv")
