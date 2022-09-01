USE `CUSTOMER_DB`;
DROP procedure IF EXISTS `get_cust_details`;

DELIMITER $$
USE `CUSTOMER_DB`$$
CREATE PROCEDURE `get_cust_details` ()
BEGIN
	SELECT cust_name, grade FROM customer
    WHERE (customer.OPENING_AMT+ customer.RECEIVE_AMT)  > 10000;
END$$

DELIMITER ;