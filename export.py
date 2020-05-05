import cx_Oracle
import csv

connection = cx_Oracle.connect('alyosha', '123456789', 'localhost/xe')
cursor = connection.cursor()

columns = ['year', 'country', 'firstname', 'lastname', 'problem1', 'problem1', 'problem2', 'problem3', 'problem4', 'problem5', 'problem6', 'total', 'rank', 'award']

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