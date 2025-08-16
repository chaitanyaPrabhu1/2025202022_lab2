DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE cnt INT;

    -- check if subscriber already in table
    SELECT COUNT(*) INTO cnt
    FROM Subscribers
    WHERE SubscriberName = subName;

    -- if not found, insert new subscriber with today’s date
    IF cnt = 0 THEN
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate)
        VALUES (subName, CURDATE());
    END IF;
END $$

DELIMITER ;
