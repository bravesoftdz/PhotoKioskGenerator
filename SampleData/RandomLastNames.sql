/****** Script for SelectTopNRows command from SSMS  ******/
SELECT LastName,
		CASE
		  WHEN LEN(Parent1Name) = 0 THEN Parent2Name
		  WHEN LEN(Parent2Name) = 0 THEN Parent1Name
		  ELSE Parent1Name + ' & ' + Parent2Name
		END AS ParentNames,
        
		/* this SQL misses some child names, but only if Child1Name is NULL; it's OK in
        this case because it's random data anyway and is good enough for my testing */
	    Child1Name + COALESCE(', ' + Child2Name, '') + COALESCE(', ' + Child3Name, '') AS Children,
		
		PictureFilename
  FROM [dbo].[NamesAndPhotos]
  WHERE LEN(Parent1Name) > 0 OR LEN(Parent2Name) > 0
  ORDER By LastName