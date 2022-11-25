-- Создание тригера на проверку правильной цены сервиса
DELIMITER //
CREATE TRIGGER check_price BEFORE UPDATE ON service FOR EACH ROW
BEGIN
	IF service.price < 0 OR service.price > 99999
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Wrong price";
    END IF;
END //
DELIMITER ;

-- Такой же только для обновления
DELIMITER //
CREATE TRIGGER check_price_update BEFORE UPDATE ON service FOR EACH ROW
BEGIN
	IF service.price < 0 OR service.price > 99999
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Wrong price";
    END IF;
END //
DELIMITER ;

-- Запрет на удаление пока человек не заплатил
DELIMITER //
CREATE TRIGGER check_paided BEFORE DELETE ON history FOR EACH ROW
BEGIN
	IF history.paid IS FALSE
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Not paided";
    END IF;
END //
DELIMITER ;