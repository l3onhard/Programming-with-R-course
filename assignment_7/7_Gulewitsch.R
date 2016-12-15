# Abgabe von Leonhard Gulewitsch

# Aufgabe 18

## a)

pdf("iris.pdf")
pairs(iris[1:4], main = "Anderson's Iris Data -- 3 species",
      pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])
dev.off()

## b)

png("iris.png")
pairs(iris[1:4], main = "Anderson's Iris Data -- 3 species",
      pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])
dev.off()

## c)

svg("iris.svg")
pairs(iris[1:4], main = "Anderson's Iris Data -- 3 species",
      pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])
dev.off()

## d)

win.metafile("iris.wmf")
pairs(iris[1:4], main = "Anderson's Iris Data -- 3 species",
      pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])
dev.off()

# Aufgabe 19

load("//server01/lehre/ProgrammierenR/Daten/herz200.RData")

## a)
colnames(herz)
plot_titles <- c("Diagnose", "Nr", "Geschlecht (w = weiblich, m = maenlich)",
                    "Untersuchungsdatum", "Geburtsdatum", "Größe (in cm)",
                    "Gewicht (in kg)", "HF", "RR_sys", "Rhythmus", "Alter (in Jahren)", "BMI in (kg/m^2)")
as.vector(sapply(herz, class))

for(col_name in colnames(herz)) {
  if(class(herz[[col_name]]) == "factor") {
    barplot(table(herz[[col_name]]), main = paste("Stabdiagramm von\n", 
                                                  plot_titles[which()]),
            xlab = col_name)
  }
  if(class(herz[[col_name]]) == "integer") {
    hist(table(herz[[col_name]]), main = paste("Histogramm von\n", 
                                               col_name),
         xlab = col_name)
  }
  if(class(herz[[col_name]]) == "numeric") {
    boxplot(herz[[col_name]], ylab = col_name)
    title(paste("Boxplot von\n", col_name))
  }
}
