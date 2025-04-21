-- Ejercicio 1:
-- Crear la tabla "credit_card"
CREATE TABLE IF NOT EXISTS credit_card (
        id VARCHAR(20) PRIMARY KEY,
        iban VARCHAR (50),
        pan VARCHAR (20),
        pin VARCHAR (4),
        cvv INT,
        expiring_date VARCHAR(20)
    );

-- Se debe ejecutar el archivo "datos_introducir_credit"

-- Crear la clave foranea para conectar con tabla "transaction
ALTER TABLE transaction
ADD FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);

-- Ejercicio 2:
-- Comprobacion del dato a modificar
SELECT id, iban
FROM credit_card
WHERE id = 'CcU-2938';

-- Actualizacion del dato solicitado
UPDATE credit_card
SET iban = 'R323456312213576817699999'
WHERE id = 'CcU-2938';

-- Ejercicio 3:
-- Comprobacion de existencia en las tablas principales: 
SELECT *
FROM company
WHERE id = 'b-9999';

SELECT *
FROM credit_card
WHERE id = 'CcU-9999';

-- Al no existir deben agregarse los valores primero en el tablas donde estan como Primary Key
INSERT INTO credit_card (id) VALUES ('CcU-9999');
INSERT INTO company (id) VALUES ('b-9999');

-- Luego de insertar los ID en las tablas company y credit_card procedemos a insertar los valores en la tabla transaction:
INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined ) VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '9999', '829.999', '-117.999', '111.11', '0');

-- Comprobacion de que se hayan cargado correctamente
SELECT *
FROM transaction
WHERE id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';

-- Ejercicio 4:
-- Eliminacion de la columna "pan"
ALTER TABLE credit_card
DROP COLUMN pan;