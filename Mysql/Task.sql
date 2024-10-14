/*membuat database vendor*/
MariaDB [msib_batch7]> CREATE TABLE vendor(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> nomor VARCHAR(50),
    -> nama VARCHAR(100),
    -> kode VARCHAR(50),
    -> alamat TEXT,
    -> kontak VARCHAR(50));
Query OK, 0 rows affected (0.126 sec)

/*gambaran database vendor melalui powershell*/
MariaDB [msib_batch7]> DESC vendor;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra
|
+--------+--------------+------+-----+---------+----------------+
| id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| nomor  | varchar(50)  | YES  |     | NULL    |
|
| nama   | varchar(100) | YES  |     | NULL    |
|
| kode   | varchar(50)  | YES  |     | NULL    |
|
| alamat | text         | YES  |     | NULL    |
|
| kontak | varchar(50)  | YES  |     | NULL    |
|
+--------+--------------+------+-----+---------+----------------+
6 rows in set (0.038 sec)

/*membuat database pembelian*/
MariaDB [msib_batch7]> CREATE TABLE pembelian(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> tanggal DATE,
    -> nomor VARCHAR(50),
    -> produk_id INT,
    -> jumlah INT,
    -> harga DECIMAL(10,2),
    -> vendor_id INT,
    -> FOREIGN KEY (vendor_id) REFERENCES vendor(id));
Query OK, 0 rows affected (0.051 sec)

/*gambaran database pembelian didalam powershell*/
MariaDB [msib_batch7]> DESC pembelian;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| id        | int(11)       | NO   | PRI | NULL    | auto_increment |
| tanggal   | date          | YES  |     | NULL    |
    |
| nomor     | varchar(50)   | YES  |     | NULL    |
    |
| produk_id | int(11)       | YES  |     | NULL    |
    |
| jumlah    | int(11)       | YES  |     | NULL    |
    |
| harga     | decimal(10,2) | YES  |     | NULL    |
    |
| vendor_id | int(11)       | YES  | MUL | NULL    |
    |
+-----------+---------------+------+-----+---------+----------------+
7 rows in set (0.020 sec)

/*memasukan isi dari database vendor*/
MariaDB [msib_batch7]> INSERT INTO vendor
    -> (nomor, nama,  kode, alamat, kontak) VALUES
    -> ('VN001', 'Vendor F', 'VNA001', 'Jl. Melati No. 10', '08123456723'),
    -> ('VN002', 'Vendor C', 'VNB001', 'Jl. Kutilang No. 11', '08198765443'),
    -> ('VN003', 'Vendor D', 'VNC001', 'Jl. Kucing No. 12', '08134567823'),
    -> ('VN004', 'Vendor A', 'VND001', 'Jl. Semangka No. 13', '081654323232'),
    -> ('VN005', 'Vendor J', 'VNE001', 'Jl. Jambu No. 14', '0811122234233');
Query OK, 5 rows affected (0.093 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [msib_batch7]> SELECT * FROM vendor;
+----+-------+----------+--------+---------------------+---------------+
| id | nomor | nama     | kode   | alamat              | kontak        |
+----+-------+----------+--------+---------------------+---------------+
|  1 | VN001 | Vendor F | VNA001 | Jl. Melati No. 10   | 08123456723   |
|  2 | VN002 | Vendor C | VNB001 | Jl. Kutilang No. 11 | 08198765443   |
|  3 | VN003 | Vendor D | VNC001 | Jl. Kucing No. 12   | 08134567823   |
|  4 | VN004 | Vendor A | VND001 | Jl. Semangka No. 13 | 081654323232  |
|  5 | VN005 | Vendor J | VNE001 | Jl. Jambu No. 14    | 0811122234233 |
+----+-------+----------+--------+---------------------+---------------+
5 rows in set (0.023 sec)

/*memasukan isi dari  database pembelian*/
MariaDB [msib_batch7]> INSERT INTO pembelian
    -> (tanggal, nomor, produk_id, jumlah, harga, vendor_id) VALUES
    -> ('2024-10-10', 'PB001', 101, 10, 50000.00, 1),
    -> ('2024-10-11', 'PB002', 102, 5, 85000.00, 2),
    -> ('2024-10-12', 'PB003', 103, 7, 30000.00, 3),
    -> ('2024-10-13', 'PB004', 104, 20, 200000.00, 4),
    -> ('2024-10-14', 'PB005', 105, 15, 4000000, 5);
Query OK, 5 rows affected (0.028 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [msib_batch7]> SELECT * FROM pembelian;
+----+------------+-------+-----------+--------+------------+-----------+
| id | tanggal    | nomor | produk_id | jumlah | harga      | vendor_id |
+----+------------+-------+-----------+--------+------------+-----------+
|  1 | 2024-10-10 | PB001 |       101 |     10 |   50000.00 |         1 |
|  2 | 2024-10-11 | PB002 |       102 |      5 |   85000.00 |         2 |
|  3 | 2024-10-12 | PB003 |       103 |      7 |   30000.00 |         3 |
|  4 | 2024-10-13 | PB004 |       104 |     20 |  200000.00 |         4 |
|  5 | 2024-10-14 | PB005 |       105 |     15 | 4000000.00 |         5 |
+----+------------+-------+-----------+--------+------------+-----------+
5 rows in set (0.001 sec)
