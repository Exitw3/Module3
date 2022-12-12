-- Ví dụ 1: Cho biết họ tên và lương của tất cả các giáo viên.
SELECT HOTEN, LUONG
FROM GIAOVIEN;

-- Ví dụ 2: Cho biết danh sách các giáo viên trong trường
SELECT *
FROM GIAOVIEN;

-- Ví dụ 3: Cho biết họ tên, lương của tất cả các giáo viên.
SELECT HOTEN AS 'HOTEN_GIAOVIEN', LUONG AS 'LUONG_GIAOVIEN'
FROM GIAOVIEN;

-- Ví dụ 4: Cho biết danh sách các giáo viên (họ tên, phái, lương) sắp xếp giảm dần theo lương
SELECT HOTEN, PHAI, LUONG
FROM GIAOVIEN
ORDER BY LUONG  DESC;

-- Ví dụ 5: Cho biết họ tên, mã bộ môn và lương của giáo viên. Sắp xếp tăng dần theo mã bộ môn và giảm dần theo lương.
SELECT HOTEN, MABM, LUONG
FROM GIAOVIEN
ORDER BY LUONG ASC;

-- Ví dụ 6: Cho biết các giáo viên có lương lớn hơn 2000
SELECT *
FROM GIAOVIEN
WHERE LUONG > 2000;

-- Ví dụ 7: Cho biết các giáo viên có phái là Nam
SELECT *
FROM GIAOVIEN
WHERE PHAI = 'NAM';

-- Ví dụ 8: Cho biết các giáo viên của bộ môn HTTT mà có lương lớn hơn 1500
SELECT *
FROM GIAOVIEN
WHERE LUONG >= 1500 AND MABM = 'HTTT';

-- Ví dụ 9: Cho biết các giáo viên nhân viên không thuộc bộ môn HTTT và không có lương lớn hơn 2000
SELECT *
FROM GIAOVIEN
WHERE (LUONG < 2000) AND (MABM != 'HTTT');

-- Ví dụ 10: Cho biết các giáo viên sinh trong khoảng năm 1955 đến 1960
SELECT *
FROM GIAOVIEN
WHERE year(NGSINH) BETWEEN 1955 AND 1960;