data_df = LOAD '/user/maria_dev/ml-100k/u.data' AS (userid:int, itemid:int, rating:int, timing:int);

item_df = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') AS (movieid:int, movietitle:chararray);

grouping_data = GROUP data_df BY itemid;

ratingPerMovieid = FOREACH grouping_data GENERATE group AS itemid, AVG(data_df.rating) AS avgRating;

fivestar= FILTER ratingPerMovieid BY avgRating>4.5;

fivestarwithtitle = JOIN fivestar BY itemid, item_df by movieid;

ordered = ORDER fivestarwithtitle BY avgRating DESC;

DUMP ordered;