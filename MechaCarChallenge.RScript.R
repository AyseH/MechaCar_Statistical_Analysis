library(dplyr)
#Deliverable 1

MechaCar_table <- read.csv('MechaCar_mpg.csv') #read the csv data file to dataframe

head(MechaCar_table)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_table) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_table)) #generate the p-value and r-squared

#Deliverable 2

SuspensionCoil_table <- read.csv('Suspension_Coil.csv') #read the csv data file to dataframe

head(SuspensionCoil_table)

total_summary <- SuspensionCoil_table %>% summarize(Mean_PSI = mean(PSI), Median_PSI = median(PSI), Variance_PSI = var(PSI), SD_PSI = sd(PSI), .groups = 'keep') #create a total_summary table for PSI

lot_summary <- SuspensionCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI = mean(PSI), Median_PSI = median(PSI), Variance_PSI = var(PSI), SD_PSI = sd(PSI), .groups = 'keep') #create a lot_summary table for PSI
  
#Deliverable 3

sample_table <- SuspensionCoil_table %>% sample_n(50) #generate a random sample from the SuspensionCoil population data

t.test(sample_table$PSI, mu=mean(SuspensionCoil_table$PSI)) #compare sample versus population means
lot1_table <- subset(SuspensionCoil_table, Manufacturing_Lot == "Lot1")
lot2_table <- subset(SuspensionCoil_table, Manufacturing_Lot == "Lot2")
lot3_table <- subset(SuspensionCoil_table, Manufacturing_Lot == "Lot3")

t.test(lot1_table$PSI, mu=mean(SuspensionCoil_table$PSI)) #compare Lot1 sample versus population mean
t.test(lot2_table$PSI, mu=mean(SuspensionCoil_table$PSI)) #compare Lot2 sample versus population mean
t.test(lot3_table$PSI, mu=mean(SuspensionCoil_table$PSI)) #compare Lot3 sample versus population mean




