MariaDB [msib_batch7]> SELECT nama,harga,stok FROM produk;
+---------------+---------+------+
| nama          | harga   | stok |
+---------------+---------+------+
| TV LCD 32inch | 3000000 |    5 |
+---------------+---------+------+
1 row in set (0.098 sec)

MariaDB [msib_batch7]> SELECT nama,harga,stok FROM produk WHERE stok < 40;
+----------------+---------+------+
| nama           | harga   | stok |
+----------------+---------+------+
| TV LCD 32inch  | 3000000 |    5 |
| Meja           | 1000000 |   20 |
| Kursi          |  500000 |   15 |
| laptop         | 1500000 |   21 |
| Kulkas 2 Pintu | 4500000 |   10 |
| Panci          |  200000 |   30 |
| Blender        |  500000 |   25 |
| Camera DSLR    | 7000000 |    3 |
| Drone          | 2500000 |    4 |
| Headphone      |  400000 |   15 |
| Smartwatch     | 1200000 |   10 |
| Tablet         | 2000000 |    7 |
+----------------+---------+------+
12 rows in set (0.076 sec)

MariaDB [msib_batch7]>  SELECT * FROM produk WHERE harga >= 1000000;
+----+--------+----------------+---------+------+---------+----------------+
| id | kode   | nama           | harga   | stok | idjenis | foto           |
+----+--------+----------------+---------+------+---------+----------------+
|  1 | KOD001 | TV LCD 32inch  | 3000000 |    5 |       1 | tv.jpg         |
|  3 | KOD002 | Meja           | 1000000 |   20 |       2 | meja.jpg       |
|  5 | KOD004 | laptop         | 1500000 |   21 |       4 | laptip.jpg     |
|  6 | KOD005 | Kulkas 2 Pintu | 4500000 |   10 |       1 | kulkas.jpg     |
|  9 | M001   | Camera DSLR    | 7000000 |    3 |       4 | camera.jpg     |
| 10 | M002   | Drone          | 2500000 |    4 |       4 | drone.jpg      |
| 12 | M004   | Smartwatch     | 1200000 |   10 |       3 | smartwatch.jpg |
| 13 | KOD012 | Tablet         | 2000000 |    7 |       4 | tablet.jpg     |
+----+--------+----------------+---------+------+---------+----------------+
8 rows in set (0.011 sec)

MariaDB [msib_batch7]> SELECT * FROM produk WHERE stok = 5;
+----+--------+---------------+---------+------+---------+--------+
| id | kode   | nama          | harga   | stok | idjenis | foto   |
+----+--------+---------------+---------+------+---------+--------+
|  1 | KOD001 | TV LCD 32inch | 3000000 |    5 |       1 | tv.jpg |
+----+--------+---------------+---------+------+---------+--------+
1 row in set (0.007 sec)

MariaDB [msib_batch7]> SELECT * FROM produk WHERE kode IN ('KOD001', 'M001');
+----+--------+---------------+---------+------+---------+------------+
| id | kode   | nama          | harga   | stok | idjenis | foto       |
+----+--------+---------------+---------+------+---------+------------+
|  1 | KOD001 | TV LCD 32inch | 3000000 |    5 |       1 | tv.jpg     |
|  9 | M001   | Camera DSLR   | 7000000 |    3 |       4 | camera.jpg |
+----+--------+---------------+---------+------+---------+------------+
2 rows in set (0.065 sec)

