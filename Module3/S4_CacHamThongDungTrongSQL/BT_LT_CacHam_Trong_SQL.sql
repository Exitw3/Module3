USE QuanLySInhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM subject
WHERE subject.CREDIT NOT IN 
(
SELECT MIN(subject.CREDIT)
FROM subject
);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT *
FROM MARK M JOIN Subject SUB ON SUB.SubID = M.SubID
WHERE M.MARK IN 
(
SELECT MAX(M.MARK)
FROM MARK M
);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT ST.STUDENTNAME, M.MARK
FROM STUDENT ST JOIN MARK M ON ST.StudentID = M.StudentID
ORDER BY M.MARK DESC
