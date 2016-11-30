## Abgabe von Leonhard Gulewitsch

# Gesamt: 2 + 3 + 3.5 = 8.5  /9

load("//server01/lehre/ProgrammierenR/Daten/Anmeldung_WS1617.RData")

###Aufgabe 3		2/2.5
# a)		0.5/0.5

rawAZ <- anmeldezeit
rawGR <- gruppe
rawSG <- studiengang
rawU3 <- U3

rawAZ_isNA <- is.na(rawAZ)
rawGR_isNA <- is.na(rawGR)
rawSG_isNA <- is.na(rawSG)
rawU3_isNA <- is.na(rawU3)

which(rawAZ_isNA) # 123
which(rawGR_isNA) # integer(0) => keine NA
which(rawSG_isNA) # integer(0) => keine NA
which(rawU3_isNA) # integer(0) => keine NA

AZ <- rawAZ[!rawAZ_isNA]
GR <- rawGR[!rawAZ_isNA]
SG <- rawSG[!rawAZ_isNA]
U3 <- rawU3[!rawAZ_isNA]

### sehr schön!

# b)		0.5/0.5

apropos("median") # "median" "median.default"
?median 
# Anhand der R Dokumentation zu "Median Value" stellte ich fest, dass meidan() in R
# genau so definiert ist wie auf dem Uebungsblatt.
apropos("min") # ".rs.setUsingMingwGcc49" ... "min" ... "which.min"
?min
# Anhand der R Dokumentation zu "Maxima and Minima" stellte ich fest, 
# dass min() bzw. max() den minmalen bzw. maximalen Wert des Imputs ausgeben.

median(AZ)
min(AZ)
max(AZ)

### wenn nicht danach gefragt ist, wie du die Funktion gefunden hast, brauchst du diesen Teil nicht ausführlich zu beschreiben.

# c)		0.5/1

?table
?barblot
apropos("length") # "length" "length.POSIXlt" ...
?length
barplot(table(SG)/length(SG))		#Barplot zu den Häufigkeiten, nicht den relativen Häufigkeiten.
### Häufigkeitstabelle?

# d)		0.5/0.5

barplot(table(GR))
table(GR)
# Antwort: Ja. Wie man an der Haeufigkeitstabelle und dem Balkendiagram erkennen 
# kann, unterscheiden sich die absoluten Haeufigkeiten nur geringfuegig.

### sehr schön!

## Aufgabe 4		3/3
registragtion_start <- as.POSIXct("2016-10-20 22:00:00") # RS
lecture_start <- as.POSIXct("2016-10-21 10:15:00") # LS
lecture_end <- as.POSIXct("2016-10-21 11:15:00") # LE
saturday_0 <- as.POSIXct("2016-10-22 00:00:00") # Sa0
saturday_6 <- as.POSIXct("2016-10-22 06:00:00") # Sa6
sunday_0 <- as.POSIXct("2016-10-23 00:00:00") # So0
sunday_6 <- as.POSIXct("2016-10-23 06:00:00") # So6

# a)		0.5/0.5

fromRStillLB <- as.numeric(lecture_start - registragtion_start) * 60
all(AZ > fromRStillLB)

### bitte Ergebnisse aufschreiben!

# b)		0.5/0.5

fromRStillLE <- as.numeric(lecture_end - registragtion_start) * 60
sum(fromRStillLB < AZ & AZ <= fromRStillLE)

# c)		0.5/0.5
fromRStillSa0 <- as.numeric(saturday_0 - registragtion_start) * 60 * 24
fromRStillSa6 <- as.numeric(saturday_6 - registragtion_start) * 60 * 24
fromRStillSo0 <- as.numeric(sunday_0 - registragtion_start) * 60 * 24
fromRStillSo6 <- as.numeric(sunday_6 - registragtion_start) * 60 * 24

sum((fromRStillSa0 < AZ & AZ <= fromRStillSa6) | (fromRStillSo0 < AZ & AZ <= fromRStillSo6))

# d)		0.5/0.5

NOTstat_AND_NOTdata <- (SG != "Statistik") & (SG != "Datenanalyse")
GR2 <- GR == 2
sum(GR2 & NOTstat_AND_NOTdata)

# e)		0.5/0.5

table(GR[SG == "Statistik" | SG == "Datenanalyse"])

# f)		0.5/0.5

table(U3[GR == 3])
# Antwort: 22 Teilnehmer der Gruppe 3 haben 
# fuer die Gruppe 3 die Praeferenz "sehr gerne" angegeben.
# Keine der Teilnehmer der Gruppe 3 haben fuer die 
# Gruppe 3 die Praeferenz "ungern" angegeben.

## Aufgabe 5		3.5/3.5
# a)

ls()

# b)

getwd()
setwd("C:/user/gulewitsch")

# c)

apropos("save")
?save
save.image(file = "workspaceBlatt2.RData")

# d)

save(gruppe, file = "gruppe.RData")

# e)

any(ls() == "U3")
rm(U3)
any(ls() == "U3")

# f)

apropos("history")
?history
history(max.show = 10) # Das scheint leider nicht zu funktionieren
### funktioniert doch!


# g)

rm(list = ls())
