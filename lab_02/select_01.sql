SELECT DISTINCT C1.name, C1.surname
FROM Customers C1 JOIN Customers C2 on C1.name = C2.name
WHERE C1.pk <> C2.pk and C1.country = 'Brazil'
ORDER BY C1.surname;
