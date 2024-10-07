// let container = document.querySelector(".container");
// let gambar = document.getElementById("gambar");


// container.onclick = function(){
//     if(container.classList.container("background-color")){
//         //jika background berwarna maka nantinya muncul gambar
//         container.classList.remove("background-color");
//         gambar.style.display = "block";
//     } else {
//         container.classList.add("background-color");
//         gambar.style.display = "none";
//     }
// };

// function tambahgambar(){
//     if(!gambar){
//         gambar = document.createElement("img");
//         gambar.id = "Gambar";
//         gambar.src = "/img/ptr junior.jpeg";
//         gambar.alt = "Gambar Default";
//         container.appendChild(gambar);
//     }
// };

// Ambil elemen container
let container = document.querySelector(".container");
// Ambil elemen gambar
let gambar = document.getElementById("gambar");

if (!container) {
    console.error("Elemen container tidak ditemukan.");
} else {
    // Fungsi yang dijalankan ketika container diklik
    container.onclick = function() {
        // Cek apakah container memiliki kelas "background-color"
        if (container.classList.contains("background-color")) {
            // Jika background-color ada, hapus kelas dan tampilkan gambar
            container.classList.remove("background-color");
            gambar.style.display = "block";
        } else {
            // Jika tidak ada, tambahkan kelas dan sembunyikan gambar
            container.classList.add("background-color");
            gambar.style.display = "none";
        }
    };
}

// Fungsi untuk menambahkan gambar jika belum ada
function tambahgambar() {
    // Periksa apakah container dan gambar ada
    // if (!container) {
    //     console.error("Elemen container tidak ditemukan.");
    //     return;
    // }

    if (!gambar) {
        gambar = document.createElement("img");
        gambar.id = "gambar"; // Pastikan ID konsisten
        gambar.src = "./img/ptrjunior.jpeg";
        gambar.alt = "Gambar Default";
        container.appendChild(gambar);
    }
}
