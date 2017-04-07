# Abgabe von Leonhard Gulewtisch

# Gesamt: 3 + 2 + 5 = 10  /10


printVariable <- function(v){
  cat(sprintf("%s = %f\n", 
              deparse(substitute(v)), v))
}

printDate <- function(v){
  cat(sprintf("%s = \"%s CEST\"\n", 
              deparse(substitute(v)), as.character(v)))
}

printVector_chr <- function(v){
  cat(sprintf("%s = (%s)\n", 
              deparse(substitute(v)), paste(shQuote(v, type="cmd"), collapse=", ")))
}



# Aufgabe 15		3/3

library("RODBC")
channel <- odbcConnectExcel2007("Luft.xlsx")
sqlTables(channel)
sqlColumns(channel, "Datum")$COLUMN_NAME
sqlColumns(channel, "Luft")$COLUMN_NAME

## a)

df.air <- sqlQuery(channel, 'select * from "Luft$"')

###wozu das folgende?
df.date <- sqlQuery(channel, 'select * from "Datum$"')
str(df.date$Datum)
df.date$Datum <- as.POSIXct(df.date$Datum, format = "%B-%d %Y")
df.date$Monat <- as.numeric(format(df.date$Datum, "%m"))
df.date$Tag <- as.numeric(format(df.date$Datum, "%d"))

df.airquality <- if(nrow(df.air) == nrow(df.date)){
  merge.data.frame(df.air, df.date,
                   by = c("Monat", "Tag"), 
                   sort = F)[, union(names(df.air), names(df.date))]
}

## b)

all.equal(df.air, airquality, check.names = FALSE)
# Abgesehen von den Spaltennamen sind alle Werte in "df.air" und "airquality"
# gleich.

all.equal(df.air, df.airquality[,1:6])

## c)

rm("df.air", "df.airquality", "df.date")

df.Wind_JuniJuly <- sqlQuery(channel, "select Wind from \"Luft$\" 
                             where Monat = 6 or Monat = 7")
median.Wind_JuniJuly <- median(df.Wind_JuniJuly$Wind)

df.Temp_JuniJuly <- sqlQuery(channel, "select Temp from \"Luft$\" 
                             where Monat = 6 or Monat = 7")
median.Temp_JuniJuly <- median(df.Temp_JuniJuly$Temp)

printVariable(median.Temp_JuniJuly)
printVariable(median.Wind_JuniJuly)

close(channel)

# Aufgabe 16		2/2
library(openxlsx)

## a)

df.air2 <- read.xlsx("//Server01/lehre/ProgrammierenR/Daten/Luft.xlsx")
all.equal(df.air2, airquality, check.names = FALSE)

## b)

df.air3 <- read.table(file("clipboard"), sep = "\t", header = T, dec = ",")
all.equal(df.air3, airquality, check.names = FALSE)

# Aufgabe 17		5/5

## a)

bdayFisher <- c("1890-02-17", "17. Februar 1890", "17.02.1890")
date.bdayFisher <- c(as.Date(bdayFisher[1], "%Y-%m-%d"), as.Date(bdayFisher[2], "%d. %B %Y"), as.Date(bdayFisher[3], "%d.%m.%Y"))

printVector_chr(date.bdayFisher)

## b)

date.ageFisher_inDays <- difftime(Sys.Date(), date.bdayFisher[1], units = "days")

printVariable(date.ageFisher_inDays[1])

##  c)

date.ageFisher_inYears <- as.numeric(date.ageFisher_inDays) / 365.25

printVariable(floor(date.ageFisher_inYears))

###### kompliziertere Version aus der Musterlösung;)
## Besser (aber zugegeben recht kompliziert):
Datum <- as.Date(Sys.time())
AgeFisher <- as.numeric(format(Datum, format="%Y")) - as.numeric(format(Fisher,
format="%Y"))
temp <- as.Date(paste(format(Datum, format="%Y"), "-", format(Fisher,
format="%m-%d"), sep=""))
AgeFisher[which(temp > Datum)] <- AgeFisher[which(temp > Datum)] - 1
AgeFisher


## d)

date.2016_09_30 <- strptime("30.09.2016, 12:00 Uhr", "%d.%m.%Y, %H:%M Uhr")
date.2016_11_30 <- strptime("30.11.2016, 12:00 Uhr", "%d.%m.%Y, %H:%M Uhr")

printDate(date.2016_09_30)
printDate(date.2016_11_30)

## e)

timeDiff.30sep_30nov_inDays <- difftime(date.2016_11_30, date.2016_09_30, units = "days")
printVariable(timeDiff.30sep_30nov_inDays)


timeDiff.61days_and_1hour <- as.difftime(61, units = "days") + as.difftime(1, units = "hours")
timeDiff.30sep_30nov_inSecs <- as.numeric(timeDiff.30sep_30nov_inDays, units = "secs")
timeDiff.61days_and_1hour - timeDiff.30sep_30nov_inSecs

# Zwischen den zweit Zweitpunkten sind etwa 61,04 Tage vergangen. Wie die vorrangegangene Berechnung verdeutlicht,
# entspricht dieser Zeitraum genau 61 Tage und 1 Stunde. Die "Extra"-Stunde ergibt sich druch die Zeitumstellung 
# von Sommerzeit auf Winterzeit (d.h. plus eine Stunde), die am 30 Oktober stattgefunden hat.
