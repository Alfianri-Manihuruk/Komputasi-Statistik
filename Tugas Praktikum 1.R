# Nama    : Alfianri Manihuruk
# NIM     : 120450088
# Matkul  : Komputasi Statistik

heart <- as.data.frame(Heart)
library(ggplot2)

# Nomor 7 
# Buat histogram berdasarkan Age
ggplot(heart, aes(x= Heart$Age))+
  geom_bar(fill="yellow",
           color='azure4')+
  theme_classic()+
  labs(x="usia",
       y="Frekuensi",
       title="histogram usia")


# Nomor 8
# Buat histogram berdasarkan Age dimana sumbu y dalam persen 
ggplot(heart, aes(x=Age,
                  y= ..count.. /sum(..count..)))+ 
  geom_bar(fill=rainbow(41),
           color='azure4')+
  theme_classic()+
  labs(x="Usia",
       y="Frekuensi",
       title="Heart")+
  scale_y_continuous(labels=scales::percent)

# Nomor 9
# Buatlah diagram titik berdasarkan Age
ggplot(heart, aes(x=Age, y= RestBP))+
  geom_point(color= "black", fill= "red")+
  theme_light()+labs(x='Usia',y= "RestBP", title='Hubungan Usia dengan RestBP')
 


# Data Bivariat

#  Plot Diagram Variabel Kategorik Vs Kategorik

#1.Plot menggunakan diagram batang bertumpuk, hubungan antara kelas mobil dengan 
#   jenis penggerak ( roda depan, roda belakang, atau penggerak 4 roda).
mpg$drv=factor(mpg$drv, levels=c('f','r','4'),
               labels=c('front-wheel','real-wheel','4-wheel'))
mpg
# Diagram Batang Bertumpuk
ggplot(mpg, aes(x=class, fill=drv))+
  geom_bar(position='fill')+
  theme_minimal()+
  labs(y="proportion")


# 2. Plot menggunakan diagram batang yang dikelompokkan, hubungan antara kelas 
# mobil dgn jenis penggerak (roda depan, roda belakang, atau penggerak 4 roda). 

ggplot(mpg, aes(x=class, fill=drv))+
  theme_minimal()+
  geom_bar(position=position_dodge(preserve="single"))


# Pada nomor 1, tambahkan persentasenya
ggplot(mpg, aes(x=class, fill=drv))+
  geom_bar(position='fill')+
  theme_minimal()+
  labs(y="proportion")+
  scale_y_continuous(labels=scales::percent)


# Plot Diagram Variabel Kontinu Vs Kontinu
# Lakukan dot plot terhadap dataset “Salaries” antara pengalaman dengan 
# gaji dari Professor PT
library(ggplot2)
library(scales)
library(carData)
data(Salaries, package = "carData")

ggplot(Salaries, 
       aes(x= yrs.since.phd,
           y= salary)) +
  geom_point(color= "cornflowerblue",
             size = 2,
             alpha =.8)+
  scale_y_continuous(label= scales:: dollar,
                     limits = c(50000, 250000))+
  scale_x_continuous(breaks = seq(0, 60, 10),
                     limits = c(0, 60))+
  
  theme_minimal()+
  labs(x= "Tahun Since PhD",
       y= "",
       title = " Pengalaman Vs Gaji",
       subtitle = "gaji 9 bulan dari 2008 - 2009")

# 1. Lakukan barplot yang menampilkan gaji rata-rata Professor berdasarkan jabatan akademik


# cara1
ggplot(Salaries, aes(x=yrs.since.phd,
                     y = salary,
                     color = rank))+
  geom_bar()+
  theme_minimal()+
  labs(title= "Academic Salary by Rank and Years sice Degree")

# Plot Diagram Variabel Kategorik Vs Kontinu
plotdata <- Salaries %>%
  group_by(rank) %>%
  dplyr::summarize(mean_salary = mean(salary))

# Membuat plot mean gaji
mycols <- c("#009999", "#0000FF", "#0073C2FF")
ggplot(plotdata, 
       aes(x = factor(rank,
                      labels = c("Assistant\nProfessor",
                                 "Associate\nProfessor",
                                 "Full\nProfessor")), 
           y = mean_salary)) +
  geom_bar(stat = "identity", 
           fill = mycols) +
  geom_text(aes(label = dollar(mean_salary)), 
            vjust = -0.25) +
  scale_y_continuous(breaks = seq(0, 130000, 20000), 
                     label = dollar) +
  theme_minimal() +                               
  labs(title = "Rata-rata Gaji Berdasarkan Jabatan", 
       subtitle = "9 bulan gaji akademik untuk 2008-2009",
       x = "Jabatan",
       y = "Gaji")



#.2. Lakukan boxplot yang menampilkan gaji rata-rata Professor berdasarkan 
#jabatan akademik
# Nomor 2
ggplot(Salaries, aes(x = rank, 
                     y = salary)) +
  geom_boxplot(notch = TRUE, 
               fill = c("lightgreen", "cyan", "red"), 
               alpha = .7) +
  theme_minimal() +
  labs(title = "Rata-rata Gaji Berdasarkan Jabatan",
       x = "Jabatan",
       y = "Gaji")





