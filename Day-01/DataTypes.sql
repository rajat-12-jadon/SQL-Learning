-- =====================================================
-- File: 02_Data_Types.sql
-- Topic: PostgreSQL Data Types
-- Description: Demonstrates commonly used SQL data types.
-- =====================================================


-- Remove table if it already exists
DROP TABLE IF EXISTS data_types_demo;


-- =====================================================
-- Create Table
-- Demonstrates Different PostgreSQL Data Types
-- =====================================================

CREATE TABLE data_types_demo (

    -- Numeric Data Types
    id SERIAL PRIMARY KEY,
    age SMALLINT,
    salary INTEGER,
    population BIGINT,
    cgpa NUMERIC(3,2),
    price DECIMAL(10,2),
    percentage REAL,
    rating DOUBLE PRECISION,

    -- Character Data Types
    first_name VARCHAR(50),
    middle_initial CHAR(1),
    description TEXT,

    -- Boolean Data Type
    is_active BOOLEAN,

    -- Date & Time Data Types
    birth_date DATE,
    login_time TIME,
    created_at TIMESTAMP,
    updated_at TIMESTAMPTZ,

    -- UUID Data Type
    user_uuid UUID,

    -- JSON Data Type
    user_details JSON,

    -- Binary Data
    profile_image BYTEA
);


-- =====================================================
-- Insert Sample Record
-- =====================================================

INSERT INTO data_types_demo
(
    age,
    salary,
    population,
    cgpa,
    price,
    percentage,
    rating,
    first_name,
    middle_initial,
    description,
    is_active,
    birth_date,
    login_time,
    created_at,
    updated_at,
    user_uuid,
    user_details
)
VALUES
(
    23,
    600000,
    1450000000,
    8.75,
    49999.99,
    91.5,
    4.8,
    'Rajat',
    'J',
    'Learning PostgreSQL Data Types',
    TRUE,
    '2003-08-15',
    '10:30:00',
    NOW(),
    NOW(),
    '550e8400-e29b-41d4-a716-446655440000',
    '{"city":"Agra","course":"B.Tech CSE"}'
);


-- =====================================================
-- View Data
-- =====================================================

SELECT *
FROM data_types_demo;


-- =====================================================
-- Data Types Explained
-- =====================================================

-- SMALLINT          : Small integer (-32,768 to 32,767)
-- INTEGER / INT     : Standard integer
-- BIGINT            : Very large integer
-- SERIAL            : Auto-increment integer
-- NUMERIC(p,s)      : Exact decimal values
-- DECIMAL(p,s)      : Same as NUMERIC
-- REAL              : Single precision floating point
-- DOUBLE PRECISION  : Double precision floating point

-- CHAR(n)           : Fixed-length string
-- VARCHAR(n)        : Variable-length string
-- TEXT              : Unlimited length text

-- BOOLEAN           : TRUE / FALSE

-- DATE              : Stores only date
-- TIME              : Stores only time
-- TIMESTAMP         : Date and time
-- TIMESTAMPTZ       : Timestamp with timezone

-- UUID              : Universally Unique Identifier

-- JSON              : JSON formatted data

-- BYTEA             : Binary data (images, files, etc.)