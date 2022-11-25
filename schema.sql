CREATE TABLE apartment (
  number varchar(32) NOT NULL,
  hostel_id int(10) UNSIGNED NOT NULL,
  floor tinyint(4) NOT NULL DEFAULT 1,
  type enum('eco','business','king') DEFAULT 'eco',
  size tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE booking (
  client_id int(10) UNSIGNED NOT NULL,
  number varchar(32) NOT NULL,
  hostel_id int(10) UNSIGNED NOT NULL,
  date datetime NOT NULL,
  guest_id int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE history (
  date datetime NOT NULL,
  client_id int(10) UNSIGNED NOT NULL,
  guest_id int(10) UNSIGNED NOT NULL,
  service_id int(10) UNSIGNED NOT NULL,
  paid tinyint(1) NOT NULL DEFAULT 0,
  number varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE hostel (
  id int(10) UNSIGNED NOT NULL,
  name varchar(256) NOT NULL,
  street varchar(256) NOT NULL,
  city varchar(256) NOT NULL,
  starts tinyint(5) NOT NULL,
  description text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE person (
  id int(10) UNSIGNED NOT NULL,
  name varchar(256) NOT NULL,
  surname varchar(256) NOT NULL,
  patronymic varchar(256) DEFAULT NULL,
  birthday datetime NOT NULL,
  phone bigint(11) NOT NULL,
  email varchar(256) NOT NULL,
  passport_number int(11) NOT NULL,
  passport_serial int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE service (
  hostel_id int(10) UNSIGNED NOT NULL,
  name varchar(256) NOT NULL,
  price float NOT NULL DEFAULT 0,
  description text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `apartment`
  ADD PRIMARY KEY (`number`,`hostel_id`),
  ADD KEY `hostel_id` (`hostel_id`);

ALTER TABLE `booking`
  ADD PRIMARY KEY (`client_id`,`date`,`guest_id`,`number`),
  ADD KEY `booking_appartment_fk` (`number`,`hostel_id`),
  ADD KEY `guest_id` (`guest_id`);

ALTER TABLE `history`
  ADD PRIMARY KEY (`date`,`client_id`,`guest_id`,`service_id`,`number`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `number` (`number`);

ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `service`
  ADD PRIMARY KEY (`name`,`hostel_id`),
  ADD KEY `hostel_id` (`hostel_id`);

ALTER TABLE `hostel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `apartment`
  ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`);

ALTER TABLE `booking`
  ADD CONSTRAINT `booking_appartment_fk` FOREIGN KEY (`number`,`hostel_id`) REFERENCES `apartment` (`number`, `hostel_id`),
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `person` (`id`);

ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`number`) REFERENCES `apartment` (`number`);

ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`);
COMMIT;