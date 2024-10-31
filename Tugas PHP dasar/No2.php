<?php
function sapaNama($nama, $waktu) {
    // Validasi input
    $waktuValid = ['pagi', 'siang', 'sore', 'malam'];
    
    // Cek jika nama kosong
    if (empty($nama)) {
        return "Nama tidak boleh kosong!";
    }
    
    // Cek jika waktu tidak valid
    if (!in_array(strtolower($waktu), $waktuValid)) {
        return "Waktu tidak valid! Gunakan: pagi, siang, sore, atau malam.";
    }
    
    // Buat sapaan berdasarkan waktu dengan pesan tambahan
    switch (strtolower($waktu)) {
        case 'pagi':
            return "Selamat pagi, $nama! Semoga harimu cerah dan penuh semangat di pagi yang indah ini.";
        case 'siang':
            return "Selamat siang, $nama! Jangan lupa istirahat dan makan siang.";
        case 'sore':
            return "Selamat sore, $nama! Waktunya untuk melepas penat dan jangan menjadi fans manchester united.";
        case 'malam':
            return "Selamat malam, $nama! Semoga mendapatkan tidur yang nyenyak dan bermimpi indah.";
    }
}

// Contoh penggunaan
echo sapaNama("Agus", "pagi");  
echo "\n";
echo sapaNama("Indra", "siang"); 
echo "\n";
echo sapaNama("Radipa", "sore");
echo "\n";
echo sapaNama("Putri", "malam");
?>