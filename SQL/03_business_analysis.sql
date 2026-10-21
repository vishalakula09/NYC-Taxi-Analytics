-- ============================================================================
-- NYC YELLOW TAXI ANALYTICS | JANUARY 2024
-- Business Analysis (MySQL 8.0)
-- Source: Cleaned January 2024 NYC TLC Yellow Taxi trip data
-- Scope: 2,867,591 cleaned trips with positive fare and total amounts
-- Database: nyc_taxi_analytics | Table: taxi_trips
-- Note: Monetary figures are recorded charges, NOT verified collections/profit.
-- ============================================================================

USE nyc_taxi_analytics;

-- 01. DATA VALIDATION: Confirm imported number of trips
SELECT COUNT(*) AS total_imported_trips
FROM taxi_trips;

-- 02. OVERALL TRIP SUMMARY: January trip volume, mean distance and duration
SELECT
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles,
    ROUND(AVG(trip_duration_min), 2) AS avg_duration_minutes
FROM taxi_trips;

-- 03. PICKUPS BY BOROUGH: Rank locations by trip volume
SELECT
    pickup_borough_report AS borough,
    COUNT(*) AS total_trips
FROM taxi_trips
GROUP BY pickup_borough_report
ORDER BY total_trips DESC;

-- 04. BOROUGH SHARE: Share of all cleaned January trips
SELECT
    pickup_borough_report AS borough,
    COUNT(*) AS total_trips,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM taxi_trips), 2)
        AS trip_percentage
FROM taxi_trips
GROUP BY pickup_borough_report
ORDER BY total_trips DESC;

-- 05. HOURLY DEMAND: Pickup volume by hour (0=midnight, 18=6 PM)
SELECT
    pickup_hour,
    COUNT(*) AS total_trips
FROM taxi_trips
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- 06. WEEKDAY VS WEEKEND: Compare average daily trip volume fairly
SELECT
    day_type,
    COUNT(*) AS total_trips,
    COUNT(DISTINCT pickup_date) AS number_of_days,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT pickup_date), 2)
        AS avg_trips_per_day
FROM taxi_trips
GROUP BY day_type
ORDER BY avg_trips_per_day DESC;

-- 07. HOURLY DEMAND BY DAY TYPE: Average pickups per weekday/weekend day
SELECT
    day_type,
    pickup_hour,
    COUNT(*) AS total_trips,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT pickup_date), 2)
        AS avg_trips_per_day
FROM taxi_trips
GROUP BY day_type, pickup_hour
ORDER BY day_type, pickup_hour;

-- 08. TRIP DURATION BY HOUR: Distinguish trip volume and duration
SELECT
    pickup_hour,
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_duration_min), 2) AS avg_duration_min,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles
FROM taxi_trips
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- 09. FINANCIAL SUMMARY: Recorded fare and charge values
SELECT
    COUNT(*) AS total_trips,
    ROUND(SUM(fare_amount), 2) AS total_fare_amount,
    ROUND(SUM(total_amount), 2) AS total_recorded_charges,
    ROUND(AVG(fare_amount), 2) AS avg_fare_per_trip,
    ROUND(AVG(total_amount), 2) AS avg_total_charge_per_trip
FROM taxi_trips;

-- 10. FINANCIAL ANALYSIS BY BOROUGH: Total and average recorded charges
SELECT
    pickup_borough_report AS borough,
    COUNT(*) AS total_trips,
    ROUND(SUM(fare_amount), 2) AS total_fares,
    ROUND(SUM(total_amount), 2) AS total_charges,
    ROUND(AVG(total_amount), 2) AS avg_charge_per_trip
FROM taxi_trips
GROUP BY pickup_borough_report
ORDER BY total_charges DESC;

-- 11. QUEENS VS MANHATTAN: Investigate differences in trip characteristics
SELECT
    pickup_borough_report AS borough,
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles,
    ROUND(AVG(trip_duration_min), 2) AS avg_duration_minutes,
    ROUND(AVG(fare_amount), 2) AS avg_base_fare,
    ROUND(AVG(total_amount), 2) AS avg_total_charge
FROM taxi_trips
WHERE pickup_borough_report IN ('Manhattan', 'Queens')
GROUP BY pickup_borough_report
ORDER BY avg_total_charge DESC;

-- 12. TOP QUEENS PICKUP ZONES: Find high-volume location IDs
SELECT
    PULocationID,
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles,
    ROUND(AVG(total_amount), 2) AS avg_total_charge
FROM taxi_trips
WHERE pickup_borough_report = 'Queens'
GROUP BY PULocationID
ORDER BY total_trips DESC
LIMIT 15;

-- 13. AIRPORT VS OTHER QUEENS ZONES:
-- TLC zone IDs: 132 = JFK Airport; 138 = LaGuardia Airport
SELECT
    CASE
        WHEN PULocationID = 132 THEN 'JFK Airport'
        WHEN PULocationID = 138 THEN 'LaGuardia Airport'
        ELSE 'Other Queens Zones'
    END AS pickup_category,
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles,
    ROUND(AVG(trip_duration_min), 2) AS avg_duration_minutes,
    ROUND(AVG(total_amount), 2) AS avg_total_charge
FROM taxi_trips
WHERE pickup_borough_report = 'Queens'
GROUP BY pickup_category
ORDER BY total_trips DESC;

-- 14. PAYMENT METHOD: Share of cleaned trips by reported payment type
-- TLC codes: 0=Flex Fare, 1=Credit Card, 2=Cash, 3=No Charge, 4=Dispute
SELECT
    payment_type,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_total_charge,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM taxi_trips), 2)
        AS trip_percentage
FROM taxi_trips
GROUP BY payment_type
ORDER BY total_trips DESC;

-- 15. PAYMENT-STATUS VALIDATION: Positive recorded charges with codes 3/4
SELECT
    payment_type,
    COUNT(*) AS total_trips,
    ROUND(SUM(total_amount), 2) AS total_recorded_charges,
    ROUND(MIN(total_amount), 2) AS minimum_charge,
    ROUND(MAX(total_amount), 2) AS maximum_charge
FROM taxi_trips
WHERE payment_type IN (3, 4)
GROUP BY payment_type
ORDER BY payment_type;

-- ============================================================================
-- INTERPRETATION NOTES
-- * Totals cover cleaned positive-charge January 2024 yellow taxi records only.
-- * Total_amount is a recorded charge, not verified collection or net profit.
-- * Dispute/No Charge codes can still have positive reported total_amount.
-- * Airport mix helps explain Queens average charges; causality not established.
-- ============================================================================
