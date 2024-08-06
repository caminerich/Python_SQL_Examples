--recuiting platform. each recruit co can make a request for their canadiates to complete a personalized skill assessment
--assessment can contin tasks in three categories: SQL, ALGO, BugFixing.
--Following assessment, co recieves a report containing, for each candidate, delcared years of experience (integer 0-100) and score in each category
--score of null is a perfect score
--table assessments with id integer, experience integer, sql integer, algo integer, bug_fixing integer, unique(id)
--Now, write a sql query exp years of experience, max number of assessment with null, 
--and count of candidates with same amount of experience,
-- and count ofassessments with null 
SELECT 
    id, 
    COUNT(*) AS count, 
    COUNT(CASE WHEN sql IS NULL THEN 1 END) AS sql, 
    COUNT(CASE WHEN algo IS NULL THEN 1 END) AS algo, 
    COUNT(CASE WHEN bug_fixing IS NULL THEN 1 END) AS bug_fixing

Fix this query to return the correct result where we combine sql, algo, and bug fixing null score as one category
Null is a perfect score and we want to count the nulls
SELECT 
    experience AS exp, 
    COUNT(*) AS count, 
    COUNT(CASE WHEN sql IS NULL THEN 1
    WHEN algo IS NULL THEN 1 
    WHEN bug_fixing IS NULL THEN 1 
    END) AS max
FROM 
    assessments
GROUP BY 
    experience
ORDER BY 
    experience DESC;
    
Test Data
insert into assessments values ( 1, 3, 100, NULL, 50);
insert into assessments values ( 2, 5, NULL, 100, 100);
insert into assessments values ( 3, 1, 100, 100, 100);
insert into assessments values ( 4, 5, 100, 50, NULL);
insert into assessments values ( 5, 5, 100, 100, 100);