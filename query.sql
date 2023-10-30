use viet_nam_railway;


-- Stored Procedure for get all train in trip (from Station A to Station B and input date)
DELIMITER //
create procedure get_train_by_date_and_station(	from_station_first varchar(100), 
												to_station_first varchar(100), 
                                                from_station_second varchar(100), 
												to_station_second varchar(100), 
                                                start_date date)
begin
SELECT
		t.`id` AS trainId,
        t.`code` AS trainCode,
        t.`name` AS trainName,
        tr.id AS tripId,
        tr.start_date AS startDate,
        tr.end_date AS endDate,
        d.`length` AS distanceLength,
        d.from_station AS fromStation,
        d.to_station AS toStation
    FROM
        train t
    JOIN
        trip tr ON t.id = tr.train_id
    JOIN
        distance d ON d.id = tr.distance_id
    WHERE
        tr.start_date >= CONCAT(start_date, " 00:00:00")
        AND tr.end_date <= DATE_ADD(tr.start_date, INTERVAL 20 HOUR)
        AND deleted = false
        AND (d.id BETWEEN (
            SELECT MIN(id)
            FROM distance
            WHERE from_station = from_station_first AND to_station = to_station_first
        ) AND (
            SELECT MAX(id)
            FROM distance
            WHERE from_station = from_station_second AND to_station = to_station_second
        ))
        ORDER BY trainId ;
end //	
DELIMITER ;
call get_train_by_date_and_station("TP Hồ Chí Minh", "Nha Trang", "Vinh", "Hà Nội","2023-10-20");
call get_train_by_date_and_station(  "Hà Nội","Vinh", "Huế","Đà Nẵng","2023-10-20");
call get_train_by_date_and_station(  "Vinh", "Huế","Huế","Đà Nẵng","2023-10-20");


-- Get all coach from one train
select 	c.id as coachId,
		c.`code` as coachCode,
        toc.`name` as typeOfCoachName,
        toc.price as typeOfCoachPrice
from coach c
join type_of_coach toc on toc.id = c.type_of_coach_id
where c.deleted = false
and c.train_id = 1
;

-- Get all seat from one coach

DELIMITER //
create procedure get_seat(coachId bigint, first_trip_id bigint, last_trip_id bigint)
begin
select 	
		seatCode,
        Max(available) as available,
        coachId
from(
	select 	
		s.`code` as seatCode,
        s.available as available,
        c.id as coachId
	from seat s
	join coach c on c.id = s.coach_id
	join trip tr on tr.id = s.trip_id
	where deleted = false
	and c.id = coachId
	and tr.id between first_trip_id and last_trip_id
    ) as subquery
group by  seatCode, coachId;

end //
DELIMITER ;

call get_seat(1,11,13);



    



