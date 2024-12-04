CREATE TABLE Pelanggan (
    id_pelanggan INT IDENTITY PRIMARY KEY ,
    nama VARCHAR(100),
    nomor_telepon VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100),
    alamat TEXT
);

CREATE TABLE Pegawai (
    id_pegawai INT IDENTITY PRIMARY KEY ,
    nama VARCHAR(100),
    nomor_telepon VARCHAR(20),
    email VARCHAR(100),
    posisi VARCHAR(50)
	gaji DECIMAL(10,2), 
    tanggal_mulai_kerja DATE
); 

CREATE TABLE Layanan (
    id_layanan INT IDENTITY PRIMARY KEY ,
    nama_layanan VARCHAR(100),
    deskripsi TEXT,
    durasi INT,
    harga DECIMAL(10, 2)
);

CREATE TABLE Jadwal (
    id_jadwal INT IDENTITY PRIMARY KEY ,
    id_pegawai INT,
    hari VARCHAR(10), 
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (id_pegawai) REFERENCES Pegawai(id_pegawai) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE JanjiTemu (
    id_janji_temu INT IDENTITY PRIMARY KEY ,
    id_pelanggan INT,
    id_pegawai INT,
    id_layanan INT,
    tanggal DATE,
    jam TIME,
    status VARCHAR(20) DEFAULT 'Dijadwalkan',
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_pegawai) REFERENCES Pegawai(id_pegawai) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_layanan) REFERENCES Layanan(id_layanan) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Pembayaran (
    id_pembayaran INT IDENTITY PRIMARY KEY,
    id_janji_temu INT,
    tanggal_pembayaran DATE,
    jumlah DECIMAL(10, 0),
    metode_pembayaran VARCHAR(50)
	status_pembayaran VARCHAR(50), 
    FOREIGN KEY (id_janji_temu) REFERENCES JanjiTemu(id_janji_temu) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Ulasan (
    id_ulasan INT IDENTITY PRIMARY KEY ,
    id_janji_temu INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    komentar TEXT,
    FOREIGN KEY (id_janji_temu) REFERENCES JanjiTemu(id_janji_temu) ON UPDATE CASCADE ON DELETE CASCADE
);