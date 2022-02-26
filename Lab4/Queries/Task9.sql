SELECT sname
FROM sailor,reserve,boat
WHERE sailor.sid= reserve.sid AND color="red"
UNION SELECT sname
FROM sailor,reserve,boat
WHERE sailor.sid= reserve.sid AND color="green";