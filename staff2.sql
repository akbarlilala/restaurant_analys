SELECT
r.date,
st.first_name,
st.last_name,
st.hourly_rate,
sh.start_time,
sh.end_time,
((hour(timediff(sh.end_time,sh.start_time))*60)+(minute(timediff(sh.end_time,sh.start_time))))/60 as hours_in_shift,
((hour(timediff(sh.end_time,sh.start_time))*60)+(minute(timediff(sh.end_time,sh.start_time))))/60 * st.hourly_rate as staff_cost
FROM rota r
LEFT JOIN staff st ON st.staff_id=r.staff_id
LEFT JOIN shift sh ON sh.shift_id=r.shift_id