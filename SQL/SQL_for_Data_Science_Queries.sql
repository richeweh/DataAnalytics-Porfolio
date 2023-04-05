1. **Profile the data by finding the total number of records for each of the tables below:**

**Queries:** 

**Results**

```sql
SELECT COUNT (*)
FROM Attribute --,Business, Category, Checkin,............user
```

```markdown
**i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000**
```

---

1. **Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.**

**Queries**

```sql
SELECT COUNT (DISTINCT id)
FROM business--, review, photo, user
----
SELECT COUNT (DISTINCT business_id)
FROM hours--,category, attribute, checkin,
----
SELECT COUNT (DISTINCT user_id)
FROM tip--,elite_years, friend
```

**Results**

```markdown
**i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 537
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780**
```

---

**Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.**

1. **Are there any columns with null values in the Users table? Indicate "yes," or "no."**
    
    <aside>
    💡 **Answer: No**
    
    </aside>
    
    **SQL code used to arrive at answer:**
    
    ```sql
    SELECT 
        column_name,
        COUNT(*) AS row_count,
        SUM(CASE WHEN column_value IS NULL THEN 1 ELSE 0 END) AS null_count,
        SUM(CASE WHEN column_value = '' THEN 1 ELSE 0 END) AS empty_count,
        SUM(CASE WHEN column_value IS NOT NULL AND column_value <> '' THEN 1 ELSE 0 END) AS non_empty_count
    FROM 
        (
        SELECT 
            'id' AS column_name,
             id AS column_value
        FROM user
        UNION ALL
        SELECT 
            'name' AS column_name,
             name AS column_value
        FROM user
        UNION ALL
        SELECT 
            'review_count' AS column_name,
             review_count AS column_value
        FROM user
        UNION ALL
        SELECT 
            'yelping_since' AS column_name,
             yelping_since AS column_value
        FROM user
        UNION ALL
        SELECT 
            'useful' AS column_name,
             useful AS column_value
        FROM user
        UNION ALL
        SELECT 
            'funny' AS column_name,
             funny AS column_value
        FROM user
        UNION ALL
        SELECT 
            'cool' AS column_name,
             cool AS column_value
        FROM user
        UNION ALL
        SELECT 
            'fans' AS column_name,
             fans AS column_value
        FROM user
        UNION ALL
        SELECT 
            'average_stars' AS column_name,
             average_stars AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_hot' AS column_name,
             compliment_hot AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_more' AS column_name,
             compliment_more AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_profile' AS column_name,
             compliment_profile AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_cute' AS column_name,
             compliment_cute AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_list' AS column_name,
             compliment_list AS column_value
        FROM user
    
        UNION ALL
        SELECT 
            'compliment_note' AS column_name,
             compliment_note AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_plain' AS column_name,
             compliment_plain AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_cool' AS column_name,
             compliment_cool AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_funny' AS column_name,
             compliment_funny AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_writer' AS column_name,
             compliment_writer AS column_value
        FROM user
        UNION ALL
        SELECT 
            'compliment_photos' AS column_name,
             compliment_photos AS column_value
        FROM user
        ) rows
    GROUP BY column_name--1, column_name2
    ORDER BY column_name--1, column_name2
    ```
    
    ```sql
    **+--------------------+-----------+------------+-------------+-----------------+
    | column_name        | row_count | null_count | empty_count | non_empty_count |
    +--------------------+-----------+------------+-------------+-----------------+
    | average_stars      |     10000 |          0 |           0 |           10000 |
    | compliment_cool    |     10000 |          0 |           0 |           10000 |
    | compliment_cute    |     10000 |          0 |           0 |           10000 |
    | compliment_funny   |     10000 |          0 |           0 |           10000 |
    | compliment_hot     |     10000 |          0 |           0 |           10000 |
    | compliment_list    |     10000 |          0 |           0 |           10000 |
    | compliment_more    |     10000 |          0 |           0 |           10000 |
    | compliment_note    |     10000 |          0 |           0 |           10000 |
    | compliment_photos  |     10000 |          0 |           0 |           10000 |
    | compliment_plain   |     10000 |          0 |           0 |           10000 |
    | compliment_profile |     10000 |          0 |           0 |           10000 |
    | compliment_writer  |     10000 |          0 |           0 |           10000 |
    | cool               |     10000 |          0 |           0 |           10000 |
    | fans               |     10000 |          0 |           0 |           10000 |
    | funny              |     10000 |          0 |           0 |           10000 |
    | id                 |     10000 |          0 |           0 |           10000 |
    | name               |     10000 |          0 |           6 |            9994 |
    | review_count       |     10000 |          0 |           0 |           10000 |
    | useful             |     10000 |          0 |           0 |           10000 |
    | yelping_since      |     10000 |          0 |           0 |           10000 |
    +--------------------+-----------+------------+-------------+-----------------+**
    ```
    
    ---
    
2. **For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:**
    
    **i. Table: Review, Column: Stars**
    
    ```sql
    SELECT MIN(stars), MAX(stars), AVG(stars)
    FROM review
    
    **min:		max:		avg:
    	1      5      3.70**
    ```
    
    **ii. Table: Business, Column: Stars**
    
    ```sql
    SELECT MIN(stars), MAX(stars), AVG(stars)
    FROM business
    
    **min:		max:		avg:
    	1      5      3.65**
    ```
    
    **iii. Table: Tip, Column: Likes**
    
    ```sql
    SELECT MIN(likes), MAX(likes), AVG(likes)
    FROM tip 
    
    **min:		max:		avg:
    	0      2      0.01**
    ```
    
    **iv. Table: Checkin, Column: Count**
    
    ```sql
    SELECT MIN(count), MAX(count), AVG(count)
    FROM checkin 
    
    **min:		max:		avg:
    	1      53     1.94**
    ```
    
    **v. Table: User, Column: Review_count**
    
    ```sql
    SELECT MIN(review_count), MAX(review_count), AVG(review_count)
    FROM user
    
    **min:		max:		avg:
     0      2000    24.39**
    ```
    
    ---
    

1. **List the cities with the most reviews in descending order:**
    
    
    **SQL code used to arrive at answer:**
    
    ```sql
    SELECT city AS City, SUM(review_count) AS TotalReviews
    FROM business 
    GROUP BY 1
    ORDER BY 2 DESC
    ```
    
    **Copy and Paste the Result Below:**
    
    ```sql
    **+-----------------+--------------+
    | City            | TotalReviews |
    +-----------------+--------------+
    | Las Vegas       |        82854 |
    | Phoenix         |        34503 |
    | Toronto         |        24113 |
    | Scottsdale      |        20614 |
    | Charlotte       |        12523 |
    | Henderson       |        10871 |
    | Tempe           |        10504 |
    | Pittsburgh      |         9798 |
    | Montréal        |         9448 |
    | Chandler        |         8112 |
    | Mesa            |         6875 |
    | Gilbert         |         6380 |
    | Cleveland       |         5593 |
    | Madison         |         5265 |
    | Glendale        |         4406 |
    | Mississauga     |         3814 |
    | Edinburgh       |         2792 |
    | Peoria          |         2624 |
    | North Las Vegas |         2438 |
    | Markham         |         2352 |
    | Champaign       |         2029 |
    | Stuttgart       |         1849 |
    | Surprise        |         1520 |
    | Lakewood        |         1465 |
    | Goodyear        |         1155 |
    +-----------------+--------------+
    (Output limit exceeded, 25 of 362 total rows shown)**
    ```
    

---

1. **Find the distribution of star ratings to the business in the following cities:**
    
    **i. Avon**
    
    **SQL code used to arrive at answer:**
    
    ```sql
    SELECT stars, COUNT(stars) AS StarCount
    FROM business
    WHERE city = 'Avon'
    GROUP BY 1 
    ORDER BY 2 DESC
    ```
    
    **Copy and Paste the Resulting Table Below (2 columns – star rating and count):**
    
    ```markdown
    **+-------+-----------+
    | stars | StarCount |
    +-------+-----------+
    |   3.5 |         3 |
    |   2.5 |         2 |
    |   4.0 |         2 |
    |   1.5 |         1 |
    |   4.5 |         1 |
    |   5.0 |         1 |
    +-------+-----------+**
    ```
    
    ---
    
    **ii. Beachwood**
    
    **SQL code used to arrive at answer:**
    
    ```sql
    SELECT stars, COUNT(stars) AS StarCount
    FROM business
    WHERE city = 'Beachwood'
    GROUP BY 1 
    ORDER BY 2 DESC
    ```
    
    **Copy and Paste the Resulting Table Below (2 columns – star rating and count):**
    
    ```sql
    **+-------+-----------+
    | stars | StarCount |
    +-------+-----------+
    |   5.0 |         5 |
    |   3.0 |         2 |
    |   3.5 |         2 |
    |   4.5 |         2 |
    |   2.0 |         1 |
    |   2.5 |         1 |
    |   4.0 |         1 |
    +-------+-----------+**
    ```
    

---

1. **Find the top 3 users based on their total number of reviews:**
    
    
    **SQL code used to arrive at answer:**
    
    ```sql
    SELECT name, review_count
    FROM user
    ORDER BY 2 DESC
    LIMIT 3
    ```
    
    **Copy and Paste the Result Below:**
    
    ```markdown
    **+--------+--------------+
    | name   | review_count |
    +--------+--------------+
    | Gerald |         2000 |
    | Sara   |         1629 |
    | Yuri   |         1339 |
    +--------+--------------+**
    ```
    

---

1. **Does posing more reviews correlate with more fans?**
    
    **No. The number of reviews posted does not correlate with having more fans. For example, there are people like `Mimi` who have more reviews (968) than `Amy` (609) but have fewer fans (497 vs 503). Similarly, `William` has more reviews (1215) but fewer fans (126) compared to `Cat` who has 377 reviews and 133 fans. Therefore, there is no noticeable correlation between having more reviews and having more fans.**
    
    **Please explain your findings and interpretation of the results:**
    
    ```sql
    SELECT name, review_count, fans
    FROM user
    --GROUP BY 1,2
    ORDER BY 3 DESC
    --LIMIT 3
    ```
    
    **Results**
    
    ```markdown
    **+-----------+--------------+------+
    | name      | review_count | fans |
    +-----------+--------------+------+
    | Amy       |          609 |  503 |
    | Mimi      |          968 |  497 |
    | Harald    |         1153 |  311 |
    | Gerald    |         2000 |  253 |
    | Christine |          930 |  173 |
    | Lisa      |          813 |  159 |
    | Cat       |          377 |  133 |
    | William   |         1215 |  126 |
    | Fran      |          862 |  124 |
    | Lissa     |          834 |  120 |
    | Mark      |          861 |  115 |
    | Tiffany   |          408 |  111 |
    | bernice   |          255 |  105 |
    | Roanna    |         1039 |  104 |
    | Angela    |          694 |  101 |
    | .Hon      |         1246 |  101 |
    | Ben       |          307 |   96 |
    | Linda     |          584 |   89 |
    | Christina |          842 |   85 |
    | Jessica   |          220 |   84 |
    | Greg      |          408 |   81 |
    | Nieves    |          178 |   80 |
    | Sui       |          754 |   78 |
    | Yuri      |         1339 |   76 |
    | Nicole    |          161 |   73 |
    +-----------+--------------+------+
    (Output limit exceeded, 25 of 10000 total rows shown)**
    ```
    
    ---
    
2. **Are there more reviews with the word "love" or with the word "hate" in them?**
    
    **Answer: Yes. There are more reviews with the word `‘love’` (1780) than `‘hate’` (232)**
    
    SQL code used to arrive at answer:
    
    ```sql
    SELECT
        COUNT(CASE WHEN text LIKE '%love%' THEN 1 END ) AS love,
        COUNT(CASE WHEN text LIKE '%hate%' THEN 1 END ) AS hate
    FROM review
    --GROUP BY 1
    ```
    

---

1. **Find the top 10 users with the most fans:**

**SQL code used to arrive at answer:**

```sql
SELECT id, name, fans
FROM user
ORDER BY 3 DESC 
LIMIT 10
```

**Copy and Paste the Result Below:**

```markdown
**+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+**
```

---

## Part 2: Inferences and Analysis

1. **Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.**

**SQL code used for analysis:**

```sql
SELECT
    CASE 
    WHEN b.stars BETWEEN 2 AND 3 THEN '2-3 Stars'
    WHEN b.stars BETWEEN 4 AND 5 THEN '4-5 Stars'
    END AS ratings,
           b.name,
           c.category, 
           b.stars, 
           h.hours
FROM business b
JOIN category c ON b.id = c.business_id
JOIN hours h ON b.id = h.business_id
WHERE b.city = 'Las Vegas' --
AND c.category = 'Restaurants'
--AND (stars BETWEEN 
ORDER BY stars ASC
```

**Results**

```markdown
**+-----------+---------------------+-------------+-------+-----------------------+
| ratings   | name                | category    | stars | hours                 |
+-----------+---------------------+-------------+-------+-----------------------+
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Monday|11:00-0:00     |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Tuesday|11:00-0:00    |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Friday|11:00-0:00     |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Wednesday|11:00-0:00  |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Thursday|11:00-0:00   |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Sunday|11:00-0:00     |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 | Saturday|11:00-0:00   |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Monday|11:00-20:00    |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Tuesday|11:00-20:00   |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Friday|11:00-20:00    |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Wednesday|11:00-20:00 |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Thursday|11:00-20:00  |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Sunday|8:00-14:00     |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 | Saturday|11:00-20:00  |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Monday|10:00-23:00    |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Tuesday|10:00-23:00   |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Friday|10:00-23:00    |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Wednesday|10:00-23:00 |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Thursday|10:00-23:00  |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Sunday|10:00-23:00    |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 | Saturday|10:00-23:00  |
+-----------+---------------------+-------------+-------+-----------------------+**
```

---

**i. Do the two groups you chose to analyze have a different distribution of hours?**

**I chose Las Vegas as my city, and the `'Restaurants'` as the category. Based on these criteria, there is a distribution of hours between the restaurants and the rating.
The only business `(Wingstop)` which qualifies within the 2-3 ratings group, operate between 11:00am - 12:00am (midnight) or 13 hours. While in the 4-5 ratings group the two restaurants `(Jacques Cafe and Big Wong Restaurant)` operate between 11:00am - 8pm and 10:00am - 11:00pm respectively. The overall range within the data set is as follows:**

```markdown
MIN hour: 8am
MAX hour: 12am (midnight)
AVG hours: 11.13 hours
```

---

**ii. Do the two groups you chose to analyze have a different number of reviews?**

**Yes, each restaurant group has a different number of reviews. Wingstop has 123, Jacques Cafe has 168 and Big Wong has 768.**

```sql
SELECT
    CASE 
    WHEN b.stars BETWEEN 2 AND 3 THEN '2-3 Stars'
    WHEN b.stars BETWEEN 4 AND 5 THEN '4-5 Stars'
    END AS ratings,
           b.name,
           c.category, 
           b.stars,
           b.review_count,
           h.hours
FROM business b
JOIN category c ON b.id = c.business_id
JOIN hours h ON b.id = h.business_id
WHERE b.city = 'Las Vegas' --
AND c.category = 'Restaurants'
--AND (stars BETWEEN 
ORDER BY stars ASC
```

```markdown
**+-----------+---------------------+-------------+-------+--------------+-----------------------+
| ratings   | name                | category    | stars | review_count | hours                 |
+-----------+---------------------+-------------+-------+--------------+-----------------------+
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Monday|11:00-0:00     |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Tuesday|11:00-0:00    |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Friday|11:00-0:00     |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Wednesday|11:00-0:00  |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Thursday|11:00-0:00   |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Sunday|11:00-0:00     |
| 2-3 Stars | Wingstop            | Restaurants |   3.0 |          123 | Saturday|11:00-0:00   |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Monday|11:00-20:00    |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Tuesday|11:00-20:00   |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Friday|11:00-20:00    |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Wednesday|11:00-20:00 |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Thursday|11:00-20:00  |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Sunday|8:00-14:00     |
| 4-5 Stars | Jacques Cafe        | Restaurants |   4.0 |          168 | Saturday|11:00-20:00  |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Monday|10:00-23:00    |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Tuesday|10:00-23:00   |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Friday|10:00-23:00    |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Wednesday|10:00-23:00 |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Thursday|10:00-23:00  |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Sunday|10:00-23:00    |
| 4-5 Stars | Big Wong Restaurant | Restaurants |   4.0 |          768 | Saturday|10:00-23:00  |
+-----------+---------------------+-------------+-------+--------------+-----------------------+**
```

---

**iii. Are you able to infer anything from the location data provided between these two groups? Explain.**

**What stood out to me the most is that restaurants in this particular location `(Las Vegas)` usually operate from pre-noon (12pm) and midnight. Excluding Sunday for `Jacques Cafe`, all restaurants involve operate for 9-13 hours on throughout the week (weekdays and weekends included). Lastly, my final inferrence is that the operational cut-off time is Midnight. No restaurant business in `Las Vegas` in open after midnight.**  

1. **Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.**
    
    **i. Difference 1:** 
    **`‘Open’` businesses (3.67) have a slightly higher average number of stars  than `‘Closed’` businesses (3.52). And `‘Open’` businesses (31.75) also have much average number of reviews compared to `‘Closed’` businesses (23.19).**
    

**ii. Difference 2:** 

**`‘Open’` businesses have at least 5x the number reviews (3873) than `‘Closed’` business (700)**

---

**SQL code used for analysis:**

```sql
SELECT
      CASE WHEN is_open = 1 THEN  'Open' ELSE 'Closed' END AS Status, 
      AVG(stars), AVG(review_count),
      MIN(stars), MAX(stars),
      MIN(review_count), MAX(review_count), 
      stars, 
      review_count
FROM business 
GROUP BY 1
```

```markdown
**+--------+---------------+-------------------+------------+------------+-------------------+-------------------+-------+--------------+
| Status |    AVG(stars) | AVG(review_count) | MIN(stars) | MAX(stars) | MIN(review_count) | MAX(review_count) | stars | review_count |
+--------+---------------+-------------------+------------+------------+-------------------+-------------------+-------+--------------+
| Closed | 3.52039473684 |     23.1980263158 |        1.0 |        5.0 |                 3 |               700 |   4.0 |          700 |
| Open   | 3.67900943396 |     31.7570754717 |        1.0 |        5.0 |                 3 |              3873 |   3.5 |         3873 |
+--------+---------------+-------------------+------------+------------+-------------------+-------------------+-------+--------------+**
```

---

1. **For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.**

**Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:**

**i. Indicate the type of analysis you chose to do:**

**I'll perform a basic sentiment analysis based on the review text for each business and then group is by city (to simplify the results). I used CASE conditions to count the number of 'Good' vs 'Bad' types of words such as "great", "nasty", "perfect" etc. I then grouped these by city to assign each the city a sentiment score based on the logic above.**

**ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:**

**I chose this analysis because I was inspired by an earlier exercise in this same course. I wanted to expand the analysis to include more words and logic. I also wanted to gauge what customers were saying in the reviews. In order to perform this analysis, I needed the `Business` and `Reviews (text)` data.**

**iii. Output of your finished dataset:**

```markdown
**+---------------+----------------------+-------------+-----------------+
| Business_City | Number_of_Businesses | Avrg_Rating | Sentiment_Score |
+---------------+----------------------+-------------+-----------------+
| Ahwatukee     |                    1 |         3.5 |               0 |
| Ajax          |                    1 |         4.5 |               0 |
| Allison Park  |                    1 |         3.0 |               1 |
| Aurora        |                    1 |         3.5 |               1 |
| Avondale      |                    2 |         4.5 |               2 |
| Beachwood     |                    1 |         4.0 |               1 |
| Berea         |                    1 |         4.0 |               0 |
| Boulder City  |                    1 |         3.0 |               1 |
| Brampton      |                    1 |         1.5 |               0 |
| Burton        |                    1 |         5.0 |               1 |
| Cave Creek    |                    4 |        4.13 |               3 |
| Champaign     |                    4 |         4.0 |               2 |
| Chandler      |                   22 |        3.66 |              16 |
| Charlotte     |                   21 |        3.33 |              15 |
| Cleveland     |                   12 |        3.96 |               6 |
| Concord       |                    2 |        3.75 |               1 |
| Cornelius     |                    1 |         4.0 |               0 |
| Davidson      |                    1 |         3.5 |               1 |
| East York     |                    1 |         4.0 |               0 |
| Edinburgh     |                    5 |         3.7 |               4 |
| Enterprise    |                    1 |         3.0 |               1 |
| Etobicoke     |                    1 |         3.0 |               0 |
| Fort Mill     |                    1 |         4.5 |               1 |
| Gilbert       |                   13 |        3.92 |              12 |
| Glendale      |                    5 |         3.6 |               2 |
+---------------+----------------------+-------------+-----------------+
(Output limit exceeded, 25 of 67 total rows shown)**
```

**iv. Provide the SQL code you used to create your final dataset:**

```sql
/* SELECT DISTINCT b.id, b.stars, b.review_count,LENGTH(r.text), TRIM(r.text)--, ch.count
FROM business b
JOIN review r
ON b.id = r.business_id
WHERE LENGTH(r.text)< 250
--GROUP BY 2
*/

SELECT b.city AS Business_City,COUNT(b.id) AS Number_of_Businesses, ROUND(AVG(b.stars),2) AS Avrg_Rating,--b.stars,--,b.id, b.stars,  --LENGTH(r.text), TRIM(r.text)--, ch.count
    COUNT (CASE 
            WHEN r.text LIKE '%great%' THEN 1 
            WHEN r.text LIKE '%love%' THEN 1
            WHEN r.text LIKE '%lovely%' THEN 1
            WHEN r.text LIKE '%loved%' THEN 1
            WHEN r.text LIKE '%favorite%' THEN 1
            WHEN r.text LIKE '%awesome%' THEN 1
            WHEN r.text LIKE '%kickass%' THEN 1
            WHEN r.text LIKE '%fun%' THEN 1
            WHEN r.text LIKE '%enjoyed%' THEN 1
            WHEN r.text LIKE 'the best%' THEN 1
            WHEN r.text LIKE '%recommended%' THEN 1
            WHEN r.text LIKE '%recommend%' THEN 1
            WHEN r.text LIKE '%outstanding%' THEN 1
            WHEN r.text LIKE '%fantastic%' THEN 1
            WHEN r.text LIKE '%happy%' THEN 1
            WHEN r.text LIKE '%wow%' THEN 1
            WHEN r.text LIKE '%perfect%' THEN 1
            WHEN r.text LIKE '%beautiful%' THEN 1
            WHEN r.text LIKE '%thanks!' THEN 1
            WHEN r.text LIKE '%thank you!' THEN 1
            WHEN r.text LIKE '%bad' THEN -1 
            WHEN r.text LIKE '%not good%' THEN -1
            WHEN r.text LIKE '%hate%' THEN -1
            WHEN r.text LIKE '%not good%' THEN -1
            WHEN r.text LIKE '%did not like%' THEN -1
            WHEN r.text LIKE '%not fun%' THEN -1
            WHEN r.text LIKE '%not the best%' THEN -1
            WHEN r.text LIKE '%awful%' THEN -1
            WHEN r.text LIKE '%poor%' THEN -1
            WHEN r.text LIKE '%not happy%' THEN -1
            WHEN r.text LIKE '%digusting%' THEN -1
            WHEN r.text LIKE '%ugly%' THEN -1
            WHEN r.text LIKE '%nasty%' THEN -1
            WHEN r.text LIKE '%bland%' THEN -1
            WHEN r.text LIKE '%empty%' THEN -1
            WHEN r.text LIKE '%mild%' THEN -1
            WHEN r.text LIKE '%annoying%' THEN -1
            WHEN r.text LIKE '%slow%' THEN -1
            END) AS Sentiment_Score
FROM business b
JOIN review r
ON b.id = r.business_id
GROUP BY 1
--WHERE LENGTH(r.text)< 250
```

**I modified my original code to wrap it in a CTE (although SQLLite in Coursera doesn’t support it) to include**

```sql
WITH SentimentData AS (
		SELECT b.city AS Business_City,
					 COUNT(b.id) AS Number_of_Businesses, 
					 ROUND(AVG(b.stars),2) AS Avrg_Rating,
				   COUNT (CASE 
            WHEN r.text LIKE '%great%' THEN 1 
            WHEN r.text LIKE '%love%' THEN 1
            WHEN r.text LIKE '%lovely%' THEN 1
            WHEN r.text LIKE '%loved%' THEN 1
            WHEN r.text LIKE '%favorite%' THEN 1
            WHEN r.text LIKE '%awesome%' THEN 1
            WHEN r.text LIKE '%kickass%' THEN 1
            WHEN r.text LIKE '%fun%' THEN 1
            WHEN r.text LIKE '%enjoyed%' THEN 1
            WHEN r.text LIKE 'the best%' THEN 1
            WHEN r.text LIKE '%recommended%' THEN 1
            WHEN r.text LIKE '%recommend%' THEN 1
            WHEN r.text LIKE '%outstanding%' THEN 1
            WHEN r.text LIKE '%fantastic%' THEN 1
            WHEN r.text LIKE '%happy%' THEN 1
            WHEN r.text LIKE '%wow%' THEN 1
            WHEN r.text LIKE '%perfect%' THEN 1
            WHEN r.text LIKE '%beautiful%' THEN 1
            WHEN r.text LIKE '%thanks!' THEN 1
            WHEN r.text LIKE '%thank you!' THEN 1
            WHEN r.text LIKE '%bad' THEN -1 
            WHEN r.text LIKE '%not good%' THEN -1
            WHEN r.text LIKE '%hate%' THEN -1
            WHEN r.text LIKE '%not good%' THEN -1
            WHEN r.text LIKE '%did not like%' THEN -1
            WHEN r.text LIKE '%not fun%' THEN -1
            WHEN r.text LIKE '%not the best%' THEN -1
            WHEN r.text LIKE '%awful%' THEN -1
            WHEN r.text LIKE '%poor%' THEN -1
            WHEN r.text LIKE '%not happy%' THEN -1
            WHEN r.text LIKE '%digusting%' THEN -1
            WHEN r.text LIKE '%ugly%' THEN -1
            WHEN r.text LIKE '%nasty%' THEN -1
            WHEN r.text LIKE '%bland%' THEN -1
            WHEN r.text LIKE '%empty%' THEN -1
            WHEN r.text LIKE '%mild%' THEN -1
            WHEN r.text LIKE '%annoying%' THEN -1
            WHEN r.text LIKE '%slow%' THEN -1
            END) AS Sentiment_Score
FROM business b
JOIN review r
ON b.id = r.business_id
GROUP BY 1)

SELECT BusinessCity, 
			 MIN(Sentiment_Score) AS MinScore, 
			 MAX(Sentiment_Score) AS MaxScore,
			 AVG(Sentiment_Score) AS AvgScore
FROM SentimentData

```
