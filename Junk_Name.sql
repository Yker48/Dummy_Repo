CREATE TABLE DEV.TEST.JUNK_NAMES (
    NAME VARCHAR(255)
);

INSERT INTO DEV.TEST.JUNK_NAMES
(NAME) VALUES
('*1@A_b)C#'),
('a(B=c*/'),
('%BcD_&5'),
('h&&%PL'),
(';)HpL*#'),
('9GrP>7');

--SELECT * FROM DEV.TEST.JUNK_NAMES
--NAME
--*1@A_b)C#
--a(B=c*/
--%BcD_&5
--h&&%PL
--;)HpL*#
--9GrP>7

WITH CleanedNames AS (
    SELECT
        UPPER(REGEXP_REPLACE(NAME, '[^a-zA-Z]', '')) AS CleanedName
    FROM
        DEV.TEST.JUNK_NAMES
),
GroupedNames AS (
    SELECT
        CleanedName,
        COUNT(*) AS Count
    FROM
        CleanedNames
    GROUP BY
        CleanedName
)
SELECT
    CleanedName AS NAME,
    Count
FROM
    GroupedNames
ORDER BY
    NAME;

/*SOLUTION
NAME	COUNT
ABC	    2
BCD	    1
GRP	    1
HPL	    2
 */