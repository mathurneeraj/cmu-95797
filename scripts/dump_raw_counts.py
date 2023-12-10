#!/usr/bin/env python
import duckdb

outputfile_rawcount = './answers/raw_counts.txt'

def main():

    # Connect with DuckDB - main.db
    connection = duckdb.connect("main.db")

    # execute query to get all the table names from the schema
    raw_tables = connection.execute("select table_name from information_schema.tables").fetchall()

    # open out file in write mode
    with open(outputfile_rawcount, 'w') as output_file:
        # query for row counts for each table and write to the output file
        for table in raw_tables:
            table_name = table[0]
            count = connection.execute(f'select count(*) from {table_name}').fetchone()[0]
            output_file.write(f'Table {table_name} has {count} rows\n')



if __name__ == "__main__":
    main()