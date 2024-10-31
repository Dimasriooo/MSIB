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
    
    // Buat sapaan berdasarkan waktu
    switch (strtolower($waktu)) {
        case 'pagi':
            return "Selamat pagi, $nama!";
        case 'siang':
            return "Selamat siang, $nama!";
        case 'sore':
            return "Selamat sore, $nama!";
        case 'malam':
            return "Selamat malam, $nama!";
    }
}
// penggunaan
echo sapaNama("Dimas", "pagi"); 
echo "\n";
echo sapaNama("Hartanto", "malam"); 
?>