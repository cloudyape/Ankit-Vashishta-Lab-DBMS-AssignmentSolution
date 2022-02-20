drop database if exists `e-commerce`;
CREATE database `e-commerce`;

CREATE TABLE `e-commerce`.`Supplier` ( `SUPP_ID` INT(255) NOT NULL AUTO_INCREMENT , `SUPP_NAME` VARCHAR(255) NOT NULL , `SUPP_CITY` VARCHAR(255) NOT NULL , `SUPP_PHONE` VARCHAR(255) NOT NULL , PRIMARY KEY (`SUPP_ID`));

CREATE TABLE `e-commerce`.`Customer` ( `CUS__ID` INT(255) NOT NULL AUTO_INCREMENT , `CUS_NAME` VARCHAR(255) NOT NULL , `CUS_PHONE` VARCHAR(255) NOT NULL , `CUS_CITY` VARCHAR(255) NOT NULL , `CUS_GENDER` VARCHAR(11) NOT NULL , PRIMARY KEY (`CUS__ID`));

CREATE TABLE `e-commerce`.`Category` ( `CAT_ID` INT(255) NOT NULL AUTO_INCREMENT , `CAT_NAME` VARCHAR(255) NOT NULL , PRIMARY KEY (`CAT_ID`));

CREATE TABLE `e-commerce`.`Product` ( `PRO_ID` INT(255) NOT NULL AUTO_INCREMENT , `PRO_NAME` VARCHAR(255) NOT NULL , `PRO_DESC` VARCHAR(255) NOT NULL , `CAT_ID` INT(255) NOT NULL , PRIMARY KEY (`PRO_ID`));

CREATE TABLE `e-commerce`.`Productdetails` ( `PROD_ID` INT(255) NOT NULL AUTO_INCREMENT , `PRO_ID` INT(255) NOT NULL , `SUPP_ID` INT(255) NOT NULL , `PRICE` INT(255) NOT NULL , PRIMARY KEY (`PROD_ID`));

CREATE TABLE `e-commerce`.`Order` ( `ORD_ID` INT(255) NOT NULL AUTO_INCREMENT , `ORD_AMOUNT` INT(255) NOT NULL , `ORD_DATE` INT(255) NOT NULL , `CUS_ID` INT(255) NOT NULL , `PROD_ID` INT(255) NOT NULL , PRIMARY KEY (`ORD_ID`));

CREATE TABLE `e-commerce`.`Rating` ( `RAT_ID` INT(255) NOT NULL AUTO_INCREMENT , `CUS_ID` INT(255) NOT NULL , `SUPP_ID` INT(255) NOT NULL , `RAT_RATSTARS` INT(255) NOT NULL , PRIMARY KEY (`RAT_ID`));



INSERT INTO `Supplier` (`SUPP_ID`, `SUPP_NAME`, `SUPP_CITY`, `SUPP_PHONE`) VALUES (NULL, 'Rajesh Retails', 'Delhi', '1234567890'), (NULL, 'Appario Ltd.', 'Mumbai', '2589631470'), (NULL, 'Knome products', 'Banglore', '9785462315'), (NULL, 'Bansal Retails', 'Kochi', '8975463285'), (NULL, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO `customer` (`CUS__ID`, `CUS_NAME`, `CUS_PHONE`, `CUS_CITY`, `CUS_GENDER`) VALUES (NULL, 'AAKASH', '9999999999', 'DELHI', 'M'), (NULL, 'AMAN', '9785463215', 'NOIDA', 'M'), (NULL, 'NEHA', '9999999999', 'MUMBAI', 'F'), (NULL, 'MEGHA', '9994562399', 'KOLKATA', 'F'), (NULL, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

INSERT INTO `category` (`CAT_ID`, `CAT_NAME`) VALUES (NULL, 'BOOKS'), (NULL, 'GAMES'), (NULL, 'GROCERIES'), (NULL, 'ELECTRONICS'), (NULL, 'CLOTHES');