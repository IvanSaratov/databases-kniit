-- Получить список пользователей и дни их бронимарования
SELECT DISTINCT b.date, p.name, p.surname FROM booking as b, person as p WHERE p.id = b.client_id;
-- Усложненый запрос с доп информацией о отеле
SELECT DISTINCT p.name, p.surname, h.name, a.number, b.date FROM booking as b, person as p, apartment as a, hostel as h WHERE p.id = b.client_id and b.hostel_id = a.hostel_id and b.number = a.number and a.hostel_id = h.id;
-- Получить паспортные данные всех Иванов с такого по такой промежуток
SELECT p.passport_number, p.passport_serial FROM booking as b JOIN person as p ON b.client_id = p.id WHERE b.date BETWEEN '2022-01-00' and '2022-03-00' and p.name LIKE "%ivan%";
-- Пример вывода Enum
SELECT a.number, CASE WHEN a.type = 'eco' THEN "Дешевый" WHEN a.type = 'king' THEN "Дорогой" ELSE "Неизвестный" END FROM apartment as a
-- Пример проверки на описание услуги\
SELECT s.name FROM service as s WHERE s.description IS NOT NULL
-- Работа со строками
SELECT UPPER(p.name), LOWER(p.surname), SUBSTRING(p.patronymic, 2, 5), REPLACE(p.name, "Ivan", "Andrey") FROM person as p;
-- Работа со временем
SELECT DAYNAME(b.date), ADDDATE(b.date, 5) FROM booking as b
-- Получить забронированные номера комнат
SELECT b.number FROM booking as b GROUP BY b.client_id