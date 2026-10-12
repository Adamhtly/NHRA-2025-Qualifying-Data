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


/* Majority of values sourced from relevant child-pages at https://www.nhra.com/results/2025/nhra-mission-foods-drag-racing-series.
   Where necessary due to absence of weather information at qualifying results pages, some values obtained from recorded livestreams at nhra.tv (subscription required).
   In instances where weather data was not provided at either of the above sources, relevant historical track-based weather information acquired from https://airdensityonline.com/tracks/ (free account required).
 */

--New columns 'Event' and 'Event Number' added through use of SSMS as data source did not include event names or event numbers in utilized text.
-- Pro classes season finale 2nd event at Pomona canceled due to weather.
/* Common Table Expression (CTE) used to create temporary table that will be utilized for inserting data into Events column.
Opening semicolon is needed to terminate previous code, as CTE statement must be first in code block.
SELECT/UNION ALL commands necessary due to INSERT dysfunction in CTEs.
 */


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

