CREATE table Student(sID number(5), sName varchar2(10), GPA number(3,1), sizeHS number(5));
INSERT INTO Student VALUES (123, 'Amy', 3.9, 1000);
INSERT INTO Student VALUES (234, 'Bob', 3.6, 1500);
INSERT INTO Student VALUES (345, 'Craig', 3.5, 500);
INSERT INTO Student VALUES (456, 'Doris', 3.9, 1000);
INSERT INTO Student VALUES (567, 'Edward', 2.9, 2000);
INSERT INTO Student VALUES (678, 'Fay', 3.8, 200);
INSERT INTO Student VALUES (789, 'Gary', 3.4, 800);
INSERT INTO Student VALUES (987, 'Helen', 3.7, 800);
INSERT INTO Student VALUES (876, 'Irene', 3.9, 400);
INSERT INTO Student VALUES (765, 'Jay', 2.9, 1500);
INSERT INTO Student VALUES (654, 'Amy', 3.9, 1000);
INSERT INTO Student VALUES (543, 'Craig', 3.4, 2000);

-- QUERY-1 
DECLARE 
  input   INT := 5; 
  fact    INT := 1; 
  counter INT := 1; 
BEGIN 
  WHILE counter <= input 
  LOOP 
    fact := fact       * counter; 
    counter := counter + 1; 
  END LOOP; 
  dbms_output.Put_line(fact); 
END;

-- QUERY-2 
DECLARE 
  input   INT := 17; 
  counter INT := 2; 
  flag    BOOLEAN := TRUE; 
BEGIN 
  WHILE counter <= sqrt(input) 
  LOOP 
    IF MOD(input, counter) = 0 THEN 
      flag := FALSE; 
    END IF; 
    counter := counter + 1; 
  END LOOP; 
  IF flag THEN 
    dbms_output.put_line('PRIME NUMBER'); 
  ELSE 
    dbms_output.put_line('NOT A PRIME NUMBER'); 
  END IF; 
END;

-- QUERY-3 
DECLARE 
  input   INT := 50; 
  counter INT := 1; 
  a       INT := 0; 
  b       INT := 1; 
  temp    INT; 
BEGIN 
  WHILE counter <= input 
  LOOP 
    dbms_output.put_line(a + b); 
    temp := a; 
    a := b; 
    b := temp          + b; 
    counter := counter + 1; 
  END LOOP; 
END;

-- QUERY-4 
DECLARE 
  gpa student.gpa%TYPE; 
  sname student.sname%TYPE; 
  CURSOR explict_cursor IS 
    SELECT sname, 
           gpa 
    FROM   student; 

BEGIN 
  OPEN explict_cursor; 
  LOOP 
    FETCH explict_cursor 
    INTO  sname, 
          gpa; 

    EXIT 
  WHEN explict_cursor%NOTFOUND; 
    dbms_output.put_line(sname 
    ||' ' 
    ||gpa); 
  END LOOP; 
  CLOSE explict_cursor; 
END;

-- QUERY-5 
DECLARE 
  gpa student.gpa%TYPE; 
  sname student.sname%TYPE; 
  grade CHAR(1); 
  CURSOR explict_cursor IS 
    SELECT sname, 
           gpa 
    FROM   student; 

BEGIN 
  OPEN explict_cursor; 
  LOOP 
    FETCH explict_cursor 
    INTO  sname, 
          gpa; 

    EXIT 
  WHEN explict_cursor%NOTFOUND; 
    grade := 
    CASE 
    WHEN gpa>3.7 THEN 
      'A' 
    ELSE 
      'B' 
    END; 
    dbms_output.put_line(sname 
    ||' ' 
    ||gpa 
    ||' ' 
    ||grade); 
  END LOOP; 
  CLOSE explict_cursor; 
END; 
ALTER TABLE student ADD grades CHAR(1); 

UPDATE student 
SET    grades = 
       CASE 
              WHEN gpa > 3.7 THEN 'A' 
              ELSE 'B' 
       END 
WHERE  1 = 1; 

SELECT * 
FROM   student; 
