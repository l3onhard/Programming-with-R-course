
# Abgabe von Leonhard Gulewitsch

##Gesamt: 2.25 + 5 + 5 = 12.25  /12.5


#load("//server01/lehre/ProgrammierenR/Data/AnmeldungOhneNA_WS1617.RData")

# load("/Users/Leo/offline_files/local_files/PmitR/assignment_3/AnmeldungOhneNA_WS1617.rdata")

# Aufgabe 6
s.AZ <- anmeldezeit
s.GR <- gruppe
s.SG <- studiengang
s.U3 <- U3

t.regi_start <- as.POSIXct("2016-10-20 22:00:00") # time at registration start
t.lect_start <- as.POSIXct("2016-10-21 10:15:00") # time at lecture start
t.lect_end <- as.POSIXct("2016-10-21 11:15:00") # time at lecture end
t.sat_0 <- as.POSIXct("2016-10-22 00:00:00") # saturday 0 AM
t.sun_0 <- as.POSIXct("2016-10-23 00:00:00") # sunday 0 AM
t.mon_0 <- as.POSIXct("2016-10-24 00:00:00") # monday 0 AM

mins_since_regi_start <- function(time1, time2 = t.regi_start){
    output <- as.numeric(difftime(time1, time2, units = "mins"))
    return(output)
}

## a)
breaks_vektor <- c(0, mins_since_regi_start(t.lect_end), 
                   mins_since_regi_start(t.sat_0), 
                   mins_since_regi_start(t.sun_0), 
                   mins_since_regi_start(t.mon_0), 
                   max(s.AZ))
labels_vektor <- c("before lecture end",
                  "friday after lecture end",
                  "saturday",
                  "sunday", 
                  "after registration deadline")

table(cut(s.AZ, breaks_vektor, labels = labels_vektor))

## b)
hist(s.AZ, breaks = breaks_vektor, labels = labels_vektor)

## c)
s.SG_minors <- s.SG
s.minors <- which(!(s.SG_new == "Statistik" 
                        | s.SG_new == "Datenanalyse"))
####es gibt kein s.SG_new, du meinst s.SG_minors
s.minors <- which(!(s.SG_minors == "Statistik" 
                        | s.SG_minors == "Datenanalyse"))

s.SG_minors[s.with_minor] <- "Nebenfach"
####s.with_minor ist nicht definiert, den Vektor hast du s.minors genannt;)
s.SG_minors[s.minors] <- "Nebenfach"

table(s.SG_minors)

#### Pass auf, dass du dich nicht beim vergeben der Namen vertust! (-0.25)

# Aufgabe 7

print_vector <- function(vector){
    cat(sprintf("%s = (%s)\n", 
                as.character(deparse(substitute(vector))), 
                paste(as.character(vector), collapse=", ")))
}

## a)
# ?rep
# ?seq
a <- rep(seq(1, 3), each = 3)
b <- seq(3, 28, by = 5)
c <- rep(seq(12, 7, by = -5), times = 3)

print_vector(a)
print_vector(b)
print_vector(c)
####sieht hübsch aus, bringt aber nicht viel zum weiterrechnen.
####wenn du möchtest, dass ein definierter Vektor direkt auf der Konsole angezeigt wird, kannst du einfach klammern drum machen:
(a <- rep(seq(1, 3), each = 3))


## b)
d1 <- rep(seq(7, 9), times = 2)
d2 <- rep(6, times = 6) + seq(1, 3)
d3 <- rep(seq(3), times = 2) + 6

print_vector(d1)
print_vector(d2)
print_vector(d3)

## c)
x <- c(seq(9, 25), 4, 56)

print_vector(x)

x[seq(7, length(x), by = 7)] <- 4

print_vector(x)

# d)
i_of_every_3rd <- c(seq(3, length(x), by = 3)) 
i_of_every_5th <- c(seq(5, length(x), by = 5))
i_of_every_3rd_and_5th <- union(i_of_every_3rd, i_of_every_5th)
x[i_of_every_3rd_and_5th] <- -x[i_of_every_3rd_and_5th]

print_vector(x)

## e)
y <- 0:6
z <- c(4, 5)
y + z 
# R performs a vector addition
# R recycles the vector z because it contains fewer elements than y
# R calculates: c(0, 1, 2, 3, 4, 5, 6) + c(4, 5, 4, 5, 4, 5, 4)
# R also returns a warning because the number of elements in y 
# is not divisable by the number of elements in z

## f)
u <- c(3, 4, 3, 4)
u * 7
# R calculates: (3 * 7, 4 * 7, 3 * 7, 4 * 7) 

## g)
v <- c(3, 5, 8, 5, 11, 4, 7)
w <- c(12, 2, 1.5, -8, 3, 3.5, 6)

### (i)
sum(log10(v[1:6]))		

### (ii)
prod(1 / abs(w[4:7]))

### (iii)
sum(v[2:7] + w[2:7])

### (iv)
sum(v[1:7] * w[1:7])

# Aufgabe 8
## a)
x <- 2^(1:9)

## b)
X <- matrix(x, nrow = 3)
X

## c)
diag(X) <- 1
X

## d)
X[2, ]
X[3, 2]

## e)
X[2, , drop = FALSE]
X[3, 2, drop = FALSE]
str(X[2, ])
str(X[2, , drop = FALSE])
str(X[3, 2])
str(X[3, 2, drop = FALSE])
# "X[i, j, drop = TRUE]" returns a simplifyed subset of X.
# (here: the structure of a vector or an integer)
# "X[i, j, drop = TRUE###FALSE]" returns a preseved subset of X.
# (here: the structure of a matrix)
# "Simplifying subsets returns the simplest possible data structure 
# that can represent the output [...]. Preserving subsetting keeps the 
# structure of the output the same as the input [...]." 
# (Wickham, H. (2014): "Subsetting". URL: http://adv-r.had.co.nz/Subsetting.html.)

## f)
X[, 3] <- c(1, 2, 3) ###für solche Sequenzen ist 1:3 kürzer

## g)
X <- X[, c(2, 1, 3)]

## h)
X[X == 2 | X == 3] <- X[X == 2 | X == 3] * -1

## i)
A <- matrix(seq(4, 10, by = 2), nrow = 2, byrow = TRUE)
B <- matrix(rep(4, 4), nrow = 2)
A * B

## j)
A %*% B
