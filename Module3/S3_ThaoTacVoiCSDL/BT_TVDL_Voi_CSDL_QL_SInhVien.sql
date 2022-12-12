-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * 
FROM quanlysinhvien.Student
WHERE StudentName LIKE'H%'; 

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT * FROM quanlysinhvien.class
WHERE month(StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM quanlysinhvien.subject
WHERE Credit >= 3 AND Credit <=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE quanlysinhvien.student 
SET ClassId = 2 
WHERE StudentName ='Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT student.StudentName, subject.SubName, mark.Mark
FROM s student, sub subject, m mark 
ORDER BY mark DESC ,StudentName ASC;