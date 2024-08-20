--recuiting platform. each recruit company can make a request for their canadiates to complete a personalized skill assessment
--assessment can contain tasks in three categories: SQL, ALGO, BugFixing.
--Following assessment, company recieves a report containing, for each candidate:
--1. delcared years of experience (integer 0-100) and 2. score in each category
--score of null is a perfect score
--we have table assessments with id integer, experience integer, sql integer, algo integer, bug_fixing integer
--write a sql query with:
-- 1.years of experience (exp)
-- 2. max number of assessment per candidate with perfect (null) score (max), 
-- 3. count of candidates with same amount of experience (can),
"""
-- Test Data
CREATE TABLE assessments (id INTEGER PRIMARY KEY, experience INTEGER, sql INTEGER, algo INTEGER, bug_fixing INTEGER);
insert into assessments values ( 1, 3, 100, NULL, 50);
insert into assessments values ( 2, 5, NULL, 100, 100);
insert into assessments values ( 3, 1, 100, 100, 100);
insert into assessments values ( 4, 5, 100, 50, NULL);
insert into assessments values ( 5, 5, 100, 100, 100);
"""

SELECT 
    experience AS exp
    ,MAX(CASE WHEN sql IS NULL THEN 1 ELSE 0 END + 
        CASE WHEN algo IS NULL THEN 1 ELSE 0 END + 
        CASE WHEN bug_fixing IS NULL THEN 1 ELSE 0 END
    ) AS max
    , COUNT(*) AS can
FROM assessments
GROUP BY experience
ORDER BY experience DESC;
    
