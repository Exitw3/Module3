create database erd;
use erd;

create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

create table don_dat_hang(
so_dh int primary key,
ngay_dh date
);

create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50)
);

create table vat_tu(
ma_vt int primary key,
ten_vt varchar(50)
);

create table chi_tiet_phieu_xuat(
dg_xuat double,
sl_xuat int,
so_px int,
ma_vt int,
primary key(so_px, ma_vt),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vt) references vat_tu(ma_vt)
);

create table chi_tiet_phieu_nhap(
dg_nhap double,
sl_nhap int,
ma_vt int,
so_pn int,
primary key(ma_vt, so_pn),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_pn) references phieu_nhap(so_pn)
);

create table chi_tiet_don_dat_hang(
ma_vt int,
so_dh int,
so_luong int,
primary key(ma_vt, so_dh),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_dh) references don_dat_hang(so_dh)
);

create table cung_cap(
so_dh int,
ma_ncc int,
gia double,
primary key(so_dh, ma_ncc),
foreign key(so_dh) references don_dat_hang(so_dh),
foreign key(ma_ncc) references nha_cc(ma_ncc)
);