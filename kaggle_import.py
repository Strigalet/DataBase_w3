import cx_Oracle
import csv
import io

connection = cx_Oracle.connect('alyosha', '123456789', 'localhost/xe')
cursor = connection.cursor()

country_names = []
participant_id = 1

years=['1984','1994','2004','2014']

with io.open('imo_results.csv', 'r') as file:
    reader = csv.DictReader(file, delimiter=',')

    try:
        for row in reader:
            country = row['country'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            if country not in country_names:
                add_country_query = "INSERT INTO Country (country_name) VALUES (:country)"
                cursor.execute(add_country_query, country=country)
                country_names.append(country)




            year = row['year'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            firstname = row['firstname'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            lastname = row['lastname'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            country = row['country'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            total = row['total'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            rank = row['rank'].encode('utf-8', 'replace').decode('utf-8', 'ignore')
            award = row['award'].encode('utf-8', 'replace').decode('utf-8', 'ignore')

            if bool(firstname) == 0:
                firstname = "NoName"
            if bool(lastname) == 0:
                lastname = "NoName"
            if bool(award) == 0:
                award = "No Award"

            if  year in years:
                add_participant_query = """INSERT INTO Participant (participant_id, firstname, lastname, country_name)
                                            VALUES (:participant_id, :firstname, :lastname, :country_name)"""
                cursor.execute(add_participant_query, participant_id=participant_id, firstname=firstname, lastname=lastname, country_name=country)

                add_award_query = """INSERT INTO Award (total,rank,award_type,participant_id,year)
                                            VALUES (:total, :rank, :award_type, :participant_id, :year)"""
                cursor.execute(add_award_query, total=total, rank=rank, award_type=award, participant_id=participant_id, year=year)

                participant_id += 1

    except Exception as e:
        print(e)


connection.commit()
cursor.close()
connection.close()

