// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract KehadiranSiswa {

    DaftarSiswa[] public SemuaSiswa;
    uint public KehadiranId;

    struct DaftarSiswa {
        uint idKehadiran;
        address NIS;
        string NamaSiswa;
        string Kelas;
        bool Kehadiran;
        uint WaktuKehadiran;
    }

    function TambahSiswa(string memory _NamaSiswa, string memory _Kelas, bool _Kehadiran) public {
        uint waktuKehadiran = block.timestamp; // Simpan waktu kehadiran
        
        SemuaSiswa.push(DaftarSiswa(KehadiranId, msg.sender, _NamaSiswa, _Kelas, _Kehadiran, waktuKehadiran));
        KehadiranId++;
    }
}
