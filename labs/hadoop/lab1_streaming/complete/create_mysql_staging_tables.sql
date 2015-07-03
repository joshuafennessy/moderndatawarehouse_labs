CREATE DATABASE IF NOT EXISTS brick_dw;

USE brick_dw;

DROP TABLE IF EXISTS stage_sensor_data;

CREATE TABLE IF NOT EXISTS stage_sensor_data
(
  sensor_record_ts DATETIME
 ,sensor_node_id CHAR(2)
 ,sensor_avg_temp_second DECIMAL(5,2)
 ,sensor_avg_humidity_second DECIMAL(5,2)
);
