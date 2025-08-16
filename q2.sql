DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    -- return all shows with watch time for given subscriber
    SELECT s.Title, w.WatchTime
    FROM WatchHistory w
    JOIN Shows s ON w.ShowID = s.ShowID
    WHERE w.SubscriberID = sub_id;
END $$

DELIMITER ;
