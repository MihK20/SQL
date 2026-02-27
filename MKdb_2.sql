--USE movies

--SELECT name FROM moviestar JOIN starsin ON starname=name
--	JOIN movie as m ON title=movietitle
--	WHERE gender = 'F' AND movietitle='Terms of Endearment'

--SELECT m.name FROM moviestar AS m
	--JOIN starsin ON starname=name
	--JOIN movie ON movietitle = title
	--JOIN studio ON studio.name=studioname
	--WHERE studio.name ='MGM' AND movieyear=1995

--USE pc

--SELECT maker, speed FROM laptop
--	JOIN product ON laptop.model = product.model
--	WHERE hd>=9

--(SELECT p.model, price FROM product as p
--	JOIN laptop AS l ON l.model = p.model
--	WHERE maker='B')
--	UNION
--(SELECT p.model, price FROM product as p
--	JOIN printer AS pr ON pr.model = p.model
--	WHERE maker='B')
--	UNION
--(SELECT p.model, price FROM product as p
--	JOIN pc ON pc.model = p.model
--	WHERE maker='B')
--	ORDER BY price

--SELECT DISTINCT p1.hd FROM pc as p1, pc as p2
--	WHERE p1.hd = p2.hd AND NOT (p1.code = p2.code)

--SELECT DISTINCT p1.model, p2.model FROM pc as p1, pc as p2
--	WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND NOT (p1.code = p2.code) AND p1.model<p2.model

--SELECT maker FROM product
--	JOIN pc as p1 ON p1.model = product.model
--	JOIN pc as p2 ON p2.model = product.model
--	WHERE p1.speed>=500 AND P2.SPEED>=500 AND NOT(p1.code=p2.code) 

USE ships

--SELECT name FROM ships JOIN classes ON ships.class=classes.class WHERE displacement>=35000

SELECT ships.name, bore, numguns FROM ships 
	JOIN classes ON ships.class=classes.class
	JOIN outcomes ON ship=ships.name
	JOIN battles ON battle = battles.name
 	WHERE battles.name='Guadalcanal'

SELECT country FROM classes WHERE type='bb'
	INTERSECT
SELECT country FROM classes WHERE type='bc'


SELECT ships.name FROM SHIPS
	JOIN (SELECT ships.name, result, b1.date AS D FROM ships
		JOIN outcomes ON ship=ships.name
		JOIN battles as b1 ON battle = b1.name
		WHERE result='damaged') AS S ON S.NAME=SHIPS.NAME
	JOIN outcomes ON ship=ships.name
	JOIN battles as b1 ON battle = b1.name
	WHERE S.D<B1.DATE
	
