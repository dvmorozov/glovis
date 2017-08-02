ALTER VIEW ViewStandardOBISSets
AS
SELECT * FROM 
	(SELECT * FROM 
		(SELECT * FROM
			(SELECT * FROM
				(SELECT ID AS AID, Value AS AValue 
				FROM TableOBISGroup 
				WHERE (Type = 'A') AND (Standard = 1) AND (Reserved = 0)
				) AS A,
				(SELECT ID AS BID, Value AS BValue
				FROM TableOBISGroup
				WHERE (Type = 'B') AND (Standard = 1) AND (Reserved = 0)
				) AS B
			) AS AB
			LEFT OUTER JOIN
				(SELECT t1.ID AS CID, t1.Value AS CValue, t.TopLevelOBISGroupID AS CTop 
				FROM 
					(SELECT * 
					FROM TableOBISGroup 
					WHERE (Type = 'C') AND (Standard = 1) AND (Reserved = 0)) AS t1
				LEFT OUTER JOIN TableOBISGroupLink AS t
				ON t.OBISGroupID = t1.ID
				) AS C
			ON (CTop = AID) --OR (CTop IS NULL) this adds secondary copies of data already extracted for CTop != NULL;
							--without "OR" it's OK
		) AS ABC
		LEFT OUTER JOIN
			(SELECT t1.ID AS DID, t1.Value AS DValue, t.TopLevelOBISGroupID AS DTop 
				FROM 
					(SELECT * 
					FROM TableOBISGroup 
					WHERE (Type = 'D') AND (Standard = 1) AND (Reserved = 0)) AS t1
				LEFT OUTER JOIN TableOBISGroupLink AS t
				ON t.OBISGroupID = t1.ID
			) AS D
		ON (DTop = AID) OR (DTop = CID)
	) AS ABCD
	LEFT OUTER JOIN
		(SELECT t1.ID AS EID, t1.Value AS EValue, t.TopLevelOBISGroupID AS ETop 
			FROM 
				(SELECT * 
				FROM TableOBISGroup 
				WHERE (Type = 'E') AND (Standard = 1) AND (Reserved = 0)) AS t1
			LEFT OUTER JOIN TableOBISGroupLink AS t
			ON t.OBISGroupID = t1.ID
		) AS E
	ON (ETop = AID)
GO