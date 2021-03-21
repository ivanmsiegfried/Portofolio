data_df = LOAD '/user/maria_dev/ml-100k/u.data' AS (userid:int, itemid:int, rating:int, timestamp:int);

item_df = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') AS (movieid:int, movietitle:chararray);

grouping_data = GROUP data_df BY itemid;

most_popular_movies = FOREACH grouping_data GENERATE group AS itemid, COUNT(data_df.rating);

DUMP most_popular_movies;