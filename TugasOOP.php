<?php

class Buku {
    protected $judul;
    protected $penulis;
    
    public function __construct($judul, $penulis) {
        $this->judul = $judul;
        $this->penulis = $penulis;
    }
    
    public function infoBuku() {
        return "Judul: " . $this->judul . ", Penulis: " . $this->penulis;
    }
}

class BukuDigital extends Buku {
    private $ukuranFile;
    
    public function __construct($judul, $penulis, $ukuranFile) {
        parent::__construct($judul, $penulis);
        $this->ukuranFile = $ukuranFile;
    }
    
    public function infoBuku() {
        return parent::infoBuku() . ", Ukuran File: " . $this->ukuranFile . " MB";
    }
}

// Contoh penggunaan
$bukuCetak = new Buku("Kecerdasan Emosional", "Daniel Goleman");
echo "Informasi Buku Cetak:\n";
echo $bukuCetak->infoBuku() . "\n\n";

$bukuDigital = new BukuDigital("Laut Bercerita", "Leila S. Chudori", 5.5);
echo "Informasi Buku Digital:\n";
echo $bukuDigital->infoBuku() . "\n";

?>