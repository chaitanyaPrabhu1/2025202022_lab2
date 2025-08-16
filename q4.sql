DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_id INT;

    -- cursor for all subscriber ids
    DECLARE cur CURSOR FOR 
        SELECT SubscriberID FROM Subscribers;

    -- when no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO s_id;
        IF done = 1 THEN 
            LEAVE read_loop;
        END IF;

        -- only call if subscriber has watch history
        IF (SELECT COUNT(*) FROM WatchHistory WHERE SubscriberID = s_id) > 0 THEN
            CALL GetWatchHistoryBySubscriber(s_id);
        END IF;
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;
