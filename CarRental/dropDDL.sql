ALTER TABLE RENTAL DROP FOREIGN KEY FK_RENTAL_CARTYPECODE_CARTYPECODE
ALTER TABLE CARMODEL DROP FOREIGN KEY FK_CARMODEL_CARTYPECODE_CARTYPECODE
ALTER TABLE ORDER DROP FOREIGN KEY FK_ORDER_CUSTOMERID_CUSTOMERID
ALTER TABLE ORDER DROP FOREIGN KEY FK_ORDER_MODELID_MODELID
DROP TABLE CARTYPE
DROP TABLE RENTAL
DROP TABLE CARFEATURE
DROP TABLE CARMODEL
DROP TABLE CUSTOMER
DROP TABLE ORDER
DELETE FROM SEQUENCE WHERE SEQ_NAME = 'SEQ_GEN'