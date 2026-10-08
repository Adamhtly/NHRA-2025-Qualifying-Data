USE NHRAWeather

CREATE TABLE Nitro_2025(
    Event_Number TINYINT,
    Events VARCHAR(50),
    FC_Q1_Temperature INT,
    FC_Q1_Rel_Humidity INT,
    FC_Q1_Barometric_Pressure Float,
    FC_Q1_Adjusted_Altitude INT,
    FC_Q1_Track_Temperature INT,
    FC_Q2_Temperature INT,
    FC_Q2_Rel_Humidity INT,
    FC_Q2_Barometric_Pressure Float,
    FC_Q2_Adjusted_Altitude INT,
    FC_Q2_Track_Temperature INT,
    FC_Q3_Temperature INT,
    FC_Q3_Rel_Humidity INT,
    FC_Q3_Barometric_Pressure Float,
    FC_Q3_Adjusted_Altitude INT,
    FC_Q3_Track_Temperature INT,
    FC_Q4_Temperature INT,
    FC_Q4_Rel_Humidity INT,
    FC_Q4_Barometric_Pressure Float,
    FC_Q4_Adjusted_Altitude INT,
    FC_Q4_Track_Temperature INT,
    INDY_FC_Q5_Temperature INT,
    INDY_FC_Q5_Rel_Humidity INT,
    INDY_FC_Q5_Barometric_Pressure FLOAT,
    INDY_FC_Q5_Adjusted_Altitude INT,
    INDY_FC_Q5_Track_Temperature INT,
    TF_Q1_Temperature INT,
    TF_Q1_Rel_Humidity INT,
    TF_Q1_Barometric_Pressure Float,
    TF_Q1_Adjusted_Altitude INT,
    TF_Q1_Track_Temperature INT,
    TF_Q2_Temperature INT,
    TF_Q2_Rel_Humidity INT,
    TF_Q2_Barometric_Pressure Float,
    TF_Q2_Adjusted_Altitude INT,
    TF_Q2_Track_Temperature INT,
    TF_Q3_Temperature INT,
    TF_Q3_Rel_Humidity INT,
    TF_Q3_Barometric_Pressure Float,
    TF_Q3_Adjusted_Altitude INT,
    TF_Q3_Track_Temperature INT,
    TF_Q4_Temperature INT,
    TF_Q4_Rel_Humidity INT,
    TF_Q4_Barometric_Pressure Float,
    TF_Q4_Adjusted_Altitude INT,
    TF_Q4_Track_Temperature INT,
    INDY_TF_Q5_Temperature INT,
    INDY_TF_Q5_Rel_Humidity INT,
    INDY_TF_Q5_Barometric_Pressure FLOAT,
    INDY_TF_Q5_Adjusted_Altitude INT,
    INDY_TF_Q5_Track_Temperature INT
)

/* Majority of values sourced from relevant child-pages at https://www.nhra.com/results/2025/nhra-mission-foods-drag-racing-series.
   Where necessary due to absence of weather information at qualifying results pages, some values obtained from recorded livestreams at nhra.tv (subscription required).
   In instances where weather data was not provided at either of the above sources, relevant historical track-based weather information acquired from https://airdensityonline.com/tracks/ (free account required).
 */

/*INSERT INTO Nitro_2025 (event, tf_q1_temperature, tf_q1_rel_humidity, tf_q1_barometric_pressure, tf_q1_adjusted_altitude, tf_q2_temperature, tf_q2_rel_humidity, tf_q2_barometric_pressure, tf_q2_adjusted_altitude, tf_q3_temperature, tf_q3_rel_humidity, tf_q3_barometric_pressure, tf_q3_adjusted_altitude, tf_q4_temperature, tf_q4_rel_humidity, tf_q4_barometric_pressure, tf_q4_adjusted_altitude, indy_tf_q5_temperature, indy_tf_q5_rel_humidity, indy_tf_q5_barometric_pressure, indy_tf_q5_adjusted_altitude, indy_fc_q5_temperature, indy_fc_q5_rel_humidity, indy_fc_q5_barometric_pressure, indy_fc_q5_adjusted_altitude, fc_q1_temperature, fc_q1_rel_humidity, fc_q1_barometric_pressure, fc_q1_adjusted_altitude, fc_q2_temperature, fc_q2_rel_humidity, fc_q2_barometric_pressure, fc_q2_adjusted_altitude, fc_q3_temperature, fc_q3_rel_humidity, fc_q3_barometric_pressure, fc_q3_adjusted_altitude, fc_q4_temperature, fc_q4_rel_humidity, fc_q4_barometric_pressure, fc_q4_adjusted_altitude),
    VALUES
        ('Gatornationals', 70, 31, 30.02, 960, 111, 57, 46,	30.04, 71, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, 23, 30.03, 1079, 111, 61, 41, 30.03, 363, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
        ('AZ Nationals', 80, 11, 29.91,	2820, NULL, 76, 15, 29.86, 2640, NULL, 78, 16, 29.92, 2717,	126, 83, 14, 29.84,	3138, 132, 80, 11, 29.91, 28, NULL, 80, 11, 29.88, 2857, 114,	80,	13,	29.9, 2844,	130, 83, 13, 29.83,	3155, 132),
        ('Winternationals', 67, 43,	29.91, 2123, 93,62,	55,	29.88, 1830, 80, 64, 51, 29.95,	1870, 107, 66, 50, 29.91, 2078, NULL, 66, 45, 29.91, 2029, 93, 62, 55, 29.88, 1858, 80, NULL, NULL, NULL, NULL, NULL, 66, 50, 29.91, 2078, 94),
        ('4-Wide Nationals (LV)', NULL, NULL, NULL, NULL, NULL, 94, 8, 29.81, 4797, 139, 87, 11, 29.73, 4516, NULL, 91, 9, 29.68, 4765, NULL, 90, 9, 29.91, 4475, NULL, 94, 8, 29.81, 4797, 139, 87, 11, 29.73, 4516, NULL, 91, 9, 29.68, 4765, NULL),
        ('American Rebel Light 4-Wide Nationals (NC)', 78, 56, 30.08, 2390, NULL, 73, 66, 30.06, 2171, 90, 77, 58, 30.02, 2344, NULL, NULL, NULL, NULL, NULL, NULL, 78, 56, 30.08, 2390, NULL, 73, 66, 30.06, 2171, 90, 77, 58, 30.02, 2344, 116, 80, 53, 29.96, 2640, NULL),
        ('Route 66 Nationals', NULL, NULL, NULL, NULL, NULL, 80, 35, 29.38, 3113, NULL, 60, 57, 29.70, 1407, 83, 66, 46, 29.70, 1809, 99, 83, 29, 29.47, 3120, 124, 83, 30, 29.40, 3209, NULL, 60, 57, 29.70, 1407, 83, 66, 46, 29.70, 1809, 99),
        ('Thunder Valley Nationals', 84, 56, 28.37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, 73, 27.66, NULL, NULL, 77, 61, 27.62, NULL, NULL, 84, 58, 28.37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, 74, 28.30, NULL, NULL, 79, 66, 28.29, NULL, NULL),
        ('Virginia Nationals', 85, 59, 30.16, 2374, 129, 88, 48, 30.13, 2538, 140, 89, 50, 30.11, 2649, 142, NULL, NULL, NULL, NULL, NULL, 85, 59, 30.16, 2374, 129, 88, 48, 30.13, 2538, 140, 89, 50, 30.11, 2649, 142, NULL, NULL, NULL, NULL, NULL),
        ('Summit Nationals'),
        ('Northwest Nationals',),
        ('Sonoma Nationals',),
        ('Lucas Oil Nationals',),
        ('U.S. Nationals',),
        ('Reading Nationals',),
        ('4-Wide Carolina Nationals',),
        ('Midwest Nationals',),
        ('Texas FallNationals',),
        ('Nevada Nationals', 82, 15, 29.91, 4002, 138, 82, 18, 30.12, 3932, 138, 76, 22, 30.04, 3398, 100, 76, 22),
        ('In-n-Out Burger NHRA Finals',),*/


  /*  CREATE TABLE Pro_Stock_And_Pro_Stock_Motorcycle_2025(
    Events VARCHAR(100) NOT NULL,
    PS_Q1_Temperature INT,
    PS_Q1_Rel_Humidity INT,
    PS_Q1_Barometric_Pressure Float,
    PS_Q1_Adjusted_Altitude INT,
    PS_Q2_Temperature INT,
    PS_Q2_Rel_Humidity INT,
    PS_Q2_Barometric_Pressure Float,
    PS_Q2_Adjusted_Altitude INT,
    PS_Q3_Temperature INT,
    PS_Q3_Rel_Humidity INT,
    PS_Q3_Barometric_Pressure Float,
    PS_Q3_Adjusted_Altitude INT,
    PS_Q4_Temperature INT,
    PS_Q4_Rel_Humidity INT,
    PS_Q4_Barometric_Pressure Float,
    PS_Q4_Adjusted_Altitude INT,
    PSM_Q1_Temperature INT,
    PSM_Q1_Rel_Humidity INT,
    PSM_Q1_Barometric_Pressure Float,
    PSM_Q1_Adjusted_Altitude INT,
    PSM_Q2_Temperature INT,
    PSM_Q2_Rel_Humidity INT,
    PSM_Q2_Barometric_Pressure Float,
    PSM_Q2_Adjusted_Altitude INT,
    PSM_Q3_Temperature INT,
    PSM_Q3_Rel_Humidity INT,
    PSM_Q3_Barometric_Pressure Float,
    PSM_Q3_Adjusted_Altitude INT,
    PSM_Q4_Temperature INT,
    PSM_Q4_Rel_Humidity INT,
    PSM_Q4_Barometric_Pressure Float,
    PSM_Q4_Adjusted_Altitude INT,
    INDY_PS_Q5_Temperature INT,
    INDY_PS_Q5_Rel_Humidity INT,
    INDY_PS_Q5_Barometric_Pressure FLOAT,
    INDY_PS_Q5_Adjusted_Altitude INT,
    INDY_PSM_Q5_Temperature INT,
    INDY_PSM_Q5_Rel_Humidity INT,
    INDY_PSM_Q5_Barometric_Pressure FLOAT,
    INDY_PSM_Q5_Adjusted_Altitude INT
    )
   */



--TRUNCATE TABLE Nitro_2025

--New columns 'Event' and 'Event Number' added through use of SSMS as data source did not include event names or event numbers in utilized text.
-- Pro classes season finale 2nd event at Pomona canceled due to weather.
/* Common Table Expression (CTE) used to create temporary table that will be utilized for inserting data into Events column.
Opening semicolon is needed to terminate previous code, as CTE statement must be first in code block.
SELECT/UNION ALL commands necessary due to INSERT dysfunction in CTEs.
 */

 ;WITH eventList (eventNumber, eventName) As (
    SELECT 1, 'Gainesville' UNION ALL
    SELECT 2, 'Phoenix' UNION ALL
    SELECT 3, 'Pomona' UNION ALL
    SELECT 4, 'Las Vegas 1' UNION ALL
    SELECT 5, 'Charlotte 1' UNION ALL
    SELECT 6, 'Chicago' UNION ALL
    SELECT 7, 'Epping' UNION ALL
    SELECT 8, 'Bristol' UNION ALL
    SELECT 9,'Richmond' UNION ALL
    SELECT 10, 'Norwalk' UNION ALL
    SELECT 11, 'Seattle' UNION ALL
    SELECT 12, 'Sonoma' UNION ALL
    SELECT 13, 'Brainerd' UNION ALL
    SELECT 14, 'Indy' UNION ALL
    SELECT 15, 'Reading' UNION ALL
    SELECT 16, 'Charlotte 2' UNION ALL
    SELECT 17, 'St. Louis' UNION ALL
    SELECT 18, 'Dallas' UNION ALL
    SELECT 19, 'Las Vegas 2'
),

numberedTargets AS (
    SELECT Event_Number, Events,
            ROW_NUMBER() OVER (ORDER BY(SELECT NULL)) as rowNum
    From Nitro_2025
    WHERE Event_Number IS NULL AND Events IS NULL
    )

UPDATE t
SET t.Event_Number = e.eventNumber,
    t.Events = e.eventName
FROM numberedTargets t
JOIN eventList e ON t.rowNUM = e.eventNumber;

UPDATE Nitro_2025
SET
    FC_Q1_Track_Temperature = 111,
    FC_Q2_Track_Temperature = 83,
    TF_Q1_Track_Temperature = 111,
    TF_Q2_Track_Temperature = 83
WHERE Event_Number =  1;

UPDATE Nitro_2025
SET
    FC_Q1_Track_Temperature = 130,
    FC_Q2_Track_Temperature = 114,
    TF_Q1_Track_Temperature = 130,
    TF_Q2_Track_Temperature = 114
WHERE Event_Number =  2;

UPDATE Nitro_2025
SET
    TF_Q4_Track_Temperature = 94
WHERE Event_Number = 3;

UPDATE Nitro_2025
SET
    FC_Q1_Track_Temperature = 138
WHERE Event_Number = 19

UPDATE Nitro_2025
SET
    FC_Q2_Track_Temperature =
WHERE Event_Number = 19

SELECT * FROM Nitro_2025



