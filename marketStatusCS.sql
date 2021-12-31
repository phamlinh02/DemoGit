select * from ttrd_marketstatus

update ttrd_marketstatus set amarketonlinestatus=1
update ttrd_marketstatus set amarketonlinestatus=0

update ttrd_marketstatus set amarketstatus=1
update ttrd_marketstatus set amarketstatus=0 where amarketcode=1
