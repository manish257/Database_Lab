
# Lab 05
# Reg: 2018-EE-192

# 1. List the names and addresses of all guests in London, alphabetically ordered by name. 

select distinct guestname, guestaddress 
from guest 
where guestaddress 
like '%London%' 
order by guestname;


# 2: Display the names of all the hotels along with the number of rooms present in each of them.

select distinct hotelname, count(*) 
from hotel h, room r 
where h.hotelno=r.hotelno 
group by hotelname;


# 3: Display the AVG price of each hotel situated in London.

select distinct h.hotelname, avg(r.price) 
from hotel h, room r 
where h.hotelno=r.hotelno and h.city='London' 
group by h.hotelname;


# 4: Display the most expensive double, single and family rooms respectively.

select distinct h.hotelname, max(r.price), r.type 
from hotel h, room r 
where h.hotelno=r.hotelno 
group by r.type;


# 5: Display hotelname, cityname along with distinct number of room types available in each of them.

select distinct h.hotelname, h.city, count(*) 
from hotel h, room r 
where h.hotelno=r.hotelno 
group by h.hotelname;


# 6: Display the name and city of the hotel where guests from London are staying. 
# The list should not contain any hotel twice.

select distinct h.hotelname, h.city 
from hotel h, guest g, booking b 
where g.guestno=b.guestno and b.hotelno=h.hotelno and guestaddress like '%London%';


# 7: Display the name, city of all the hotels along with the number of reservations it has, in descending order.

select distinct h.hotelname, h.city, count(*) 
from hotel h, booking b 
where h.hotelno=b.hotelno 
group by h.hotelname;


# 8: Display the names of all the guests who have not provided with the end date of their reservations.

select distinct g.guestname 
from guest g, booking b 
where g.guestno=b.guestno and b.dateto is null;


# 9: Display the HotelName and RoomNo which was reserved in either year 2003 or 2004, 
# also display the Guest No of the respective guest.

select distinct h.hotelname, r.roomno, g.guestno 
from hotel h, room r, guest g, booking b 
where h.hotelno=r.hotelno and g.guestno=b.guestno and h.hotelno=b.hotelno 
and r.roomno=b.roomno and (b.datefrom like '%2004_%' or b.datefrom like '%2003_%');


# 10: Display the name of the hotel and city which has not been reserved.

select distinct h.hotelname, h.city 
from hotel h 
where h.hotelno not in (select distinct b.hotelno 
						from booking b);


# 11: How many different guests have made bookings till May, 2015?

select distinct g.guestno, g.guestname 
from guest g, booking b 
where g.guestno=b.guestno and b.datefrom like '%_05_%' 
group by g.guestno;


# 12: What is the total revenue per night from all double rooms?

select sum(r.price) 
from room r, booking b 
where r.roomno=b.roomno and r.type='double';


# 13: How many different guests have made bookings for August?

select distinct g.guestno, g.guestname 
from guest g, booking b 
where g.guestno=b.guestno and b.datefrom like '%_08_%' 
group by g.guestno;


# 14: List the price and type of all rooms at the ‘Avari’ Hotel in Lahore.

select distinct r.price, r.type 
from room r, hotel h where r.hotelno=h.hotelno and h.hotelname='Avari';


# 15: List all guests currently staying at the ‘Marriott’ Hotel. 
# (‘system date’ is used to determine current date)

select g.guestno, g.guestname 
from guest g, booking b, hotel h 
where g.guestno=b.guestno and b.hotelno=h.hotelno and h.hotelname='Marriott' 
						  and (b.dateto>=curdate() or b.dateto is null);


# 16: What is the total income from bookings for the ‘Hotel Inn’ Hotel today?

select sum(r.price) 
from room r, booking b, hotel h where r.roomno=b.roomno and b.hotelno=h.hotelno 
								and h.hotelname='Hotel Inn' 
                                and (b.datefrom>=curdate() or b.datefrom is null);


# 17: List the rooms which are currently unoccupied at the ‘Hotel Inn’ Hotel.

select distinct r.roomno 
from room r, hotel h where r.hotelno=h.hotelno and h.hotelname='Hotel Inn' 
												and r.roomno not in (select distinct r.roomno 
                                                from room r, booking b, hotel h 
                                                where r.roomno=b.roomno and b.hotelno=h.hotelno 
																		and h.hotelname='Hotel Inn');


# 18: What is the lost income from unoccupied rooms at the ‘Hotel Inn’ Hotel?

select sum(r.price) 
from room r 
where r.roomno in (select distinct r.roomno 
				   from room r, hotel h 
                   where r.hotelno=h.hotelno and h.hotelname='Hotel Inn' 
											 and r.roomno not in (select distinct r.roomno 
																  from room r, booking b, hotel h 
                                                                  where r.roomno=b.roomno and b.hotelno=h.hotelno 
																						  and h.hotelname='Hotel Inn'));


# 19: What is the lost income from unoccupied rooms at each hotel today?

select sum(r.price), r.hotelno 
from room r where not exists (select * from booking b 
							  where r.roomno=b.roomno and (b.datefrom<=curdate() and b.dateto>=curdate())) 
                              group by r.hotelno;


# 20: For each hotel with more than two different types of rooms, what is the lost income from unoccupied rooms?

select sum(r.price), r.hotelno 
from room r where not exists (select * 
							  from booking b 
							  where r.roomno=b.roomno and (b.datefrom<=curdate() and b.dateto>=curdate())) 
                              group by r.hotelno having count(r.type)>2;
