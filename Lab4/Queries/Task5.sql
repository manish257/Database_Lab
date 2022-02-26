SELECT sailor.sname
FROM sailor, reserve , boat
WHERE sailor.sid=reserve.sid AND boat.color="red";