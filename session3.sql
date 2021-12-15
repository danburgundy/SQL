/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
	LastName, City ve Address bilgilerini listeleyen sorguyu yazınız*/
	
	SELECT FirstName, LastName, City, Address
	FROM customers
	WHERE FirstName LIKE '___';
	
	
	/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
	LastName ve City bilgilerini listeleyen sorguyu yazınız*/
	SELECT FirstName, LastName, City
    FROM customers
    WHERE LastName LIKE 'Sch%' OR 'Go%';


    SELECT COUNT(first_name)
    FROM Student_id;

    SELECT count(DISTINCT Composer) AS besteci
    FROM tracks;

-- HOMEWORK /* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 
SELECT count(DISTINCT InvoiceDate) AS years
FROM invoices;

-- SELECT MIN(hire_date) AS earliest_date
-- FROM employees;


-- MIN,MAX
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	
	SELECT name as Song_Name, min(Milliseconds)/1000.0 as Duration
	FROM tracks;


	-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
    SELECT SUM(total) AS Toplam_Gelir
    FROM invoices;

-- HOMEWORK /* invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */

/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
SELECT ROUND(AVG(total),2) AS ortalama_Gelir
FROM invoices;

	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
   SELECT round(AVG(Milliseconds))
   FROM tracks;

   SELECT Name
    FROM tracks
    WHERE Milliseconds>393599;

    SELECT Name, Milliseconds
    FROM tracks
    WHERE Milliseconds> (SELECT AVG(Milliseconds)
    FROM tracks)

    SELECT gender, COUNT(gender)
    FROM employees
    GROUP BY gender;

    /*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
    SELECT Composer, COUNT(name)
    FROM tracks
    WHERE Composer IS NOT NULL
    GROUP BY Composer;

    /* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
    SELECT country, COUNT(FirstName) AS customer_num
    FROM customers
    GROUP BY country
    ORDER BY customer_num DESC;

    /* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
    SELECT country, City, COUNT(FirstName) AS num_of_cost
    FROM customers
    GROUP BY country, City;

    /* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
    SELECT BillingCountry, ROUND(AVG(total), 2) AS avg_bill
    FROM invoices
    -- WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23:59:59' 
    GROUP BY BillingCountry;


    /*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT students.name, students.exam, students.score, tests.passing_score
FROM students
INNER JOIN tests ON students.exam = tests.exam;

SELECT students.name, students.exam, students.score, tests.passing_score
FROM tests
LEFT JOIN students ON students.exam = tests.exam;

SELECT markalar.marka_id, markalar.marka_adi,
siparisler.siparis_adedi, siparisler.siparis_tarihi
FROM markalar
JOIN siparisler
ON markalar.marka_id = siparisler.marka_id;