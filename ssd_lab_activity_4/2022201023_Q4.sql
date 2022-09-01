USE `CUSTOMER_DB`;
DROP procedure IF EXISTS `q4`;

DELIMITER $$
USE `CUSTOMER_DB`$$
CREATE PROCEDURE `q4` ()
BEGIN
	
	DECLARE c_name varchar(100);
	DECLARE c_city varchar(100);
	DECLARE c_country varchar(100);
	DECLARE c_grade varchar(100);
	DECLARE loop_fin int default 0;
	DECLARE c1 CURSOR FOR 
	SELECT cust_name, cust_city, cust_country, grade FROM customer WHERE agent_code LIKE "A00%";
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET loop_fin=1;
	CREATE TABLE T1
	(
		name varchar(100),
		city varchar(100),
		country varchar(100),
		grade varchar(10)
	);
	OPEN c1;
	get_det: LOOP
		FETCH c1 INTO c_name, c_city, c_country, c_grade;	
		if loop_fin=1 then
			leave get_det;
		end if;
		INSERT INTO T1(name, city, country, grade) VALUES (c_name, c_city, c_country, c_grade);
	END LOOP get_det;
	SELECT * FROM T1;
	CLOSE c1 ;
    END;$$

DELIMITER ;