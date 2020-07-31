# Dplyr

library(dplyr)
install.packages('nycflights13')
library(nycflights13)

head(flights)
summary(flights)

## Dplyr uses the following functions:
#+ filter() and slice()
#+ arrange()
#+ select() and rename()
#+ distinct()
#+ mutate() and transmute()
#+ summarise()
#+ sample_n() and sample_frac()

## Filter(df, column1 arg, column2 arg, ...) much easier syntax
head(filter(flights, month==11, day==3, carrier=='AA'))

## Slice function: used to slice out rows by position
slice(flights, 10:20)

## Arrange, instead of filtering or selecting rows, it reorders row
head(arrange(flights, year, month, day, arr_time))

## Arrange in descending order by passing desc function to whatever column you want descending
head(arrange(flights, year, month, day, desc(arr_time)))

## Select function: Quickly grab data and columns you want to select
head(select(flights, carrier))

head(select(flights, carrier, arr_time))

## Rename function: allows you to quickly rename columns
head(rename(flights, airline_carrier = carrier))

## Distinct function: allows you to select unique values in column or table
distinct(select(flights, carrier))

### As you can see, distinct provided the 16 unique carrier values in df

## Mutate function: Add new columns that are built off a formula(s) of existing columns
head(mutate(flights, new_col = arr_delay - dep_delay))

### If you only want the new_col back, use transmute() instead of mutate()

## Summarise function: allows you to quickly collapse df into single rows using function that aggregates result
summarise(flights, avg_air_time = mean(air_time, na.rm = TRUE))

### na.rm = TRUE is for mean function to just remove na values

summarise(flights, total_time = sum(air_time, na.rm = TRUE)) 

### Total time spent in air by all flights

## Sample_n, sample_frac: allows you to take random number of rows or fraction of rows
sample_n(flights, 10) # 10 random rows

sample_frac(flights, .005) # 10% of random rows

## Pipe operator

### Difference between usual nesting syntax vs. pipe. Nesting is more difficult read (from inside out):
df <- mtcars
result <- arrange(sample_n(filter(df, mpg>20), size=5), desc(mpg))
result

### Pipe formula: df %>% op1 %>% op2 %>% op3
df %>% filter(mpg>20) %>% 
  sample_n(5) %>% 
  arrange(desc(mpg))

## Dplyr training exercise



























