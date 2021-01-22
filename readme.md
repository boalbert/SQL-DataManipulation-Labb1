# Manipulera data i befintlig databas med hjälp av SQL

## Kurs: Utveckling i databas och databasadministration | Javautvecklare 2020



### Innehåll

Innehåller mina SQL queries för att lösa labbuppgift  `(Labb1.pdf)`. 


```sql
SELECT
    Spacecraft,
    [Launch date],
    [Carrier rocket],
    Operator,
    [Mission type]
INTO
    SuccessfulMissions
FROM 
    MoonMissions
WHERE 
    Outcome = 'Successful';

GO
```

```sql
UPDATE 
    SuccessfulMissions
SET 
    Operator = TRIM(Operator);

GO

DELETE FROM
     SuccessfulMissions
WHERE [Launch date] > '2009';

GO
```

```sql
SELECT
    Operator,
    [Mission type],
    Count([Mission type]) AS 'Mission Count'
FROM
    SuccessfulMissions
GROUP BY 
    Operator, 
    [Mission Type]
HAVING 
    Count([Mission type]) > 1
ORDER BY 
    Operator, 
    [Mission type];

GO
```

```sql
SELECT
     *,
    FirstName + ' ' + LastName as 'Name',
    CASE
        WHEN  SUBSTRING (ID,10,1) % 2 = 0 THEN 'Female'
        ELSE 'Male'
        END as 'Gender'
INTO
    NewUsers
FROM 
Users;  

GO
```

```sql
SELECT
    UserName,
    COUNT(UserName) as 'Duplicates'
FROM
    NewUsers
GROUP BY 
    UserName
HAVING 
   COUNT(UserName) > 1;

GO
```

```sql
UPDATE NewUsers SET UserName = 'sigp01' WHERE [Name] = 'Sigfrid Petersson'
UPDATE NewUsers SET UserName = 'sigp02' WHERE [Name] = 'Sigrid Pettersson'
UPDATE NewUsers SET UserName = 'felb01' WHERE [Name] = 'Felicia Bertilsson';

GO
```

```sql
DELETE FROM
     NewUsers
WHERE 
    SUBSTRING(ID,1,2) < 70 
AND
    GENDER = 'Female';

GO
```

```sql
INSERT INTO
    NewUsers
VALUES 
    ('840717-1231', 'alband',
    '47551f837eb5a3f260sd124fdfd03730', 'Albert',
    'Andersson','andersson.albert@gmail.com',
    '0730-550834','Albert Andersson','Male');
GO
```

```sql
SELECT
    Gender,
    AVG(DATEDIFF(year, LEFT(id,6), GETDATE())) AS "average age"
FROM
    NewUsers
GROUP BY
    Gender;

GO
```