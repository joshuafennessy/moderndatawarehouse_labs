CREATE DATABASE IF NOT EXISTS brickhouse;

USE brickhouse;

DROP TABLE IF EXISTS sensor_data_aggregated;

CREATE TABLE IF NOT EXISTS sensor_data_aggregated
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
AS
  SELECT
     sensor_ts
    ,node_id
    ,AVG(sensor_temp) AS avg_sensor_temp
    ,AVG(sensor_humidity) AS avg_sensor_humidity
  FROM
   (
    SELECT 
       CAST(CONCAT(CAST(s_year AS STRING), '-', LPAD(CAST(s_month AS STRING), 2, '0'), 
              '-', LPAD(CAST(s_day AS STRING), 2, '0'), ' ', LPAD(CAST(s_hour AS STRING), 2, '0'),
              ':', LPAD(CAST(s_minute AS STRING), 2, '0'), ':', LPAD(CAST(s_second AS STRING), 2, '0')) AS TIMESTAMP) AS sensor_ts
      ,node_id
      ,CAST(CONCAT(CAST(temp_part_whole AS STRING), ".", CAST(temp_part_decimal AS STRING)) AS DOUBLE) as sensor_temp
      ,CAST(CONCAT(CAST(humidity_part_whole AS STRING), ".", CAST(humidity_part_decimal AS STRING)) AS DOUBLE) as sensor_humidity
    FROM sensor_raw_data
   ) source
  GROUP BY 
     sensor_ts
    ,node_id
;
