CREATE OR REPLACE VIEW Country_Rank AS
SELECT
   Participant.participant_id,
   country_name,
   year,
   rank
FROM Participant JOIN Award ON Participant.participant_id = Award.participant_id




