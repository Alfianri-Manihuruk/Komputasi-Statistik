# Nama  : Alfianri Manihuruk
# NIM   : 120450088
# Matkul: Komputasi Statistik

#==========================================================================================================#
# import data 
dataku <- read.csv("D:/Sains Data Semester 5/Komputasi Statistik/3. Tugas Pertemuan 3.csv", header = TRUE)

# No 1
str(dataku) # melihat str data yang kita miliki
is.factor(x$y) # melihat kolom yang termaksut faktor
summary(dataku) # Menampilkan ringkasan data

# mengubah type data character
dataku$gender <- factor(dataku$gender)
dataku$race.ethnicity <- factor(dataku$race.ethnicity)
dataku$parent_education_level <- factor(dataku$parent_education_level, order = TRUE,
                                      levels =c("some high school", 
                                                "high school", 
                                                "some college", 
                                                "associate\'s degree", 
                                                "bachelor\'s degree",
                                                "master\'s degree"))
dataku$lunch <- factor(dataku$lunch)
dataku$test_prep_course <- factor(dataku$test_prep_course)

# periksa kembali struktur datanya 
str(dataku)
summary(dataku)


# Membuat Histogram untuk memeriksa outlier
# nilai maximum dan minimum
summary(dataku$math)
#  membuat barplot untuk mendeteksi outlier juga
hist(dataku$math,
     xlab = "math",
     main = "Histogram Atribut Math",
     breaks = sqrt(nrow(dataku)))

# membuat boxplot untuk mendeteksi outlier juga
boxplot(dataku$math,
        ylab = "nilai math")

# melihat nilai yang outlier
boxplot.stats(dataku$math)$out


# Membuat visualisasi
# par(mfrow=c(3,2))
barplot(table(dataku$gender), main = "Bar Plot Gender")
barplot(table(dataku$race.ethnicity), main = "Bar Plot Race Ethnicity")
barplot(table(dataku$parent_education_level), main = "Bar Plot Parent Education Level")
barplot(table(dataku$lunch), main = "Bar Plot Lunch")
barplot(table(dataku$test_prep_course), main = "Bar Plot Test Preparation Course")
#==========================================================================================================#

# No2

# Menampilkan level faktor
sapply(dataku, levels)
# Recoding data
# membuat recode gender menjadi numeric 
dataku$gender_code <- recode(dataku$gender, 
                      "female" = 0,
                      "male" = 1)
# membuat recode kolom Parent_education_level menjadi dummy/numeric
dataku$parent_education_level_code <- recode(dataku$parent_education_level, 
                                      "some high school" = 0,
                                      "high school" = 1,
                                      "some college" = 2,
                                      "associate's degree" = 3,
                                      "bachelor's degree" = 4,
                                      "master's degree" = 5)

dataku$lunch_code <-  recode(dataku$lunch, 
                      "free/reduced" = 1,
                      "standard"     = 2)
head(dataku)

#==========================================================================================================#

# No 3
# mengurutkan data berdasarkan kolom "race"
dataku <- dataku[order(dataku$race.ethnicity) , ]
head(dataku)
#==========================================================================================================#

# No 4
# konversi nilai ke nilai huruf
dataku$nilai_huruf = cut(dataku$math, 
                     breaks = c(0, 54, 59,64, 69, 74, 79, Inf), 
                     labels = c("E", "D", "C", "BC", "B", "AB", "A"),
                     right = TRUE, 
                     include.lowest = TRUE)

#Tambahkan kolom Status Penilaian
dataku$status_penilaian <- recode(dataku$nilai_huruf, 
                                "A" = "Lulus",
                                "AB" = "Lulus",
                                "B" = "Lulus",
                                "BC" = "Lulus",
                                "C" = "Lulus",
                                "D" = "Tidak Lulus",
                                "E" = "Tidak Lulus")
#==========================================================================================================#

# No 5
# cek data
df<- read.csv("D:/Sains Data Semester 5/Komputasi Statistik/3. Tugas Pertemuan 3.csv", header = TRUE)
#pivot the data frame into a long format
dataku1<- df %>% pivot_longer(cols=c('gender', 'race.ethnicity'),
                                  names_to='columns',
                                  values_to='values')
head(dataku1)

#pivot the data frame into a wide format
dataku1 %>% pivot_wider(names_from = columns, values_from = values)

head(dataku1)


#==========================================================================================================#
# No 6
# perbandingan mahasiswa mengikuti kursus dan tidak mengikuti kursus
tidak_kursus= subset(dataku, dataku$test_prep_course == "none")
table(tidak_kursus$status_penilaian)

sum(is.na(tidak_kursus$status_penilaian))

# mahasiswa ikut kursus
data_kursus = subset(dataku, dataku$test_prep_course=="completed")
table(data_kursus$status_penilaian) 

sum(is.na(data_kursus$status_penilaian))

