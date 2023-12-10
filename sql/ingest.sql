.echo on

-- Create bike_data table and read "citibike-tripdata.csv.gz" CSV file to load bike data into bike_data table.
-- Here columns are merged by name
-- The CSV data is stored as strings
CREATE TABLE bike_data AS SELECT * FROM read_csv_auto('./data/citibike-tripdata.csv.gz', union_by_name=True, filename=True, all_varchar=1);

-- Create central_park_weather table and read "central_park_weather.csv" CSV file to load weather data into central_park_weather table.
-- Here columns are merged by name
-- The CSV data is stored as strings
CREATE TABLE central_park_weather AS SELECT * FROM read_csv_auto('./data/central_park_weather.csv', union_by_name=True, filename=True, all_varchar=1);

-- Create fhv_bases table and read "fhv_bases.csv" CSV file to load location data into fhv_bases table.
-- Here columns are merged by name
-- The CSV data is stored as strings
-- Note: header is added to ensure that column names are correctly picked
CREATE TABLE fhv_bases AS SELECT * FROM read_csv_auto('./data/fhv_bases.csv', union_by_name=True, filename=True, all_varchar=1, header=True);

-- Read all parquet files to load trip and taxi data into respective tables
-- Here columns are merged by name
CREATE TABLE fhv_tripdata AS SELECT * FROM read_parquet('./data/taxi/fhv_tripdata.parquet', union_by_name=True, filename=True);
CREATE TABLE fhvhv_tripdata AS SELECT * FROM read_parquet('./data/taxi/fhvhv_tripdata.parquet', union_by_name=True, filename=True);
CREATE TABLE green_tripdata AS SELECT * FROM read_parquet('./data/taxi/green_tripdata.parquet', union_by_name=True, filename=True);
CREATE TABLE yellow_tripdata AS SELECT * FROM read_parquet('./data/taxi/yellow_tripdata.parquet', union_by_name=True, filename=True);


