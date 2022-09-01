USE `CUSTOMER_DB`;
DROP procedure IF EXISTS `get_working_area`;

DELIMITER $$
USE `CUSTOMER_DB`$$
CREATE PROCEDURE `get_working_area` (in city varchar(100))
BEGIN
SELECT cust_name FROM customer
WHERE customer.working_area = city;
END$$

DELIMITER ;