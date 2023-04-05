Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. 
In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

SELECT DISTINCT state, COUNT (review_count) total_5_star_reviews-- business_id
FROM yelp_business
WHERE stars = 5
GROUP BY 1
ORDER BY 2 DESC
LIMIT 6;
