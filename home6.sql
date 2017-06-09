CREATE TABLE `DBA`.`history` 
( `id` SERIAL NOT NULL ,
`product_id` BIGINT UNSIGNED NOT NULL, 
`event` ENUM('create','changePrice','delete') NULL DEFAULT NULL , 
`oldPrice` INT NULL DEFAULT NULL , `currentPrice` INT NOT NULL , 
`timeAndDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
PRIMARY KEY (`id`)) ENGINE = InnoDB;

UPDATE `history`,products SET history.product_id=products.id WHERE history.id = products.id;

UPDATE `history`, products SET history.currentPrice = products.price, history.oldPrice=products.oldPrice, history.timeAndDate=products.bringing WHERE history.product_id=products.id

------------------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER `createProduct`
 AFTER INSERT ON `products` 
 FOR EACH ROW 
 BEGIN 
 INSERT INTO history
 (history.id, history.product_id, history.event, history.oldPrice, history.currentPrice,    history.timeAndDate) 
 VALUES(NULL, NEW.id, 'create', NEW.oldPrice, NEW.price, NOW());
  END;
$$
DELIMITER ;

--------------------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER `changeProduct` 
AFTER UPDATE ON `products` 
FOR EACH ROW 
BEGIN 
UPDATE history SET history.oldPrice = OLD.price, history.currentPrice = NEW.price, history.event = 2,history.timeAndDate = NOW()
WHERE history.product_id=NEW.id;

END;
$$
DELIMITER ;

----------------------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER `deleteProduct` 
AFTER DELETE ON `products` 
FOR EACH ROW 
BEGIN 
UPDATE history SET  history.event = 3, history.timeAndDate = NOW()
WHERE history.product_id=OLD.id;

END;
$$
DELIMITER ;
