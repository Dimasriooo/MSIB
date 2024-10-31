<?php
function sapaNama($nama = '', $waktu = '') {
    // Daftar waktu yang valid
    $waktuValid = ['pagi', 'siang', 'sore', 'malam'];
    
    // Jika nama kosong, gunakan "Tamu"
    if (empty($nama)) {
        $nama = "Tuan/Nyonya";
    }
    
    // Jika waktu kosong, gunakan sapaan umum
    if (empty($waktu)) {
        return "Halo, $nama! Selamat datang!";
    }
    
    // Normalisasi waktu (ubah ke huruf kecil)
    $waktu = strtolower($waktu);
    
    // Cek jika waktu tidak valid
    if (!in_array($waktu, $waktuValid)) {
        return "Waktu tidak valid! Gunakan: pagi, siang, sore, atau malam.";
    }
    
    // Buat sapaan berdasarkan waktu dengan pesan tambahan
    switch ($waktu) {
        case 'pagi':
            return "Selamat pagi, $nama! Semoga harimu cerah dan penuh semangat di pagi yang indah ini.";
        case 'siang':
            return "Selamat siang, $nama! Jangan lupa istirahat sejenak dan makan siang ya.";
        case 'sore':
            return "Selamat sore, $nama! Waktunya melepas penat dan bersiap menikmati senja.";
        case 'malam':
            return "Selamat malam, $nama! Semoga mendapatkan tidur yang nyenyak dan bermimpi indah.";
    }
}

// Contoh penggunaan
echo "(nama kosong):\n";
echo sapaNama('', 'pagi');
echo "\n\n";

echo "(waktu kosong):\n";
echo sapaNama('Yudi');
echo "\n\n";

echo "(nama dan waktu lengkap):\n";
echo sapaNama('Dimas', 'siang');
echo "\n\n";

echo "(nama dan waktu kosong):\n";
echo sapaNama();
?>