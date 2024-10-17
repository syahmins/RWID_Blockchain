// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract PasarBuku {

    struct Buku {
        uint id;
        string namaBuku;
        uint hargaBuku;     // uint dipakai untuk menyimpan angka positif.
        address pemilikBuku;    // address dipakai untuk menyimpan alamat wallet.
    }

    Buku[] public semuaBuku;       // definisikan storage.
    uint public bookId;		// dipakai untuk auto increment idBuku

    // untuk penyimpanan dalam bentuk string, harus ditambahkan "memory" sebagai lokasi penyimpanannya.
    function tambahBuku(string memory _namaBuku, uint _hargaBuku) public {
        semuaBuku.push(Buku(bookId, _namaBuku, _hargaBuku, msg.sender));
        bookId++;
    }


    function membeliBuku(uint _id) public payable {
        Buku storage buku = semuaBuku[_id];
        require(buku.hargaBuku <= msg.value, "Silakan bayar yang sesuai")
        buku.pemilikBuku = msg.sender;
    }

}
