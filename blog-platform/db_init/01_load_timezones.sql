CREATE DATABASE IF NOT EXISTS mysql_timezone;
USE mysql_timezone;
SOURCE /usr/share/mysql/timezone_sql/timezone.sql;
SOURCE /usr/share/mysql/timezone_sql/timezone_leap_second.sql;
SOURCE /usr/share/mysql/timezone_sql/timezone_name.sql;
SOURCE /usr/share/mysql/timezone_sql/timezone_transition_type.sql;
SOURCE /usr/share/mysql/timezone_sql/timezone_version.sql;