USE beverage_pref;

DROP TABLE IF EXISTS beverage_preferences; 

CREATE TABLE beverage_preferences(
	customer_id INT, 
    age_group VARCHAR(20),
    flavor VARCHAR(50), 
    sweetness INT, 
    tartness INT,
    rating DECIMAL(2,1),
    purchase_frequency VARCHAR(10)
);

#Import 'beverage_pref.csv' file from Excel. 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/beverage_pref.csv'
INTO TABLE beverage_preferences
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

#Which flavors are most frequently purchased?
SELECT flavor, COUNT(*) AS weekly_purchases
FROM beverage_preferences
WHERE purchase_frequency LIKE '%Weekly%'
GROUP BY flavor
ORDER BY weekly_purchases DESC;

#Do sweeter drinks recieve higher ratings?
SELECT sweetness, AVG(rating)
FROM beverage_preferences
GROUP BY sweetness
ORDER BY sweetness ASC;

#Which age group prefers tart flavors?
SELECT age_group, AVG(tartness) as avg_tart
FROM beverage_preferences
GROUP BY age_group
ORDER BY avg_tart ASC;

#Which flavors have the highest ratings?
SELECT flavor, AVG(rating) as avg_rating 
FROM beverage_preferences
GROUP BY flavor
ORDER BY avg_rating DESC;