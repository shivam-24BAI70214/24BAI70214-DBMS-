--- IF–ELSE Statement ---
DECLARE
    num INTEGER := 5;
BEGIN
    IF num > 0 THEN
        RAISE NOTICE 'The number % is Positive', num;
    ELSE
        RAISE NOTICE 'The number % is Non-Positive', num;
    END IF;
END;

--- IF–ELSIF–ELSE Statement ---
DECLARE
    marks INTEGER := 82;
BEGIN
    IF marks >= 90 THEN
        RAISE NOTICE 'Grade: A';
    ELSIF marks >= 75 THEN
        RAISE NOTICE 'Grade: B';
    ELSIF marks >= 60 THEN
        RAISE NOTICE 'Grade: C';
    ELSE
        RAISE NOTICE 'Grade: Fail';
    END IF;
END;

--- ELSIF Ladder ---
DECLARE
    marks INTEGER := 68;
BEGIN
    IF marks >= 85 THEN
        RAISE NOTICE 'Performance: Excellent';
    ELSIF marks >= 70 THEN
        RAISE NOTICE 'Performance: Very Good';
    ELSIF marks >= 55 THEN
        RAISE NOTICE 'Performance: Good';
    ELSIF marks >= 40 THEN
        RAISE NOTICE 'Performance: Average';
    ELSE
        RAISE NOTICE 'Performance: Poor';
    END IF;
END;

--- CASE Statement ---
DECLARE
    day_no INTEGER := 3;
    day_name TEXT;
BEGIN
    day_name := CASE day_no
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
        ELSE 'Invalid Day Number'
    END;

    RAISE NOTICE 'Day: %', day_name;
END;
