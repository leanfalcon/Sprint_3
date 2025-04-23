-- Ejercicio 1
SELECT * 
FROM transaction
WHERE ID = '02C6201E-D90A-1859-B4EE-88D2986D3B02';

-- Eliminar el registro
DELETE FROM transaction
WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02';

-- Ejercicio 2
-- Crear vista para Marketing                        
CREATE VIEW VistaMarketing AS
SELECT company_name, phone, country, AVG(amount) AS Media_compra
FROM company
JOIN transaction ON company.id = transaction.company_id
GROUP BY company_name, phone, country
ORDER BY Media_compra DESC;

SELECT * FROM transactions.vistamarketing;

-- Ejercicio 3
-- Vista de empresas de Alemania
SELECT * FROM transactions.vistamarketing
WHERE country = 'Germany';