-- =====================================================
-- NYC YELLOW TAXI ANALYTICS | DATABASE SETUP
-- January 2024
-- =====================================================

-- Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS nyc_taxi_analytics;

-- Select the database
USE nyc_taxi_analytics;

-- Verify the selected database
SELECT DATABASE() AS active_database;