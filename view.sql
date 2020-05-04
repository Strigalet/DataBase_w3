CREATE OR REPLACE VIEW One_Two AS
SELECT 
    Problem_1.participant_id,
    Problem_1.year,
    Problem_1.mark problem_1,
    Problem_2.mark problem_2
FROM Problem_1 
     JOIN Problem_2 ON Problem_1.participant_id = Problem_2.participant_id;


CREATE OR REPLACE VIEW Three_Four AS
SELECT 
    Problem_3.participant_id,
    Problem_3.year,
    Problem_3.mark problem_3,
    Problem_4.mark problem_4
FROM Problem_3 
     JOIN Problem_4 ON Problem_3.participant_id = Problem_4.participant_id;


CREATE OR REPLACE VIEW Five_Six AS
SELECT 
    Problem_5.participant_id,
    Problem_5.year,
    Problem_5.mark problem_5,
    Problem_6.mark problem_6
FROM Problem_5 
     JOIN Problem_6 ON Problem_5.participant_id = Problem_6.participant_id;


CREATE OR REPLACE VIEW One_Two_Three_Four AS
SELECT 
    One_Two.participant_id,
    One_Two.year,
    Problem_1,
    Problem_2,
    Problem_3,
    Problem_4
FROM One_Two 
     JOIN Three_Four ON One_Two.participant_id = Three_Four.participant_id;

CREATE OR REPLACE VIEW Participant_Marks AS
SELECT 
    One_Two_Three_Four.participant_id,
    One_Two_Three_Four.year,
    Problem_1,
    Problem_2,
    Problem_3,
    Problem_4,
    Problem_5,
    Problem_6
FROM One_Two_Three_Four 
     JOIN Five_Six ON One_Two_Three_Four.participant_id = Five_Six.participant_id;


DROP VIEW One_Two;
DROP VIEW Three_Four;
DROP VIEW Five_Six;
DROP VIEW One_Two_Three_Four;
