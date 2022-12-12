USE QL_DETAI;

-- Q1. Cho biết họ tên và mức lương của các giáo viên nữ.
SELECT HOTEN, LUONG, PHAI
FROM GIAOVIEN
WHERE PHAI = 'NU';

-- Q2. Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%.
SELECT HOTEN, LUONG, (LUONG*1.1) AS 'LUONG_SAU_KHI_TANG'
FROM GIAOVIEN;

-- Q3. Cho biết mã của các giáo viên có họ tên bắt đầu là “Nguyễn” và lương trên $2000 hoặc, giáo viên là trưởng bộ môn nhận chức sau năm 1995.
SELECT DISTINCT G.MABM, G.HOTEN, G.LUONG
FROM GIAOVIEN G
JOIN BOMON B
ON (G.HOTEN LIKE 'Nguyễn%' AND G.LUONG > 2000) OR (B.TRUONGBM = G.MAGV AND year(NGAYNHANCHUC) > 1995);

-- Q4. Cho biết tên những giáo viên khoa Công nghệ thông tin.
SELECT G.HOTEN, G.MABM , B.MAKHOA
FROM GIAOVIEN G
JOIN BOMON B
ON (G.MABM = B.MABM)
WHERE MAKHOA = 'CNTT';

-- Q5. Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó.
SELECT *
FROM BOMON
WHERE BOMON.NGAYNHANCHUC IS NOT NULL;

-- Q6. Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc.
SELECT GV.HOTEN, GV.MABM, BM.TENBM
FROM GIAOVIEN GV
JOIN BOMON BM ON (GV.MABM = BM.MABM);

-- Q7. Cho biết tên đề tài và giáo viên chủ nhiệm đề tài.
SELECT DT.GVCNDT, DT.TENDT
FROM DETAI DT;

-- Q8. Với mỗi khoa cho biết thông tin trưởng khoa.
SELECT K.TENKHOA, GV.HOTEN
FROM KHOA K
JOIN GIAOVIEN GV ON K.TRUONGKHOA = GV.MAGV;

-- Q9. Cho biết các giáo viên của bộ môn “Vi sinh” có tham gia đề tài 006.
SELECT *
FROM GIAOVIEN GV
JOIN THAMGIADT TGDT ON GV.MAGV = TGDT.MAGV
WHERE GV.MABM = 'VS';

-- Q10. Với những đề tài thuộc cấp quản lý “Thành phố”, cho biết mã đề tài, đề tài thuộc về chủ đề nào, họ tên
-- người chủ nghiệm đề tài cùng với ngày sinh và địa chỉ của người ấy.

-- Q11. Tìm họ tên của từng giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên đó.
SELECT GV.HOTEN, GV.GVQLCM, (
SELECT GVF.HOTEN
FROM GIAOVIEN GVF
WHERE GVF.MAGV = GV.GVQLCM
) AS 'QUANLYCHUYENMON'
FROM GIAOVIEN GV
WHERE GV.GVQLCM IS NOT NULL;

-- Q12. Tìm họ tên của những giáo viên được “Nguyễn An Trung” phụ trách trực tiếp.
SELECT GV.HOTEN, GV.GVQLCM, (
SELECT GVF.HOTEN
FROM GIAOVIEN GVF
WHERE GVF.MAGV = GV.GVQLCM
) AS 'QUANLYCHUYENMON'
FROM GIAOVIEN GV
WHERE GV.GVQLCM = 
(
SELECT gv1.magv
FROM GIAOVIEN GV1
WHERE GV1.HOTEN = 'Nguyễn An Trung'
);

-- Q13. Cho biết tên giáo viên là trưởng bộ môn Hệ thống thông tin.
SELECT *
FROM BOMON BM JOIN GIAOVIEN GV ON BM.TRUONGBM = GV.MAGV
WHERE BM.MABM = 'HTTT';

-- Q14. Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề Quản lý giáo dục.
SELECT *
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV
WHERE DT.MACD =(
SELECT CD.MACD
FROM CHUDE CD
WHERE CD.TENCD = 'Quản Lý Giáo Dục'
);

-- Q15. Cho biết tên các công việc của đề tài HTTT quản lý các trường ĐH có thời gian bắt đầu trong tháng 3/2008.
SELECT D.TENDT, D.MADT, CV.TENCV, CV.NGAYBD
FROM DETAI D JOIN CONGVIEC CV ON D.MADT = CV.MADT
WHERE D.TENDT = 'HTTT quản lý các trường ĐH' AND DATE_FORMAT(CV.NGAYBD,'%Y-%m') = '2008-03';

-- Q16. Cho biết tên giáo viên và tên người quản lý chuyên môn của giáo viên đó.
SELECT GV.HOTEN, GV.GVQLCM, (
SELECT GVF.HOTEN
FROM GIAOVIEN GVF
WHERE GVF.MAGV = GV.GVQLCM
) AS 'QUANLYCHUYENMON'
FROM GIAOVIEN GV;

-- Q17. Cho các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007
SELECT *
FROM CONGVIEC
WHERE NGAYBD BETWEEN '2007-01-01' AND '2007-08-01';

-- Q18. Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
SELECT GV.HOTEN
FROM GIAOVIEN GV 
WHERE GV.MABM = 
(
SELECT GV1.MABM
FROM GIAOVIEN GV1
WHERE GV1.HOTEN = 'Trần Trà Hương'
);

-- Q19. Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.


-- Q20. Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV, BOMON BM, KHOA K
WHERE GV.MAGV = BM.TRUONGBM AND K.TRUONGKHOA;

-- Q21. Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV, BOMON BM, DETAI DT
WHERE GV.MAGV = BM.TRUONGBM AND DT.GVCNDT;

-- Q22. Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
SELECT DISTINCT K.TRUONGKHOA
FROM KHOA K JOIN DETAI DT ON K.TRUONGKHOA = DT.GVCNDT;

-- Q23. Cho biết mã số các giáo viên thuộc bộ môn HTTT hoặc có tham gia đề tài mã 001
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
WHERE GV.MABM = 'HTTT' OR TG.MADT = '001';

-- Q24. Cho biết giáo viên làm việc cùng bộ môn với giáo viên 002.
SELECT GV.HOTEN
FROM GIAOVIEN GV 
WHERE GV.MABM = 
(
SELECT GV1.MABM
FROM GIAOVIEN GV1
WHERE GV1.MAGV = '002'
);

-- Q26. Cho biết họ tên và mức lương của các giáo viên.
SELECT GV.HOTEN, GV.LUONG
FROM GIAOVIEN GV;

-- Q27. Cho biết số lượng giáo viên viên và tổng lương của họ.
SELECT  count(GV.HOTEN), SUM(GV.LUONG)
FROM GIAOVIEN GV;

-- Q28. Cho biết số lượng giáo viên và lương trung bình của từng bộ môn.
SELECT  count(GV.HOTEN), AVG(GV.LUONG)
FROM GIAOVIEN GV;

-- Q29. Cho biết tên chủ đề và số lượng đề tài thuộc về chủ đề đó.
SELECT DT.TENDT, DT.MACD, CD.TENCD
FROM DETAI DT JOIN CHUDE CD ON DT.MACD = CD.MACD;

-- Q30. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó tham gia.
SELECT GV.HOTEN, (COUNT(TG.MAGV)) AS 'SOLUONGTG' 
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV GROUP BY GV.HOTEN;

-- Q31. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiệm.
SELECT GV.HOTEN, (COUNT(DT.GVCNDT)) AS 'SOLUONGDT' 
FROM GIAOVIEN GV JOIN DETAI DT ON GV.MAGV = DT.GVCNDT GROUP BY GV.HOTEN;

-- Q32. Với mỗi giáo viên cho tên giáo viên và số người thân của giáo viên đó.
SELECT GV.HOTEN, count(NT.MAGV) AS 'SOLUONGNT'
FROM GIAOVIEN GV JOIN NGUOITHAN NT ON GV.MAGV = NT.MAGV GROUP BY GV.HOTEN;

-- Q33. Cho biết tên những giáo viên đã tham gia từ 3 đề tài trở lên.
SELECT GV.HOTEN 
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV GROUP BY GV.HOTEN
HAVING COUNT(TG.MAGV) >= 3;

-- Q34. Cho biết số lượng giáo viên đã tham gia vào đề tài Ứng dụng hóa học xanh
SELECT COUNT(GV.MAGV) AS 'SOLUONGTG'
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
WHERE TG.MADT = 
(
SELECT DT.MADT 
FROM DETAI DT 
WHERE DT.TENDT = 'Ứng dụng hóa học xanh'
);

-- Q35. Cho biết mức lương cao nhất của các giảng viên.
SELECT MAX(GV.LUONG) AS 'LUONGCAONHAT'
FROM GIAOVIEN GV;

-- Q36. Cho biết những giáo viên có lương lớn nhất.
SELECT GV.HOTEN 
FROM GIAOVIEN GV 
where GV.LUONG=
(
SELECT MAX(GV.LUONG) 
from GIAOVIEN GV
);

-- Q37. Cho biết lương cao nhất trong bộ môn “HTTT”.
SELECT MAX(GV.LUONG) AS 'LUONGCAONHAT HTTT'
FROM GIAOVIEN GV 
WHERE GV.MABM = "HTTT"; 

-- Q38. Cho biết tên giáo viên lớn tuổi nhất của bộ môn Hệ thống thông tin.
SELECT GV.HOTEN 
FROM GIAOVIEN GV 
WHERE YEAR(GV.NGSINH) =
(
SELECT MIN(YEAR(GV.NGSINH)) 
FROM GIAOVIEN GV 
WHERE GV.MABM = 'HTTT'); 

-- Q39. Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin.
SELECT GV.HOTEN 
FROM GIAOVIEN GV 
WHERE YEAR(GV.NGSINH) =
(
SELECT MAX(YEAR(GV.NGSINH)) 
FROM GIAOVIEN GV 
WHERE GV.MABM = 'HTTT'
); 

-- Q40. Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.
SELECT GV.HOTEN, GV.LUONG
FROM GIAOVIEN GV
WHERE GV.MAGV IN 
(
SELECT GVF.MAGV
FROM GIAOVIEN GVF JOIN KHOA K ON GVF.MAGV = K.TRUONGKHOA
WHERE GVF.LUONG = 
(
SELECT MAX(GVP.LUONG)
FROM GIAOVIEN GVP
)
);

-- Q41. Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ.
SELECT GV.HOTEN, GV.LUONG, BA.MABM 
FROM GIAOVIEN GV JOIN 
(
SELECT GVF.MABM, MAX(GVF.LUONG) AS LUONG 
FROM GIAOVIEN GVF GROUP BY GVF.MABM
) AS BA
ON GV.MABM = BA.MABM 
WHERE GV.LUONG = BA.LUONG;

-- Q42. Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.
SELECT DT.TENDT
FROM DETAI DT
WHERE DT.MADT NOT IN 
(
SELECT  TG.MADT
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
WHERE GV.HOTEN = 'Nguyễn Hoài An'
);

-- Q43. Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra tên đề tài, tên người chủ nhiệm đề tài.
SELECT distinct DT.TENDT, DT.GVCNDT, GV.HOTEN
FROM DETAI DT JOIN GIAOVIEN GV ON GV.MAGV = DT.GVCNDT
WHERE DT.MADT NOT IN 
(
SELECT distinct TG.MADT
FROM GIAOVIEN GV JOIN THAMGIADT TG ON GV.MAGV = TG.MAGV
WHERE GV.HOTEN = 'Nguyễn Hoài An'
);

-- Q44. Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.

-- Q45. Tìm những giáo viên không tham gia bất kỳ đề tài nào
SELECT GV.HOTEN , GV.MAGV
FROM GIAOVIEN GV
WHERE GV.MAGV NOT IN 
(
SELECT distinct GV.MAGV
FROM THAMGIADT TG JOIN GIAOVIEN GV ON GV.MAGV = TG.MAGV
);

-- Q46. Cho biết giáo viên có lương lớn hơn lương của giáo viên “Nguyễn Hoài An”
SELECT GV.HOTEN, GV.LUONG
FROM GIAOVIEN GV 
WHERE GV.LUONG > 
(
SELECT GV.LUONG
FROM GIAOVIEN GV 
WHERE GV.HOTEN = 'Nguyễn Hoài An' 
);

-- Q47. Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN (
SELECT distinct TG.MAGV, COUNT(TG.MADT) AS SLTG
FROM BOMON BM JOIN THAMGIADT TG ON BM.TRUONGBM = TG.MAGV GROUP BY TG.MAGV
HAVING SLTG >= 1
) BA ON GV.MAGV = BA.MAGV ;

-- Q48. Tìm giáo viên trùng tên và cùng giới tính với giáo viên khác trong cùng bộ môn

-- Q49. Tìm những giáo viên có lương lớn hơn lương của ít nhất một giáo viên bộ môn “Công nghệ tri thức”
SELECT GV.HOTEN, GV.LUONG , BM.TENBM
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM
WHERE BM.MABM = 
(
SELECT BM.MABM
FROM BOMON
W
);


