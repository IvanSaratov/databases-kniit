-- Пример процедуры на подсчет месячной выручки с текущего дня, для отдельных клиентов
DELIMITER //
CREATE PROCEDURE GetAmount()
BEGIN
   SELECT p.name, p.surname, SUM(s.price) FROM history as h, service as s, person as p WHERE p.id = h.client_id AND s.id = h.service_id AND h.date BETWEEN NOW() AND DATE_ADD(NOW(),INTERVAL -1 MONTH) AND h.paid IS true GROUP BY h.client_id
END; //
DELIMITER ;