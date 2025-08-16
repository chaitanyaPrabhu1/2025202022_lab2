DELIMITER $$

CREATE PROCEDURE PrintAllWatchHistory()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_id INT;
    DECLARE s_name VARCHAR(100);

    -- cursor to go through all subscribers
    DECLARE cur CURSOR FOR 
        SELECT SubscriberID, SubscriberName FROM Subscribers;

    -- handler when no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    subscriber_loop: LOOP
        FETCH cur INTO s_id, s_name;
        IF done = 1 THEN 
            LEAVE subscriber_loop;
        END IF;

        -- print subscriber name first
        SELECT CONCAT('Watch history for: ', s_name) AS ReportHeader;

        -- now call existing procedure to show their history
        CALL GetWatchHistoryBySubscriber(s_id);
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;
