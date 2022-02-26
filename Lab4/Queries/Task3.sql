SELECT sname
FROM sailor, reserve
WHERE sailor.sid=reserve.sid AND bid=103;