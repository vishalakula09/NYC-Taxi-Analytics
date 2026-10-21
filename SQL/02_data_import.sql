
-- =====================================================
-- NYC YELLOW TAXI ANALYTICS | DATA IMPORT
-- January 2024
-- =====================================================

-- Select the database
USE nyc_taxi_analytics;

-- Create the table for the cleaned reporting dataset
CREATE TABLE IF NOT EXISTS taxi_trips (
    trip_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    VendorID INT,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    passenger_count DOUBLE,
    trip_distance DOUBLE,
    PULocationID INT,
    DOLocationID INT,
    payment_type INT,
    fare_amount DECIMAL(12,2),
    tip_amount DECIMAL(12,2),
    total_amount DECIMAL(12,2),
    trip_duration_min DOUBLE,
    pickup_borough_report VARCHAR(100),
    dropoff_borough_report VARCHAR(100),
    pickup_hour INT,
    day_of_week INT,
    day_type VARCHAR(20),
    pickup_date DATE,
    distance_category VARCHAR(20)
);

-- Verify the table structure
DESCRIBE taxi_trips;

-- =====================================================
-- IMPORT CLEANED CSV USING MYSQL WORKBENCH
-- =====================================================
--
-- The cleaned CSV contains 19 columns and 2,867,591 rows.
-- The MySQL table contains an additional auto-increment
-- primary key named trip_id.
--
-- Import steps:
--
-- 1. Open MySQL Workbench and connect to MySQL Server.
--
-- 2. Under SCHEMAS, expand nyc_taxi_analytics.
--
-- 3. Right-click Tables and select:
--    Table Data Import Wizard.
--
-- 4. Select the cleaned CSV:
--    Data/nyc_taxi_cleaned_jan2024.csv
--
-- 5. Choose the existing table:
--    nyc_taxi_analytics.taxi_trips
--
-- 6. Review the column mappings and data types.
--    Map the 19 CSV columns to their matching table columns.
--    Do not map trip_id because MySQL generates it automatically.
--
-- 7. Run the import and check for errors.
--
-- 8. Verify the row count using the SELECT query below.
--
-- Expected result: 2,867,591 rows.
--
-- Note: Import into an empty table to avoid duplicate records.
-- For large files, the Workbench import may be slow.
-- =====================================================
SELECT COUNT(*) AS total_imported_trips
FROM taxi_trips;
