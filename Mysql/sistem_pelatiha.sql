-- Tabel Peserta
CREATE TABLE peserta (
    nip VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    satuan_kerja VARCHAR(100)
);

-- Tabel Narasumber
CREATE TABLE narasumber (
    id_narasumber INT PRIMARY KEY AUTO_INCREMENT,
    nama_narasumber VARCHAR(100)
);

-- Tabel Materi
CREATE TABLE materi (
    id_materi INT PRIMARY KEY AUTO_INCREMENT,
    nama_materi VARCHAR(100),
    id_narasumber INT,
    FOREIGN KEY (id_narasumber) REFERENCES narasumber(id_narasumber)
);

-- Tabel Pelatihan
CREATE TABLE pelatihan (
    id_pelatihan INT PRIMARY KEY AUTO_INCREMENT,
    pelatihan VARCHAR(100),
    id_materi INT,
    tanggal DATE,
    FOREIGN KEY (id_materi) REFERENCES materi(id_materi)
);

-- Tabel Pendaftaran
CREATE TABLE pendaftaran (
    id_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    nip VARCHAR(10),
    id_pelatihan INT,
    status ENUM('Diterima', 'Ditolak'),
    FOREIGN KEY (nip) REFERENCES peserta(nip),
    FOREIGN KEY (id_pelatihan) REFERENCES pelatihan(id_pelatihan)
);

-- Tabel Presensi
CREATE TABLE presensi (
    id_presensi INT PRIMARY KEY AUTO_INCREMENT,
    id_pendaftaran INT,
    kehadiran ENUM('Hadir', 'Tidak Hadir'),
    FOREIGN KEY (id_pendaftaran) REFERENCES pendaftaran(id_pendaftaran)
);l
