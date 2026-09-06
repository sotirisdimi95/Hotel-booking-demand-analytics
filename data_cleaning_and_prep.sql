
-- creating a copy table in order to make changes without touching the original data

create TABLE hotel_bookings_copy as
select * from hotel_bookings 

--- search all
select * from hotel_bookings_copy hbc 

---search for duplicates (found 33259 duplicate lines)

with DuplicatesCTE as (
select rowid, row_number () over (partition by hotel,is_canceled, lead_time, arrival_date_year, arrival_date_month,stays_in_weekend_nights,stays_in_week_nights,booking_changes,required_car_parking_spaces,total_of_special_requests,
                     arrival_date_day_of_month,market_segment,country,distribution_channel,agent,company, adults, children, babies, adr, customer_type,reservation_status_date,customer_type
                     order by rowid)
                     as rn 
from hotel_bookings_copy )

select * from DuplicatesCTE
where rn > 1
order by rn desc

---- delete duplicates

delete from hotel_bookings_copy 
where rowid in (
	select rowid from (select rowid, row_number() over (partition by hotel,is_canceled, lead_time, arrival_date_year, arrival_date_month,stays_in_weekend_nights,stays_in_week_nights,booking_changes,required_car_parking_spaces,total_of_special_requests,
                     arrival_date_day_of_month,market_segment,country,distribution_channel,agent,company, adults, children, babies, adr, customer_type,reservation_status_date,customer_type
                     order by rowid) as rn 
 	from hotel_bookings_copy)
 	where rn > 1)
 	
 	
select * from hotel_bookings_copy hbc 
 	
--- replacing null inputs with unknown in agent records
update hotel_bookings_copy
set agent = 'Unknown'
where agent is null or agent = '' or agent = 'NULL'


--- replacing null inputs with unknown in company records
update hotel_bookings_copy
set company = 'Unknown'
where company is null or company = '' or company = 'NULL'


---- Checking for grammar errors that could affect charts during analysis. 

select distinct hbc.hotel     
from hotel_bookings_copy hbc 

select distinct hbc.market_segment 
from hotel_bookings_copy hbc 

select distinct hbc.distribution_channel     
from hotel_bookings_copy hbc 

select distinct hbc.deposit_type 
from hotel_bookings_copy hbc 

update hotel_bookings_copy
set deposit_type = 'Non Refundable'
where deposit_type = 'Non Refund'

select distinct hbc.customer_type     
from hotel_bookings_copy hbc 

select distinct hbc.reservation_status     
from hotel_bookings_copy hbc 



select * from hotel_bookings_copy hbc 

---- initial analysis 
---- check cancellation percentage per hotel type
select hotel, 
		count(*) as total_bookings, 
		sum(is_canceled) as canceled_bookings,
		round(cast(sum(is_canceled) as real)/ count(*) *100,2) as cancellation_rate_percentage
		from hotel_bookings_copy hbc 
		GROUP  by hotel
		
---- ADR (average daily rate) per month 
select arrival_date_month, 
		count(*) as total_successful_bookings,
		round(avg(adr),2) as avg_adr
from hotel_bookings_copy
where is_canceled = 0 
group by arrival_date_month
order by total_successful_bookings  desc
	

---- Top 15 countries 
select country,
	count(*) as total_bookings
	from hotel_bookings_copy 
	where is_canceled = 0 
	group by country
	order by total_bookings desc
	limit 15


