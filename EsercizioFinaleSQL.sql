/*TASK 4*/

/* 1 Verificare che i campi definiti come PK siano univoci. In altre parole, scrivi una query 
per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).*/

-- PK tabella Category
SELECT CategoryKey , count(*)
FROM category
GROUP BY CategoryKey
HAVING count(*)>1 ;

-- PK tabella Country
SELECT CountryKey , count(*)
FROM country
GROUP BY CountryKey
HAVING count(*)>1 ;

-- tabella Product
SELECT ProductKey , count(*)
FROM Product
GROUP BY ProductKey
HAVING count(*)>1 ; 

-- PK tabella Region
SELECT RegionKey , count(*)
FROM Region
GROUP BY RegionKey
HAVING count(*)>1 ; 

-- PK tabella Sales
SELECT SalesOrderNumber, SalesOrderLineNumber, COUNT(*) AS count
FROM Sales
GROUP BY SalesOrderNumber, SalesOrderLineNumber
HAVING COUNT(*) > 1;


/*2  Esporre l’elenco delle transazioni indicando nel result set il codice documento, 
la data, il nome del prodotto, la categoria del prodotto, il nome dello stato, il nome della regione 
di vendita e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni 
dalla data vendita o meno (>180 -> True, <= 180 -> False) */
SELECT 
    s.SalesOrderNumber,
    s.SalesOrderLineNumber,
    s.Date_transaction,
    p.ProductName,  
    cat.CategoryName,
    c.countryName,  
    r.RegionName,   
   CASE 
        WHEN DATEDIFF(CURDATE(),  s.Date_transaction) > 180 THEN 'TRUE'
        ELSE 'FALSE'
    END AS OlderThan180Days
FROM 
	Category cat
JOIN 
    Product p ON cat.CategoryKey = p.CategoryKey
JOIN
   sales s  ON s.ProductKey = p.ProductKey 
JOIN
    Country c ON s.CountryKey = c.CountryKey   
JOIN 
    Region r ON c.RegionKey = r.RegionKey;
    
/*3 Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite 
realizzate nell’ultimo anno censito. (ogni valore della condizione deve risultare da una query e non deve essere 
inserito a mano). Nel result set devono comparire solo il codice prodotto e il totale venduto. */
SELECT 
	s.ProductKey,
    YEAR(s.date_transaction) AS 'Year',
    SUM(s.quantity) AS Sum_Quantity
FROM 
	sales s
WHERE 
    YEAR(s.Date_transaction) = (SELECT YEAR(MAX(s2.Date_transaction)) 
								FROM sales AS s2)
GROUP BY 
	s.ProductKey, YEAR(s.date_transaction)
HAVING 
	Sum_Quantity > (SELECT AVG(s3.Quantity)
				FROM sales AS s3); 


/*4 esporre l'elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno*/
SELECT 
	p.ProductName,
	YEAR(s.Date_transaction) AS 'Year',
    SUM(s.TotalAmount) AS Total_Sales
FROM 
	sales s
JOIN 
	product p ON s.ProductKey=p.ProductKey
GROUP BY YEAR(s.Date_transaction), p.ProductName
ORDER BY YEAR(s.Date_transaction);


/*5 Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente. */
SELECT 
    c.CountryName,
    YEAR(s.date_transaction) AS Year_sale, 
    SUM(s.TotalAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    country c ON s.CountryKey = c.CountryKey  
GROUP BY 
   c.CountryName, YEAR(s.date_transaction)
ORDER BY 
     YEAR(s.date_transaction), TotalSales DESC; 

/*6 Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato? */
SELECT 
	c.categoryname,
    SUM(s.Quantity) AS TotalQuantity 
FROM 
    Sales s
JOIN 
    Product p ON s.ProductKey = p.ProductKey
JOIN 
    Category c ON p.CategoryKey = c.CategoryKey
GROUP BY 
    c.Categoryname  
ORDER BY 
    TotalQuantity DESC  
LIMIT 1;

-- Query alternativa per risolvere il punto 6. Ho trovato necessario creare questo secondo metodo 
-- perchè il LIMIT 1 potrebbe condurre ad un risultato sbagliato nell'ipotesi in cui 
-- ci sono due categoria con le stesse quantità vendute
SELECT 
	c.CategoryName,
	SUM(s.Quantity) AS TotalQuantity
FROM 
	sales s
JOIN
	product p ON s.ProductKey=p.ProductKey
JOIN 
	category c ON p.CategoryKey=c.CategoryKey
GROUP BY c.CategoryName
HAVING TotalQuantity =(SELECT MAX(qm.sum_quantity)
				FROM (SELECT c.CategoryKey, SUM(s.Quantity) AS Sum_quantity
						FROM sales s 
                        JOIN product p ON s.ProductKey=p.ProductKey
                        JOIN category c ON p.CategoryKey=c.CategoryKey
                        GROUP BY c.CategoryKey) AS qm)
ORDER BY c.CategoryName;


/*7 Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti. */
-- primo approccio con subquery
SELECT 
    p.ProductKey,
    p.ProductName
FROM 
    Product p
WHERE 
    p.ProductKey NOT IN (SELECT s.ProductKey FROM Sales s); 


-- secondo approccio con left join
SELECT 
    p.ProductKey,
    p.ProductName
FROM 
    Product p
LEFT JOIN 
    Sales s ON p.ProductKey = s.ProductKey
WHERE 
    s.ProductKey IS NULL;
    
/* 8 Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” 
delle informazioni utili (codice prodotto, nome prodotto, nome categoria)*/
CREATE VIEW SSP_VIEW_Product AS(
SELECT 
	p.ProductKey AS Cod_Prod,
    p.ProductName,
    c.CategoryName
FROM 
	product p
JOIN 
	category c ON p.CategoryKey=c.CategoryKey);
    
/*9 Creare una vista per le informazioni geografiche*/
CREATE VIEW SSP_VIEW_Geography AS(
SELECT
	c.CountryKey,
    c.CountryName,
    r.RegionName
FROM 
	country c
JOIN 
	region r ON c.RegionKey=r.RegionKey
ORDER BY c.CountryKey);
	





