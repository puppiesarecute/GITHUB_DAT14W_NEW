-- 16 List the price and type of all rooms at the Grosvenor Hotel.

select price, type from room r
left join hotel h
on r.hotelNo = h.hotelNo
where h.hotelName = 'Grosvenor Hotel';

-- 17 List all guests currently staying at the Grosvenor Hotel.

select distinct g.* from guest g
left join booking b on g.guestNo = b.guestNo
left join hotel h on b.hotelNo = h.hotelNo
where h.hotelName = 'Grosvenor Hotel';

-- 18 List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied.

Select r.*, g.guestName from room r
join booking b on r.roomNo = b.roomNo and r.hotelNo = b.hotelNo
join guest g on b.guestNo = g.guestNo
join hotel h on b.hotelNo = h.hotelNo
where h.hotelName = 'Grosvenor Hotel';

-- 19 What is the total income from bookings for the Grosvenor Hotel today?

select sum(r.price) from booking b
join room r on b.roomNo = r.roomNo
where b.hotelNo in (select hotelNo from hotel where hotelName = 'Grosvenor Hotel');

-- 20 List the rooms that are currently unoccupied at the Grosvenor Hotel.

select r.* from room r
join booking b on r.roomNo = b.roomNo
where r.hotelNo in (select hotelNo from hotel where hotelName = 'Grosvenor Hotel');

-- 21 What is the lost income from unoccupied rooms at the Grosvenor Hotel?

select sum(r.price) from hotel h
left join room r on r.hotelNo = h.hotelNo
left join booking b on h.hotelNo = b.hotelNo and r.roomNo = b.roomNo
where h.hotelName = 'Grosvenor Hotel' and b.roomNo is null;


-- 40 List details about hotels and their bookings at the hotels that have bookings
select * from hotel h
inner join booking b on h.hotelNo = b.hotelNo;

-- 41 List details about all hotels and show the bookings for each hotel. (it should also be visible if no booking is placed at a specific hotel)
select * from hotel h
left join booking b on h.hotelNo = b.hotelNo;

-- 42 List of all guest registered, and list their bookings if they have any.
select * from guest g
left join booking b on g.guestNo = b.guestNo;

-- 43 List the guest name of the guests that have a booking, together with the hotel name, room number of the room they have booked. Also show the dateFrom, DateTo of the booking.
select g.guestName, h.hotelName, b.roomNo, b.dateFrom, b.dateTo from guest g
inner join booking b on g.guestNo = b.guestNo
inner join room r on b.hotelNo = r.hotelNo and b.roomNo = r.roomNo
inner join hotel h on b.hotelNo = h.hotelNo;


