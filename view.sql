-- Создание отчета о тех людях кто заселяется сегодня, но не оплатил ещё
CREATE VIEW booking_today_not_paid AS
SELECT p.name, p.surname FROM booking as b, person as p, history as h
WHERE b.client_id = p.id AND h.client_id = p.id AND h.paid IS false AND b.date >= CURDATE();