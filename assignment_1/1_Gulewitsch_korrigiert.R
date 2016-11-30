## Abgabe von Leonhard Gulewitsch

### Gesamt: 2 + 3 = 5  /5 

# Aufgabe 0		2/2

## Lösung zu Aufgabe 1:
## 1 a)
1 + 3
3 + 5 * 2
(4 / pi)^3
0 / Inf
# usw.

## 1 b)
12897981655 / 928409840203840982
12345 65432  + + 1   # seeeehr abwegige Ideen ...
# usw.

## 1 c)
cos(c(pi, 2*pi, 3*pi, 4*pi))
# usw.

## 1 d)
?cos
# usw.

## Lösung zu Aufgabe 2:			3/3
## 2 a)
60 + 5
60 + 5,5 # Error: unexpected ',' in "60 + 5,"
20 0 + 1 # Error: unexpected numeric constant in "20 0"
3 * (2 + 5)
100 + "fuenf" # Error in 100 + "fuenf" : non-numeric argument to binary operator
5 / 2
2 * 3^2
(2 * 3)^2

### Besser: alle Ergebnisse angeben, bei Fehlern Verbesserungsvorschläge
### 1/1


## 2 b)
x <- 4
y <- -2

4 * abs(-1)
x / (x + 2 * y)
sqrt(cos(5 * x))
exp(1)^x		#better: exp(x)
(2 * pi)^(1 / x)

### see above: give results
### 1/1

## 2 c)
# Using the help.search() funktion, I searched for the word "mean": 
help.search("mean") # running this does not result in anything 
### in fact, it does open a webpage, the problem with using it on the computers in uni is
### that the function searches all installed packages and in uni there are so many of them, that it takes
### a really long time to search through all of them, so it seems as if nothing happens.

# Next I used apropos():
apropos("mean")
# From the output of this funktion I chose "mean". 
# Next I checked whether this is the function I am looking for:
?mean
# According to the Helpsystem mean(x) calculates the arithmetic mean of the object x (e.g. a vector)

# my example:
set.seed(45); a <- rnorm(n = 10, mean = 10, sd = 10)
mean(a) # [1] 8.181991

### excellent!
### 1/1

## Loesung der Aufgabe 3

## 3 b)
# C:\Users\gulewitsch\Desktop

