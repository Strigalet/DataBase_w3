DECLARE
    participants_number int := 15;
    participants_by_country int := 3;
    first_year int := 1922;
    last_year int := 2017;
    full_mark int := 7;
BEGIN
    INSERT INTO Country(country_name) VALUES ('CHN');
    INSERT INTO AwardType(award_type) VALUES ('Gold Medal');

    FOR i IN 10..participants_number
    LOOP
        IF (i <= (participants_number - participants_by_country))
        THEN
            INSERT INTO Participant_Award(participant_id,year,award_type) VALUES (i,first_year,'Gold Medal');
            INSERT INTO Problem_1(participant_id,year,mark) VALUES (i,first_year,full_mark);
            INSERT INTO Problem_2(participant_id,year,mark) VALUES (i,first_year,full_mark);
            INSERT INTO Problem_3(participant_id,year,mark) VALUES (i,first_year,full_mark);
            INSERT INTO Problem_4(participant_id,year,mark) VALUES (i,first_year,full_mark);
            INSERT INTO Problem_5(participant_id,year,mark) VALUES (i,first_year,full_mark);
            INSERT INTO Problem_6(participant_id,year,mark) VALUES (i,first_year,full_mark);
            INSERT INTO Participant_Country(participant_id,country_name) VALUES (i,'CHN')
        ELSE
            INSERT INTO Participant_Award(participant_id,year,award_type) VALUES (i,last_year,'Gold Medal');
            INSERT INTO Participant_Country(participant_id,country_name) VALUES (i,'CHN')
    END LOOP;
END;