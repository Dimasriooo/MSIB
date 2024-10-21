MariaDB [(none)]> CREATE DATABASE dbtokosib7;
Query OK, 1 row affected (0.017 sec)


MariaDB [(none)]> USE dbtokosib7;
Database changed
MariaDB [dbtokosib7]>  CREATE TABLE pelanggan (
    -> kode INT PRIMARY KEY,
    -> nama VARCHAR(100));
Query OK, 0 rows affected (0.032 sec)

MariaDB [dbtokosib7]> CREATE TABLE Kartu (
    -> id INT PRIMARY KEY,
    -> nama_kartu VARCHAR(50),
    -> diskon DECIMAL(5,2));
Query OK, 0 rows affected (0.019 sec)

MariaDB [dbtokosib7]> CREATE TABLE Pesanan (
    ->     id INT PRIMARY KEY,            -- Primary Key untuk tabel Pesanan
    ->     tanggal DATE,                  -- Tanggal pesanan
    ->     total DECIMAL(10, 2),          -- Total pembayaran
    ->     kode_pelanggan INT,            -- Foreign Key ke Pelanggan
    ->     kartu_id INT,                  -- Foreign Key ke Kartu
    ->     FOREIGN KEY (kode_pelanggan) REFERENCES Pelanggan(kode),
    ->     FOREIGN KEY (kartu_id) REFERENCES Kartu(id)
    -> );
Query OK, 0 rows affected (0.018 sec)

MariaDB [dbtokosib7]> CREATE TABLE Produk (
    ->     id INT PRIMARY KEY,          -- Primary Key untuk Produk
    ->     nama VARCHAR(100),           -- Nama produk
    ->     harga DECIMAL(10, 2)         -- Harga produk
    -> );
Query OK, 0 rows affected (0.018 sec)

MariaDB [dbtokosib7]> CREATE TABLE Vendor (
    ->     id INT PRIMARY KEY,          -- Primary Key untuk Vendor
    ->     nama VARCHAR(100),           -- Nama vendor
    ->     kontak VARCHAR(100)          -- Informasi kontak vendor
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [dbtokosib7]> CREATE TABLE Pembelian (
    ->     id INT PRIMARY KEY,          -- Primary Key untuk Pembelian
    ->     tanggal DATE,                -- Tanggal pembelian
    ->     nomor VARCHAR(50),           -- Nomor pembelian
    ->     jumlah INT,                  -- Jumlah produk yang dibeli
    ->     harga DECIMAL(10, 2),        -- Harga total pembelian

    ->     produk_id INT,               -- Foreign Key ke Produk

    ->     vendor_id INT,               -- Foreign Key ke Vendor

    ->     FOREIGN KEY (produk_id) REFERENCES Produk(id),
    ->     FOREIGN KEY (vendor_id) REFERENCES Vendor(id)
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [dbtokosib7]> CREATE TABLE Pesanan_Items (
    ->     id INT PRIMARY KEY,          -- Primary Key untuk item pesanan
    ->     pesanan_id INT,              -- Foreign Key ke tabel Pesanan
    ->     produk_id INT,               -- Foreign Key ke tabel Produk
    ->     qty INT,                     -- Jumlah produk
    ->     harga_jual DECIMAL(10, 2),   -- Harga jual per produk

    ->     FOREIGN KEY (pesanan_id) REFERENCES Pesanan(id),
    ->     FOREIGN KEY (produk_id) REFERENCES Produk(id)
    -> );
Query OK, 0 rows affected (0.019 sec)

MariaDB [dbtokosib7]> SELECT Pesanan.id, Pesanan.tanggal, Pesanan.total, Pelanggan.nama AS nama_pelanggan,
    ->        Kartu.nama_kartu, Kartu.diskon
    -> FROM Pesanan
    -> JOIN Pelanggan ON Pesanan.kode_pelanggan = Pelanggan.kode

    -> JOIN Kartu ON Pesanan.kartu_id = Kartu.id;
Empty set (0.034 sec)

MariaDB [dbtokosib7]> SELECT * FROM pesanan;
Empty set (0.004 sec)

MariaDB [dbtokosib7]> SELECT * FROM pelanggan;
Empty set (0.001 sec)

MariaDB [dbtokosib7]> SELECT * FROM Kartu;
Empty set (0.003 sec)

MariaDB [dbtokosib7]> INSERT INTO Pelanggan (kode, nama) VALUES (1, 'Dimas'), (2, 'Argya');
Query OK, 2 rows affected (0.016 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbtokosib7]> INSERT INTO Kartu (id, nama_kartu, diskon) VALUES (1, 'Kartu Silver', 10.00), (2, 'Kartu Gold', 15.00);
Query OK, 2 rows affected (0.004 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbtokosib7]> INSERT INTO pesanan
    -> (id, tanggal,total, kode_pelanggan, kartu_id)
    -> VALUES (1, '2024-11-30',150.00,1,1),
    ->  (2, '2024-12-01',200.00,2,2);
Query OK, 2 rows affected (0.008 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbtokosib7]> SELECT Pesanan.id, Pesanan.tanggal, Pesanan.total, Pelanggan.nama AS nama_pelanggan,
    ->        Kartu.nama_kartu, Kartu.diskon
    -> FROM Pesanan
    -> JOIN Pelanggan ON Pesanan.kode_pelanggan = Pelanggan.kode
    -> JOIN Kartu ON Pesanan.kartu_id = Kartu.id;
+----+------------+--------+----------------+--------------+--------+
| id | tanggal    | total  | nama_pelanggan | nama_kartu   | diskon |
+----+------------+--------+----------------+--------------+--------+
|  1 | 2024-11-30 | 150.00 | Dimas          | Kartu Silver |  10.00 |
|  2 | 2024-12-01 | 200.00 | Argya          | Kartu Gold   |  15.00 |
+----+------------+--------+----------------+--------------+--------+
2 rows in set (0.006 sec)


MariaDB [dbtokosib7]> SELECT Pesanan.id, Pesanan.tanggal, Pesanan.total, Pelanggan.nama AS nama_pelanggan,
    ->        Kartu.nama_kartu, Kartu.diskon
    -> FROM Pesanan
    -> JOIN Pelanggan ON Pesanan.kode_pelanggan = Pelanggan.kode
    -> JOIN Kartu ON Pesanan.kartu_id = Kartu.id;
+----+------------+--------+----------------+--------------+--------+
| id | tanggal    | total  | nama_pelanggan | nama_kartu   | diskon |
+----+------------+--------+----------------+--------------+--------+
|  1 | 2024-11-30 | 150.00 | Dimas          | Kartu Silver |  10.00 |
|  2 | 2024-12-01 | 200.00 | Argya          | Kartu Gold   |  15.00 |
+----+------------+--------+----------------+--------------+--------+
2 rows in set (0.002 sec)

MariaDB [dbtokosib7]> SELECT Pembelian.id, Pembelian.tanggal, Pembelian.nomor, Pembelian.jumlah,
    ->        Produk.nama AS nama_produk, Vendor.nama AS nama_vendor, Vendor.kontak
    -> FROM Pembelian
    -> JOIN Produk ON Pembelian.produk_id = Produk.id
    -> JOIN Vendor ON Pembelian.vendor_id = Vendor.id;
Empty set (0.011 sec)

MariaDB [dbtokosib7]> SELECT * FROM Vendor;
Empty set (0.008 sec)

MariaDB [dbtokosib7]> SELECT * FROM Produk;
Empty set (0.005 sec)

MariaDB [dbtokosib7]> SELECT * FROM Pembelian;
Empty set (0.012 sec)

MariaDB [dbtokosib7]> INSERT INTO produk (id, nama) VALUES
    -> (1, 'Laptop'),
    -> (2, 'Sepeda listrik'),
    -> (3, 'Televisi');
Query OK, 3 rows affected (0.028 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbtokosib7]> INSERT INTO Vendor (id, nama, kontak) VALUES
    -> (1, 'Vendor Wuling', '123456789'),
    -> (2, 'Vendor Samsung', '12329735');
Query OK, 2 rows affected (0.007 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbtokosib7]> INSERT INTO Pembelian (id, tanggal, nomor,
 jumlah, produk_id, vendor_id) VALUES
    -> (1, '2024-10-01', 'P001', 20, 1, 1),
    -> (2, '2024-10-11', 'P002', 15, 2, 1),
    -> (3, '2024-10-15', 'P003', 10, 3, 2);
Query OK, 3 rows affected (0.010 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbtokosib7]> SELECT Pembelian.id, Pembelian.tanggal, Pembelian.nomor, Pembelian.jumlah,
    ->        Harga.harga,  -- Memindahkan kolom harga di sini
    ->        Produk.nama AS nama_produk, Vendor.nama AS nama_vendor, Vendor.kontak
    -> FROM Pembelian
    -> JOIN Produk ON Pembelian.produk_id = Produk.id
    -> JOIN Vendor ON Pembelian.vendor_id = Vendor.id
    -> JOIN Harga ON Pembelian.produk_id = Harga.produk_id;
+----+------------+-------+--------+----------+----------------+----------------+-----------+
| id | tanggal    | nomor | jumlah | harga    | nama_produk    | nama_vendor    | kontak    |
+----+------------+-------+--------+----------+----------------+----------------+-----------+
|  1 | 2024-10-01 | P001  |     20 | 10000.00 | Laptop         | Vendor Wuling  | 123456789 |
|  2 | 2024-10-11 | P002  |     15 | 20000.00 | Sepeda listrik | Vendor Wuling  | 123456789 |
|  3 | 2024-10-15 | P003  |     10 | 25000.00 | Televisi       | Vendor Samsung | 12329735  |
+----+------------+-------+--------+----------+----------------+----------------+-----------+
3 rows in set (0.010 sec)

MariaDB [dbtokosib7]> SELECT Pesanan.id, Pesanan.tanggal, Pesanan.total, Pelanggan.nama AS nama_pelanggan,
    ->        Produk.nama AS nama_produk, Pesanan_Items.qty, Pesanan_Items.harga_jual
    -> FROM Pesanan
    -> JOIN Pelanggan ON Pesanan.kode_pelanggan = Pelanggan.kode
    -> JOIN Pesanan_Items ON Pesanan.id = Pesanan_Items.pesanan_id
    -> JOIN Produk ON Pesanan_Items.produk_id = Produk.id;
+----+------------+--------+----------------+----------------+------+------------+
| id | tanggal    | total  | nama_pelanggan | nama_produk    | qty  | harga_jual |
+----+------------+--------+----------------+----------------+------+------------+
|  1 | 2024-11-30 | 150.00 | Dimas          | Laptop         |    2 |   10000.00 |
|  1 | 2024-11-30 | 150.00 | Dimas          | Sepeda Listrik |    1 |   20000.00 |
|  2 | 2024-12-01 | 200.00 | Argya          | Sepeda Listrik |    2 |   25000.00 |
+----+------------+--------+----------------+----------------+------+------------+
3 rows in set (0.006 sec)