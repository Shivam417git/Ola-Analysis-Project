create database 
select * from bookings;
Alter table bookings
change ï»¿Date Date date;
-- Questions
-- 1. Retrieve all successful bookings
create view Successful_bookings as
select * from bookings where Booking_Status='Success';

select * from Successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance) as avg_ride_distance
from bookings
group by Vehicle_Type;

select * from average_ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from bookings
where booking_status="canceled by customer";

select * from cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id, count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc
limit 5;

select * from top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers as
select count(*) from bookings
where Canceled_Rides_by_Driver="personal & car related issue";

select * from cancelled_by_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_rating_for_sedan as
select max(driver_ratings) as max_rating, min(driver_ratings) as min_rating
from bookings
where Vehicle_Type="Prime Sedan";

select * from max_min_rating_for_sedan;

-- 7. Retrieve all rides where payment was made using UPI:
create view payment_using_UPI as
select * from bookings where payment_method="UPI";

select * from payment_using_UPI;

-- 8. Find the average customer rating per vehicle type:
create view average_customer_rating as
select vehicle_type,avg(customer_rating) as Avg_customer_rating
from bookings
group by Vehicle_Type;

select * from average_customer_rating;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as
select sum(booking_value) as total_successful_value
from bookings
where Booking_Status="Success";

select * from total_booking_value;

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides as
select booking_id, incomplete_rides_reason from bookings
where Incomplete_Rides='yes';

select * from incomplete_rides;