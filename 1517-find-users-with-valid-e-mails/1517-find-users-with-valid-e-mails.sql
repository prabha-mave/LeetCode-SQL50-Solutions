/* Write your T-SQL query statement below */

SELECT *
FROM Users
WHERE mail LIKE '[a-zA-Z]%@leetcode.com'
  AND mail NOT LIKE '%[^a-zA-Z0-9_.-]%@leetcode.com'
  AND RIGHT(mail, 13) COLLATE Latin1_General_BIN = '@leetcode.com'










-- [^...] means: Any character NOT inside these brackets
-- Find any string that contains at least one disallowed character anywhere
-- RIGHT(string, number_of_characters)
-- LIKE '%[allowed]%'
-- → "At least one good character exists."
-- NOT LIKE '%[^allowed]%'
-- → "No bad characters exist at all."