CREATE DATABASE IF NOT EXISTS brickhouse;

USE brickhouse;

DROP TABLE IF EXISTS sensor_raw_data;

CREATE EXTERNAL TABLE IF NOT EXISTS sensor_raw_data
(
   s_year INT
  ,s_month INT
  ,s_day INT
  ,s_hour INT
  ,s_minute INT
  ,s_second INT
  ,node_id STRING
  ,temp_part_whole INT
  ,temp_part_decimal INT
  ,humidity_part_whole INT
  ,humidity_part_decimal INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '/streaming/sensor_raw_delimited';
