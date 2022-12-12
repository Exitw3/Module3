USE QuanLySinhVien;
SELECT *
FROM Student;
SELECT *
FROM Student
WHERE Status = true;
SELECT *
FROM Subject
WHERE Credit < 10;
SELECT S.StudenId, S.StudentName, C.StudenName
FROM Student S join Class C on S.ClassId = C.ClassId;
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';
SELECT Student.StudentId, Student.StudentName, Subject.SubName, Mark.Mark
FROM Student join Mark on Student.StudentId = Mark.StudentId join Subject on Mark.SubId = Subject.SubId;
SELECT Student.StudentId, Student.StudentName, Subject.SubName, Mark.Mark
FROM Student join Mark on Student.StudentId = Mark.StudentId join Subject on Mark.SubId = Subject.SubId
WHERE Subject.SubName = 'CF';
