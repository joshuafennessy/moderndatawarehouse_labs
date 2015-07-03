REGISTER 'hdfs://sandbox:8020/jars/piggybank-0.12.0.jar';

rmf /streaming/sensor_raw_delimited;

sensordata = LOAD '/flume/sensors/'
  USING org.apache.pig.piggybank.storage.FixedWidthLoader(
   '1-4, 5-6, 7-8, 9-10, 11-12, 13-14, 15-16, 17-19, 20-21,  22-23, 24', 'USE_HEADER',
   's_year: int, s_month: int, s_day: int, s_hour: int, s_minute: int, s_second: int, s_node: chararray, temp_whole: int, temp_decimal: int, humidity_whole: int, humidity_decimal: int');

STORE sensordata INTO '/streaming/sensor_raw_delimited' USING PigStorage ('|');
   
