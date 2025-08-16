This folder has 5 SQL procedures that we wrote for the assignment.\
Below is how to run them and what each does.

Before running, make sure: 1. You have created the database and tables
(Shows, Subscribers, WatchHistory). 2. Inserted the sample data (so we
actually get results). 3. Switch to the correct database using: USE
your_db_name;

------------------------------------------------------------------------

### 1) ListAllSubscribers()

-   Shows all subscriber names using a cursor.
-   To run: `CALL ListAllSubscribers();`

### 2) GetWatchHistoryBySubscriber(IN sub_id INT)

-   Takes a subscriber id and prints all shows they have watched with
    watch time.
-   To run (example for subscriber 1):
    `CALL GetWatchHistoryBySubscriber(1);`

### 3) AddSubscriberIfNotExists(IN subName VARCHAR(100))

-   Checks if a subscriber with that name exists.
-   If not, adds them with today's date.
-   To run: `CALL AddSubscriberIfNotExists('Alex Brown');`

### 4) SendWatchTimeReport()

-   Goes through all subscribers and calls GetWatchHistoryBySubscriber()
    but only for those who have actually watched something.
-   To run: `CALL SendWatchTimeReport();`

### 5) PrintAllWatchHistory()

-   Uses a cursor to loop through every subscriber.
-   Prints their name first, then calls GetWatchHistoryBySubscriber() to
    show their watch history.
-   To run: `CALL PrintAllWatchHistory();`

------------------------------------------------------------------------

That's it. Run each CALL one by one in Workbench and check the output.
