SELECT sailor.Sid
FROM sailor, reserve
WHERE sailor.sid=reserve.sid AND reserve.bid=108
UNION SELECT sailor.Sid
FROM sailor, reserve
WHERE sailor.sid=reserve.sid AND rating=10;