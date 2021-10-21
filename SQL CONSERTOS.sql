CREATE TABLE consertos (
maquina TINYINT NOT NULL,
mecanico VARCHAR(20) NOT NULL,
problema_solucionado varchar(100) NOT NULL,
data DATETIME NOT NULL,
cod_conserto INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (cod_conserto)
);

CREATE VIEW vwConsertos AS
SELECT a.*, b.conserto_vezes FROM consertos a INNER JOIN 
(SELECT *, COUNT(mecanico) AS conserto_vezes FROM consertos GROUP BY mecanico) b
ON a.mecanico = b.mecanico GROUP BY cod_conserto;

#----------------------------------------------

INSERT INTO consertos (
maquina, mecanico, problema_solucionado, data
) VALUES (
108, 'Diego', 'Fim de curso com defeito', CURRENT_TIMESTAMP()
);

SELECT * FROM vwConsertos;