const hitungTotal = (nama, ...nilai) => {
    // Menggabungkan array nilai dengan array tambahan menggunakan spread operator
    const nilaiTambahan = [...nilai, 3, 7];

    // Menghitung total nilai dengan menggunakan metode reduce
    const total = nilaiTambahan.reduce((acc, curr) => acc + curr, 0);

    // Mencetak pesan ke console menggunakan template literals
    console.log(`Nama: ${nama}, Total Nilai: ${total}`);
};

// Contoh penggunaan fungsi
hitungTotal('Dimas Rio', 10, 20, 30);
hitungTotal('Madun', 40, 50, 60);
