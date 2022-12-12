USE QuanLySinhVien;
INSERT INTO Class
VALUES (1, 'A1', '2001-12-20', 1),
       (2, 'A2', '2008-12-21', 1),
	   (3, 'A3', current_date, 0);
INSERT INTO Student (StudentName, Address, Phone, `Status`, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
       ('Hoa', 'Hai Phong', '0912111113', 1, 1),
       ('Manh', 'HCM', '0922113113', 0, 2);
INSERT INTO `Subject`
VALUE (1, 'CF', 5, 1),
      (2, 'C', 6, 1),
      (3, 'HDJ', 5, 1),
      (4, 'RDBMS', 10, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUE (1,1,8,1),
      (1,2,10,2),
      (2,1,12,1);