DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_name VARCHAR(100);

    -- cursor to loop over subscriber names
    DECLARE sub_cursor CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;

    -- what to do when no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN sub_cursor;

    read_loop: LOOP
        FETCH sub_cursor INTO s_name;
        IF done = 1 THEN 
            LEAVE read_loop;
        END IF;
        
        -- show the name
        SELECT s_name AS Subscriber;
    END LOOP;

    CLOSE sub_cursor;
END $$

DELIMITER ;
