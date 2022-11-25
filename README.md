# Базы данных

Отчет по курсу базы данных на КНиИТе

![Схема базы](images/schema.png)

[Схема в SQL](schema.sql)


### Примеры заполнения базы данных

```
// СОздаем отель
INSERT INTO hostel (name, street, city, starts, description) VALUES ("Grand Hotel", "Prospekt 13", "Saratov", 4, "Отличный отель с видом на Макдональдс")

// Добавляем в него апартаменты
INSERT INTO apartment (number, hostel_id, floor, type, size) VALUES (201, 1, 2, "eco", 1), (202, 1, 2, "eco", 2), (301, 1, 3, "king", 4)
```