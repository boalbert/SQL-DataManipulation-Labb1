DROP TABLE NewUsers;
DROP TABLE SuccessfulMissions;

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

Update 
	SuccessfulMissions
SET
	Operator = TRIM(Operator);

GODELETE FROM
	SuccessfulMissions
WHERE 
	[Launch date] > '2009';

GOSELECT 	Operator,	[Mission type],	Count([Mission type]) AS 'Mission Count'FROM 	SuccessfulMissionsGROUP BY 
	Operator, 
	[Mission Type]
HAVING 
	Count([Mission type]) > 1
ORDER BY 
	Operator, 
	[Mission type];

GO

SELECT 
	*,
	FirstName + ' ' + LastName AS 'Name',
	CASE
		WHEN 
			SUBSTRING(id, 10, 1) % 2 = 1 THEN 'Male'
		ELSE 'Female'
	END AS 'Gender'
INTO 
	NewUsers
FROM 
	USERS;

GO

SELECT 
	UserName,
	Count(UserName) as 'Duplicates'
FROM
	NewUsers
GROUP BY 
	UserName
HAVING
	Count(UserName) > 1;

GO

UPDATE NewUsers SET UserName = 'sigp01' WHERE Name = 'Sigfrid Petersson';
UPDATE NewUsers SET UserName = 'sigp02' WHERE Name = 'Sigrid Pettersson';
UPDATE NewUsers SET UserName = 'felb01' WHERE Name = 'Felicia Bertilsson';

GO

DELETE FROM
	NewUsers
WHERE 
	SUBSTRING(Id, 1, 2) < 70 
	AND
	Gender = 'Female';

GO

INSERT INTO NewUsers
VALUES('841212-1237'
		, 'alband'
		, '67b48cc32ab9f04431bd50656a4a26fc'
		, 'Albert'
		, 'Andersson'
		, 'andersson.albert@gmail.com'
		, '0730-550834'
		, 'Albert Andersson', 'Male');

GO

SELECT 
	Gender,
	AVG(datediff(year, left(id, 6), getdate())) AS 'Average Age'
FROM 
	NewUsers
GROUP BY 
	Gender;

GO