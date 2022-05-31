CREATE DATABASE exercicio_sql;

USE exercicio_sql;

CREATE TABLE venda 

(
  id_nf int unsigned not null,
  id_item int unsigned not null,
  cod_prod int unsigned not null,
  valor_unit double unsigned not null,
  quantidade int unsigned not null,	
  desconto int unsigned default null
);

select * from venda;


INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (1, 1, 1,25.00, 10, 5);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (1, 2, 2, 13.50, 3);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (1, 3, 3, 15.00, 2);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (1, 4, 4, 10.00, 1);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (1, 5, 5, 30.00, 1);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (2, 1, 3, 15.00, 4);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (2, 2, 4, 10.00, 5);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (2, 3, 5, 30.00, 7);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (3, 1, 1, 25.00, 5);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (3, 2, 4, 10.00, 4);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (3, 3, 5, 30.00, 5);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (3, 4, 2, 13.50, 7);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (4, 1, 5, 30.00, 10, 15);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (4, 2, 4, 10.00, 12, 5);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (4, 3, 1, 25.00, 13, 5);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (4, 4, 2, 13.50, 15, 15);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (5, 1, 3, 15.00, 3);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade ) VALUES (5, 2, 5, 30.00, 6);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (6, 1, 1, 25.00, 22, 15);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (6, 2, 3, 15.00, 25, 20);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (7, 1, 1, 25.00, 10, 3);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (7, 2, 2, 13.50, 10, 4);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (7, 3, 3, 15.00, 10, 4);
INSERT INTO venda (id_nf,id_item, cod_prod, valor_unit, quantidade, desconto ) VALUES (7, 4, 5, 30.00, 10, 1);


SELECT id_nf, id_item, cod_prod, valor_unit FROM venda WHERE desconto is null ;


SELECT id_nf, id_item, cod_prod, valor_unit,
ROUND(valor_unit - (valor_unit*desconto/100),2) AS valor_vendido FROM venda
WHERE desconto is not null;

UPDATE venda SET desconto = 0 WHERE desconto IS NULL; /* NÃO RODOU*/

SELECT id_nf, id_item, cod_prod, valor_unit,
(quantidade*valor_unit) AS valor_total, valor_unit-(valor_unit*(desconto/100)) 
AS valor_vendido
FROM venda
WHERE desconto is not null;

SELECT id_nf, SUM(quantidade*valor_unit) AS valor_total
FROM venda
GROUP BY id_nf
ORDER BY valor_total desc;

SELECT id_nf, valor_unit - (valor_unit*(desconto/100)) as valor_vendido
from venda
WHERE desconto is not null
group by id_nf
order by valor_vendido desc;

SELECT
cod_prod, sum(quantidade) as quantidade
from venda
group by cod_prod
order by quantidade desc;

SELECT
id_nf,
cod_prod,
quantidade
FROM venda
WHERE quantidade >10
ORDER BY id_nf, cod_prod;


SELECT id_nf ,
SUM(quantidade * valor_unit) as QUANTIDADE
from venda
GROUP by id_nf
having QUANTIDADE > 500
order by QUANTIDADE desc;

SELECT cod_prod,
AVG(desconto) as media
from venda
GROUP BY cod_prod;

SELECT cod_prod,
max(desconto) as MAIOR,
min(desconto) as MENOR,
avg(desconto) as MEDIA
FROM venda
GROUP BY cod_prod;

SELECT
id_nf,
COUNT(quantidade) as QUANTIDADE
FROM venda
GROUP BY id_nf
having quantidade>3;





