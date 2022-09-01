DROP procedure IF EXISTS `add_two_numbers`;

DELIMITER $$
CREATE PROCEDURE `add_two_numbers` (in a int, in b int, out c int)
BEGIN
 SELECT a+b into c;
END$$

DELIMITER ;