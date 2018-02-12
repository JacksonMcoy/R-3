## the draw samples a number then matches it with its corresponding letter
draw <- function() {
  num <- sample(1:75, 1)
  if(num <= 15) {
    data.frame(letter = "B", number = num, stringsAsFactors = FALSE)
  } else { 
    if(num <= 30) {
      data.frame(letter = "I", number = num, stringsAsFactors = FALSE)      
    } else { 
      if(num <= 45) {
        data.frame(letter = "N", number = num, stringsAsFactors = FALSE) 
        } else { 
          if(num <= 60) {
            data.frame(letter = "G", number = num, stringsAsFactors = FALSE) 
            } else {
            data.frame(letter = "O", number = num, stringsAsFactors = FALSE) 
            }
        }
    }
  }
}
draw()

# the card is made by creating a blank matrix, naming the columns
# with the appropriate letters, and randomly sampling numbers to 
# fill in to the appropriate column
card <- function(){
  cards <- matrix(nrow=5, ncol=5)
  colnames(cards) <- c("B", "I", "N", "G", "O")
  for(i in 1:5){
    cards[, i] <- sample((15*i-14):(15*i), 5)
  }
  cards[3, 3] <- NA
  cards
} 
card()


# the game takes a vector of players, assigns each one a card,
# iteratively performs the draw and checks each card to see if 
# the draw appears on any card (assigning the space NA if it does), 
# then checks each card for a full row, column, or diagonal of NA
checkwin <- function(x) { all(is.na(x)) }
play <- function(myplayers){
  pcards <- list()
  n <- length(myplayers)
  for (l in 1:n) {
    pcards[[l]] <- card() # assigns cards to players
  }
  names(pcards) <- myplayers
  for (k in 1:1000) { # iteratively performs draw
    call <- draw()
    print(call) # show draw
    for (i in 1:n) {
      tmat <- pcards[[i]]
      if (any(as.vector(tmat[!is.na(tmat)]) == call[[2]])) {
        tmat[tmat == call[[2]]] <- NA
      } # replaces space with NA if space matches draw
      if (any(c(apply(tmat, 1, checkwin), apply(tmat, 2, checkwin), 
               checkwin(diag(tmat)), 
               checkwin(c(tmat[1,5], tmat[2, 4], 
                          tmat[4, 2], tmat[5, 1]))))){
        pcards[[i]] <- tmat
        print(pcards[i]) 
        stop(paste(names(pcards[i]), 
                   "won the game", "in", k, "draws", sep=" "))        
      } else {
        pcards[[i]] <- tmat
      }
    } 
    
    print(pcards) # show cards 
  }
}
myplayers <- c("I", "You")
play(myplayers)
