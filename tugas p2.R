# Tugas Pertemuan ke-2

# Nama  : Alfianri Manihuruk
# NIM   : 120450088
# Matkul: Komputasi Statistik

# 1. Buatlah list yang berisikan elemen dengan type data yang dibebaskan. Kemudian ganti setiap elemen pada list dengan repetisi dari masing-masing

# membuat beberapa objek dengan class yang berbeda 
v <- c(1, 2, 3, 4, 5)
m <- matrix(1:10, nrow = 2)
c <- factor(c("a", "b", "c", "d"))
k <- c(8i, 10i, 12i)
l <- c(TRUE, FALSE)

# membuat list dengan isi yang berbeda-beda
listku <- list(v, m, c, k, l)

# membuat repetisi dengan mengulang tiap index seperti yang di minta soal
rep(listku, times= 1, length.out= NA, each= 3)


# membuat repetisi list mengulang listnya sediri
rep(listku, 3)



# 2. Ganti nama kolom pada data iris dengan nama kolom_i, untuk i dari 1 sampai5. sepal.length -> kolom_1, species -> kolom_5

# defenisikan data iris sebagai df
df= iris
# menampilkan semua kolom data yang ada
names(df)
# mengganti nama kolom
colnames(df)[colnames(df)=="Sepal.Length"] = "kolom_1"
colnames(df)[colnames(df)=="Sepal.Width"] = "kolom_2"
colnames(df)[colnames(df)=="Petal.Length"] = "kolom_3"
colnames(df)[colnames(df)=="Petal.Width"] = "kolom_4"
colnames(df)[colnames(df)=="Species"] = "kolom_5"
# memeriksa nama kolom terbaru
names(df)
# memanggil data terbaru keseluruhan 
df