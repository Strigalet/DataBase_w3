import cx_Oracle
import csv

connection = cx_Oracle.connect('alyosha', '123456789', 'localhost/xe')
cursor = connection.cursor()

columns = ['AWARD', 'AWARDTYPE', 'COUNTRY', 'OLYMPIAD','PARTICIPANT', 'PROBLEM_1', 'PROBLEM_2', 'PROBLEM_3', 'PROBLEM_4', 'PROBLEM_5','PROBLEM_6']

for column in columns:
    with open(f'{column}.csv', 'w', newline='') as file:

        writer = csv.writer(file)

        query = f'SELECT * FROM {column}'

        cursor.execute(query)



        names = [inf[0] for inf in cursor.description]

        writer.writerow(names)
        for i in cursor:

            writer.writerow(i)



cursor.close()
connection.close()
