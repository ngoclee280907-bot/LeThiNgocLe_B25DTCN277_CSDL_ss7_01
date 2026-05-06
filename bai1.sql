-- Bản chất toán học của toán tử =
-- Trong SQL, toán tử = là một toán tử so sánh đơn trị (Scalar Operator). 
-- Về mặt logic toán học, nó yêu cầu sự tương quan 1-1.
-- Vế trái: Một giá trị đơn lẻ (cột price của từng dòng trong bảng chính).
-- Vế phải: Bắt buộc phải là một giá trị đơn lẻ (Single value).

-- Tại sao hệ thống lại "sập"?
-- Ngày hôm qua: Giảng viên Trần Văn A chỉ có 1 khóa học duy nhất. Câu lệnh SELECT price FROM 
-- Courses WHERE instructor_id = 5 trả về đúng 1 con số (ví dụ: 500.000). Phép so sánh price = 500000 hoàn toàn hợp lệ.

-- Hôm nay: Khi ông A thêm 2 khóa học mới với mức giá khác nhau, Subquery lúc này trả về một 
-- tập hợp (ví dụ: {500.000, 700.000, 1.000.000}).

-- Lúc này, SQL sẽ thực hiện phép toán: price = {500.000, 700.000, 1.000.000}.
-- Máy tính sẽ không hiểu bạn muốn so sánh với giá trị nào trong tập hợp đó, dẫn đến xung đột 
-- logic và trả về lỗi Runtime Error ngay lập tức.

-- dùng IN
USE SS7;
SELECT title, price
FROM Courses
WHERE price IN (
    SELECT price 
    FROM Courses 
    WHERE instructor_id = 5
);