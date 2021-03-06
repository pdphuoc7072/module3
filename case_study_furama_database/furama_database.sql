DROP DATABASE furama_database;

CREATE DATABASE furama_database;

USE furama_database;

CREATE TABLE vi_tri (
    id_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(45) NOT NULL
);

CREATE TABLE trinh_do (
    id_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(45) NOT NULL
);

CREATE TABLE bo_phan (
    id_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(45) NOT NULL
);

CREATE TABLE nhan_vien (
    id_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten_nhan_vien VARCHAR(255) NOT NULL,
    id_vi_tri INT NOT NULL,
    id_trinh_do INT NOT NULL,
    id_bo_phan INT NOT NULL,
    FOREIGN KEY (id_vi_tri)
        REFERENCES vi_tri (id_vi_tri) on update cascade on delete cascade,
    FOREIGN KEY (id_trinh_do)
        REFERENCES trinh_do (id_trinh_do) on update cascade on delete cascade,
    FOREIGN KEY (id_bo_phan)
        REFERENCES bo_phan (id_bo_phan) on update cascade on delete cascade,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong INT NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL
);

CREATE TABLE loai_khach (
    id_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(45) NOT NULL
);

CREATE TABLE khach_hang (
    id_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    id_loai_khach INT NOT NULL,
    FOREIGN KEY (id_loai_khach)
        REFERENCES loai_khach (id_loai_khach) on update cascade on delete cascade,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL
);

CREATE TABLE kieu_thue (
    id_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45) NOT NULL,
    gia INT NOT NULL
);

CREATE TABLE loai_dich_vu (
    id_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE dich_vu (
    id_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    so_tang INT NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    chi_phi_thue INT NOT NULL,
    id_kieu_thue INT NOT NULL,
    id_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (id_kieu_thue)
        REFERENCES kieu_thue (id_kieu_thue) on update cascade on delete cascade,
    FOREIGN KEY (id_loai_dich_vu)
        REFERENCES loai_dich_vu (id_loai_dich_vu) on update cascade on delete cascade,
    trang_thai VARCHAR(45) NOT NULL
);

CREATE TABLE hop_dong (
    id_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    id_nhan_vien INT NOT NULL,
    id_khach_hang INT NOT NULL,
    id_dich_vu INT NOT NULL,
    FOREIGN KEY (id_nhan_vien)
        REFERENCES nhan_vien (id_nhan_vien) on update cascade on delete cascade,
    FOREIGN KEY (id_khach_hang)
        REFERENCES khach_hang (id_khach_hang) on update cascade on delete cascade,
    FOREIGN KEY (id_dich_vu)
        REFERENCES dich_vu (id_dich_vu) on update cascade on delete cascade,
    ngay_lam_hop_dong DATE NOT NULL,
    ngay_ket_thuc DATE NOT NULL,
    tien_dat_coc INT NOT NULL,
    tong_tien INT
);

CREATE TABLE dich_vu_di_kem (
    id_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia INT NOT NULL,
    don_vi INT NOT NULL,
    trang_thai_kha_dung VARCHAR(45) NOT NULL
);

CREATE TABLE hop_dong_chi_tiet (
    id_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    id_hop_dong INT NOT NULL,
    id_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY (id_hop_dong)
        REFERENCES hop_dong (id_hop_dong) on update cascade on delete cascade,
    FOREIGN KEY (id_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (id_dich_vu_di_kem) on update cascade on delete cascade,
    so_luong INT NOT NULL
);

INSERT INTO vi_tri (ten_vi_tri)
VALUES
('L??? t??n'),
('Ph???c v???'),
('Chuy??n vi??n'),
('Gi??m s??t'),
('Qu???n l??'),
('Gi??m ?????c');

INSERT INTO trinh_do (ten_trinh_do)
VALUES
('Trung c???p'),
('Cao ?????ng'),
('?????i h???c'),
('Sau ?????i h???c');

INSERT INTO bo_phan (ten_bo_phan)
VALUES
('Sale - Marketing'),
('H??nh ch??nh'),
('Ph???c v???'),
('Qu???n l??');

INSERT INTO loai_khach (ten_loai_khach)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

INSERT INTO kieu_thue (ten_kieu_thue, gia)
VALUES
('N??m', 700000000),
('Th??ng', 80000000),
('Ng??y', 3500000),
('Gi???', 600000);

INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES
('Villa'),
('House'),
('Room');

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
('massage', 700000, 1, 'C??n ch???'),
('karaoke', 400000, 1, 'C??n ch???'),
('Th???c ??n', 300000, 1, 'C??n ch???'),
('N?????c u???ng', 100000, 1, 'C??n ch???'),
('Thu?? xe', 2000000, 1, 'C??n ch???');

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
('Gym', 600000, 1, 'C??n ch???');

INSERT INTO nhan_vien (ho_ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi)
VALUES
('Nguy???n Th??nh ?????t', 6, 4, 4, '1965-04-04', '201451309', 40000000, '0904135089', 'abcghyu123@gmail.com', 'H?? N???i'),
('????? Xu??n S??n', 5, 4, 4, '1970-12-10', '200356067', 30000000, '0905134023', 'uiop345@gmail.com', 'Tp. HCM'),
('B??i Th??? H???ng', 5, 3, 4, '1969-08-08', '200457145', 28000000, '0905078145', 'qrty678@gmail.com', '???? N???ng'),
('Tr???n Th??? ??nh', 4, 3, 1, '1975-01-01', '200567134', 20000000, '0905554178', 'fghjk009@gmail.com', '???? N???ng'),
('Nguy???n V??n Ho??ng', 4, 3, 1, '1976-06-06', '200457091', 19000000, '0905567001', 'dfhju87@gmail.com', 'Qu???ng Nam'),
('Phan Tu???n Ki???t', 3, 3, 1, '1980-03-16', '201367212', 15000000, '0905474595', 'dfrtyu1603@gmail.com', '???? N???ng'),
('V?? V??n Th?????ng', 3, 3, 1, '1985-05-26', '201458090', 14000000, '0905790012', 'gfhj5678@gmail.com', '???? N???ng'),
('Nguy???n Trung Ki??n', 2, 1, 3, '1995-05-01', '201450023', 7000000, '0905560018', 'ghkmnvb670@gmail.com', 'Hu???'),
('??o??n V??n H???u', 2, 1, 3, '1994-08-20', '201098110', 7500000, '0905865132', 'dfghkpo1678@gmail.com', 'Qu???ng Nam'),
('L?? Th??? V??n', 1, 2, 2, '1996-08-20', '201400389', 10000000, '0905578001', 'dbnlop12@gmail.com', '???? N???ng'),
('Nguy???n Th??? Tuy???t', 1, 2, 2, '2000-03-29', '201609134', 9000000, '0905589100', 'cvbop1508@gmail.com', '???? N???ng');

INSERT INTO nhan_vien (ho_ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi)
VALUES
('Phan V??n L??', 3, 4, 2, '1995-03-12', '201457009', 9000000, '0905100300', 'vbnmkhgfsd178@gmail.com', 'H???i Ch??u');

INSERT INTO khach_hang (id_loai_khach, ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, dia_chi)
VALUES
(1, 'Phan ?????i Ph?????c', '1990-07-27', '201784567', '0906514156', 'dfgh0908@gmail.com', '???? N???ng'),
(2, 'Nguy???n Ti???n D??ng', '1975-04-10', '201570309', '0905134008', 'fghloi1234@gmail.com', 'Qu???ng Tr???'),
(3, 'Ph???m Th??? L???', '1995-06-12', '202568003', '0903129658', 'dfgloip0054@gmail.com', '???? N???ng'),
(1, 'Nguy???n V??n Ki??n', '1992-06-28', '202003001', '0903225336', 'fgnbvm8712@gmail.com', 'Qu???ng Tr???'),
(1, 'Nguy???n Th??? ??nh', '1985-05-17', '201238740', '0905103608', 'sghjklo0756@gmail.com', 'Vinh'),
(4, 'L?? V??n Giang', '1950-01-17', '200358743', '0913456723', 'hgjlop1467@gmail.com', 'Tp HCM'),
(1, '??o??n V??n T??n', '1974-01-20', '200513678', '0913410238', 'acvbmop765@gmail.com', 'Vinh'),
(5, 'Tr????ng V??n C?????ng', '1980-03-20', '200800369', '0913578910', 'lopagh1678@gmail.com', 'Qu???ng Tr???'),
(4, 'Nguy???n Tr???ng Ngh??a', '1985-01-21', '203526978', '0936426879', 'abmklopte156@gmail.com', 'Qu???ng Ng??i'),
(1, 'Nguy???n Th??? Na', '1999-04-29', '203126897', '0923567896', 'hoankl8790@gmail.com', '???? N???ng'),
(3, '??o??n Th??? Vy', '1994-12-27', '205623897', '0904253687', 'sfvbh345@gmail.com', 'H?? N???i'),
(1, 'Nguy???n V??n Long', '1974-03-22', '203412539', '0978523146', 'vbnjad238@gmail.com', 'Qu??ng Ng??i'),
(4, 'Nguy???n Ti???n D??ng', '1970-02-20', '20100048', '0905789100', 'fghloidfg5678@gmail.com', 'Qu???ng Nam'),
(2, 'Nguy???n Th??? ??nh', '1980-12-17', '201741000', '0906413807', 'mnlop764365@gmail.com', 'Hu???');

INSERT INTO dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
('Thu?? Villa 1', 350, 3, 10, 4000000, 1, 1, 'C??n ph??ng'),
('Thu?? Villa 2', 360, 3, 10, 4200000, 2, 1, 'C??n ph??ng'),
('Thu?? Villa 3', 370, 3, 10, 4500000, 3, 1, 'C??n ph??ng'),
('Thu?? House 1', 250, 2, 6, 3500000, 1, 2, 'C??n ph??ng'),
('Thu?? House 2', 260, 2, 6, 3700000, 2, 2, 'C??n ph??ng'),
('Thu?? House 3', 270, 2, 6, 3900000, 3, 2, 'C??n ph??ng'),
('Thu?? Room 1', 150, 1, 4, 2200000, 1, 3, 'C??n ph??ng'),
('Thu?? Room 2', 150, 1, 4, 2400000, 2, 3, 'C??n ph??ng'),
('Thu?? Room 4', 150, 1, 4, 2600000, 3, 3, 'C??n ph??ng'),
('Thu?? Room 4', 150, 1, 4, 3000000, 4, 3, 'C??n ph??ng');

INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES
(4, 1, 2, '2019-10-05', '2019-11-04', 5000000),
(2, 4, 6, '2019-12-12', '2019-12-15', 6500000),
(5, 2, 4, '2019-04-10', '2019-05-09', 3800000),
(6, 7, 3, '2019-10-17', '2019-11-10', 7200000),
(3, 1, 5, '2018-12-01', '2018-12-31', 4000000),
(4, 4, 1, '2019-01-01', '2019-01-08', 3100000),
(8, 1, 5, '2018-10-01', '2018-10-31', 2500000),
(2, 5, 6, '2019-04-01', '2019-04-10', 5200000),
(4, 3, 1, '2019-05-01', '2019-05-10', 4500000),
(5, 4, 5, '2018-10-01', '2018-10-31', 3500000),
(6, 3, 2, '2018-12-07', '2018-12-17', 3700000),
(2, 8, 5, '2019-10-15', '2019-10-28', 4500000),
(9, 6, 1, '2019-03-15', '2019-03-27', 4000000),
(7, 7, 2, '2018-11-20', '2018-11-25', 4500000),
(6, 2, 3, '2019-11-01', '2019-11-09', 4800000),
(2, 5, 9, '2019-02-20', '2019-02-25', 4000000),
(4, 8, 8, '2018-11-06', '2018-11-09', 4500000),
(3, 7, 10, '2019-11-16', '2019-11-20', 4800000),
(5, 9, 7, '2018-12-01', '2018-12-09', 3800000),
(6, 6, 6, '2019-02-01', '2019-02-09', 4000000),
(7, 5, 8, '2019-01-01', '2019-01-07', 5000000);

INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES
(3, 11, 6, '2015-12-01', '2015-12-10', 4500000);

INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES
(12, 13, 6, '2019-12-12', '2019-12-15', 3000000),
(12, 14, 5, '2019-12-12', '2019-12-19', 4000000);

INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES
(4, 10, 6, '2016-12-01', '2016-12-10', 4500000);

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
(1, 1, 2),
(10, 5, 1),
(5, 3, 8),
(2, 2, 6),
(9, 3, 4),
(8, 4, 2),
(11, 1, 3),
(3, 1, 2),
(6, 2, 5),
(7, 5, 1),
(1, 2, 2),
(11, 3, 4),
(5, 3, 5),
(2, 1, 4),
(3, 4, 6),
(6, 1, 1),
(4, 5, 1),
(3, 5, 1),
(12, 5, 2),
(15, 4, 4),
(14, 1, 3),
(10, 2, 5),
(9, 2, 3),
(13, 2, 5),
(14, 5, 1),
(16, 3, 5),
(21, 5, 1),
(15, 2, 3),
(19, 4, 4),
(20, 1, 5),
(17, 3, 2),
(18, 2, 4),
(16, 2, 2),
(21, 2, 3),
(17, 2, 2),
(19, 2, 4);

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
(20, 6, 4);

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
(18, 2, 2),
(14, 2, 3);

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
(2, 2, 3);




