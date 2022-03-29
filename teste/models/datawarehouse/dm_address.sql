{{ config(materialized='table') }}

SELECT 	a.address_id, 
		a.address, 
		a.address2, 
		a.district,  
		a.postal_code, 
		a.phone,
		b.city,
		c.country,
		GREATEST(a.last_update,b.last_update,c.last_update) as last_update
FROM {{source('dvdrental','address')}} a
INNER JOIN {{source('dvdrental','city')}} b ON a.city_id = b.city_id
INNER JOIN {{source('dvdrental','country')}} c ON b.country_id = c.country_id