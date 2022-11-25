-- СОздаем отель
INSERT INTO hostel (name, street, city, starts, description) VALUES ("Grand Hotel", "Prospekt 13", "Saratov", 4, "Отличный отель с видом на Макдональдс")
-- Добавляем в него апартаменты
INSERT INTO apartment (number, hostel_id, floor, type, size) VALUES (201, 1, 2, "eco", 1), (202, 1, 2, "eco", 2), (301, 1, 3, "king", 4)
-- Добавляем услуги
INSERT INTO service (hostel_id, name, price, description) VALUES (1, "Ночь эконом", 500, "Стандартная ночь без питания"), (1, "Ночь королевская", 5000, "Люксовый номер с питанием"), (1, "Массаж пяток", 1000, "")
-- Пользователь зарегестрировался
INSERT INTO person (id, name, surname, patronymic, birthday, phone, email, passport_number, passport_serial) VALUES (1, "Ivan", "Gazman", "Olegovich", '1996-12-12 00:00:00', 8005553535, "ivan@sgu.ru", 542312, 3213), (2, "Olga", "Gazmanova", "Otchestvo", '1937-08-01 00:00:00', 578173636, "olga@example.com", 213421, 2131)
-- Бронируем на два дня для двух человек
INSERT INTO booking (client_id, number, hostel_id, date, guest_id) VALUES (1, 201, 1, '2022-02-02 00:00:00', 1), (1, 201, 1, '2022-02-02 00:00:00', 2), (1, 201, 1, '2022-02-03', 1), (1, 201, 1, '2022-02-03 00:00:00', 2)
