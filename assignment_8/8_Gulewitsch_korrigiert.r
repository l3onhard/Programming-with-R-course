# Abgabe von Leonhard Gulewitsch

# Gesamt: 7 + 0 = 7  /11

# Aufgabe 21		7/7
load("//server01/lehre/ProgrammierenR/Daten/herz200.RData")

## a) bis d)


par(mar = c(5, 6, 5, 2))
boxplot(split(herz$BMI, herz$Geschlecht), 
        names = c("maennlich", "weiblich"), 
        xlim = c(0.5, 3.3), ylim = c(0, 50))

title(main = "Boxplots des BMIs aufgeteilt\n nach Geschlecht", 
      xlab = "Geschlecht", 
      ylab = expression(BMI == frac(gamma, delta^2) ~~ "(in" ~~ frac(kg, m^2) * ")"))

BMI_limits <- list(list(0, "white"), list(18.5, "red"), list(25, "blue"), list(30, "green"), list(50, "white"))

for(limit in BMI_limits) {
  lines(c(0,4), c(limit[[1]], limit[[1]]), col = limit[[2]], lwd = 2, lty = 2)
}

BMI_categories <- c("Untergewicht", "Normalgewicht", "Uebergewicht", "Adipositas")

for(index in seq_along(BMI_categories)) {
  text(x = 3, 
       y = mean(c(BMI_limits[[index]][[1]], BMI_limits[[index + 1]][[1]])), 
       BMI_categories[index])
}
dev.off()		#? warum?

## e)

plot(herz$Groesse ~ herz$Alter, 
     col = c("red", "green", "blue")[herz$Diagnose], pch = 21,
     bg = c("red", "green", "blue")[herz$Diagnose],
     xlab = "Alter (in Jahren)", ylab = "Koerpergroesse in (in cm)"
     )
legend("topleft", legend = levels(herz$Diagnose), 
       col = c("red", "green", "blue"), pch = 16, title = "Diagnose")
title("Koerpergrosse in Abhaenigkeit vom Alter")
dev.off()

## f)

pdf("Balkendiagramme.pdf")
par(mfrow = c(1,2), oma = c(0,0,3,0))
barplot(table(herz$Diagnose))
title("Diagnose")
barplot(table(herz$Rhythmus))
title("Rhythmus")
title(main = "Balkendiagramme der Diagnosen\n und des Herzrhytmuses", outer = TRUE)
dev.off()


#### x-Achse sollte noch beschriftet werden (Anzahl)



### A22		0/4