CREATE TABLE impressoras (
maquina TINYINT NOT NULL,
problema VARCHAR(100) NOT NULL,
data DATETIME NOT NULL,
cod_problema INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (cod_problema)
);

CREATE VIEW vwImpressoras AS 
SELECT a.*, b.defeito_vezes FROM impressoras a INNER JOIN
(SELECT *, COUNT(maquina) AS defeito_vezes FROM impressoras GROUP BY maquina) b
ON a.maquina = b.maquina GROUP BY cod_problema;

#----------------------------------------------

INSERT INTO impressoras(
maquina, problema, data
) VALUES (
108, 'Extrusão', CURRENT_TIMESTAMP()
);

SELECT * FROM vwImpressoras;