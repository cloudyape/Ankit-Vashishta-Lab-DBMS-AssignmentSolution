drop database if exists `e-commerce`;
CREATE database `e-commerce`;

CREATE TABLE `e-commerce`.`Supplier` ( `SUPP_ID` INT(255) NOT NULL AUTO_INCREMENT , `SUPP_NAME` VARCHAR(255) NOT NULL , `SUPP_CITY` VARCHAR(255) NOT NULL , `SUPP_PHONE` VARCHAR(255) NOT NULL , PRIMARY KEY (`SUPP_ID`));

CREATE TABLE `e-commerce`.`Customer` ( `CUS__ID` INT(255) NOT NULL AUTO_INCREMENT , `CUS_NAME` VARCHAR(255) NOT NULL , `CUS_PHONE` VARCHAR(255) NOT NULL , `CUS_CITY` VARCHAR(255) NOT NULL , `CUS_GENDER` VARCHAR(11) NOT NULL , PRIMARY KEY (`CUS__ID`));

CREATE TABLE `e-commerce`.`Category` ( `CAT_ID` INT(255) NOT NULL AUTO_INCREMENT , `CAT_NAME` VARCHAR(255) NOT NULL , PRIMARY KEY (`CAT_ID`));

CREATE TABLE `e-commerce`.`Product` ( `PRO_ID` INT(255) NOT NULL AUTO_INCREMENT , `PRO_NAME` VARCHAR(255) NOT NULL , `PRO_DESC` VARCHAR(255) NOT NULL , `CAT_ID` INT(255) NOT NULL , PRIMARY KEY (`PRO_ID`));

CREATE TABLE `e-commerce`.`Productdetails` ( `PROD_ID` INT(255) NOT NULL AUTO_INCREMENT , `PRO_ID` INT(255) NOT NULL , `SUPP_ID` INT(255) NOT NULL , `PRICE` INT(255) NOT NULL , PRIMARY KEY (`PROD_ID`));

CREATE TABLE `e-commerce`.`Order` ( `ORD_ID` INT(255) NOT NULL AUTO_INCREMENT , `ORD_AMOUNT` INT(255) NOT NULL , `ORD_DATE` DATE NOT NULL , `CUS_ID` INT(255) NOT NULL , `PROD_ID` INT(255) NOT NULL , PRIMARY KEY (`ORD_ID`));

CREATE TABLE `e-commerce`.`Rating` ( `RAT_ID` INT(255) NOT NULL AUTO_INCREMENT , `CUS_ID` INT(255) NOT NULL , `SUPP_ID` INT(255) NOT NULL , `RAT_RATSTARS` INT(255) NOT NULL , PRIMARY KEY (`RAT_ID`));



INSERT INTO `Supplier` (`SUPP_ID`, `SUPP_NAME`, `SUPP_CITY`, `SUPP_PHONE`) VALUES (NULL, 'Rajesh Retails', 'Delhi', '1234567890'), (NULL, 'Appario Ltd.', 'Mumbai', '2589631470'), (NULL, 'Knome products', 'Banglore', '9785462315'), (NULL, 'Bansal Retails', 'Kochi', '8975463285'), (NULL, 'Mittal Ltd.', 'Lucknow', '7898456532');

INSERT INTO `customer` (`CUS__ID`, `CUS_NAME`, `CUS_PHONE`, `CUS_CITY`, `CUS_GENDER`) VALUES (NULL, 'AAKASH', '9999999999', 'DELHI', 'M'), (NULL, 'AMAN', '9785463215', 'NOIDA', 'M'), (NULL, 'NEHA', '9999999999', 'MUMBAI', 'F'), (NULL, 'MEGHA', '9994562399', 'KOLKATA', 'F'), (NULL, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

INSERT INTO `category` (`CAT_ID`, `CAT_NAME`) VALUES (NULL, 'BOOKS'), (NULL, 'GAMES'), (NULL, 'GROCERIES'), (NULL, 'ELECTRONICS'), (NULL, 'CLOTHES');

INSERT INTO `product` (`PRO_ID`, `PRO_NAME`, `PRO_DESC`, `CAT_ID`) VALUES (NULL, 'GTA V', 'DFJDJFDJFDJFDJFJF', '2'), (NULL, 'TSHIRT', 'DFDFJDFJDKFD', '5'), (NULL, 'ROG LAPTOP', 'DFNTTNTNTERND', '4'), (NULL, 'OATS', 'REURENTBTOTH', '3'), (NULL, 'HARRY POTTER', 'NBEMCTHTJTH', '1');

INSERT INTO `productdetails` (`PROD_ID`, `PRO_ID`, `SUPP_ID`, `PRICE`) VALUES (NULL, '1', '2', '1500'), (NULL, '3', '5', '30000'), (NULL, '5', '1', '3000'), (NULL, '2', '3', '2500'), (NULL, '4', '1', '1000');

INSERT INTO `order` (`ORD_ID`, `ORD_AMOUNT`, `ORD_DATE`, `CUS_ID`, `PROD_ID`) VALUES ('20', '1500', '2021-10-12', '3', '5'), ('25', '30500', '2021-09-16', '5', '2'), ('26', '2000', '2021-10-95', '1', '1'), ('30', '3500', '2021-8-16', '4', '3'), ('50', '2000', '2021-10-06', '2', '1');

INSERT INTO `rating` (`RAT_ID`, `CUS_ID`, `SUPP_ID`, `RAT_RATSTARS`) VALUES ('1', '2', '2', '4'), ('2', '3', '4', '3'), ('3', '5', '1', '5'), ('4', '1', '3', '2'), ('5', '5', '5', '4');

SELECT count('CUS_GENDER') FROM customer c inner join  `order` o on c.CUS__ID = o.CUS_ID where o.ORD_AMOUNT > 3000 group by c.CUS_GENDER;

SELECT o.* , c.PRO_NAME FROM `product` c inner join  `order` o on c.PRO_ID = o.PROD_ID where o.CUS_ID = 2;

SELECT * from supplier where SUPP_ID in(SELECT productdetails.SUPP_ID from productdetails productdetails group by productdetails.SUPP_ID having count(productdetails.SUPP_ID) > 1);

SELECT CAT_NAME from category where CAT_ID = (SELECT products.CAT_ID from product products inner join `order` orders on products.PRO_ID = orders.PROD_ID where orders.ORD_AMOUNT = (SELECT min(ORD_AMOUNT) from `order`));

SELECT PRO_ID, PRO_NAME from product where PRO_ID in (SELECT PRO_ID from `order` where ORD_DATE > '2021-10-05');

SELECT CUS_NAME, CUS_GENDER from customer where CUS_NAME like '%A' or CUS_NAME like '%A';

CREATE PROCEDURE `ratingsProcedureForSuppliers` ()
BEGIN
SELECT supplier.supp_name, supplier.supp_id, rating.rat_ratstars,
case
when rating.rat_ratstars > 4 then 'Genuine Supplier'
when rating.rat_ratstars > 2 then 'Average Supplier'
else 'Supplier Should Not be COnsidered'
end as verdict from rating inner join supplier on supplier.supp_id = rating.supp_id

END