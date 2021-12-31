select a.aorderid,a.atranid,
a.astockcode as stock,a.abuysell as BS,b.aremainingqty,a.aprice,b.aremainingqty,0,a.aprice,b.aorderstatus,a.aquantity,a.adatetime, A.aclientcode,a.aorigorderid
from fu.tfu_transactionlog a
               inner join fu.tfu_transactionlogdetails b
                   on b.atranid = a.atranid
               inner join (
                           select max(aid) aid,max (tt1.atranid) atranid, max(tt1.aorderid) aorderid from fu.tfu_transactionlogdetails tt1 inner join
                            (
                               select max (t1.atranid) atranid, max(t1.aorderid) aorderid from fu.tfu_transactionlogdetails t1 inner join
                                            (select max (atranid) atranid, max(aid) aid
                                             from fu.tfu_transactionlogdetails 
                                           group by atranid)t2 on t1.aid=t2.aid where aorderstatus <> 'REJECTED' group by t1.aorderid
                             ) tt2 on tt1.atranid=tt2.atranid group by tt1.aorderid
                           ) c
                           --group by aorderid) c
                   on c.atranid = a.atranid and c.aid = b.aid
                  --AND aclientcode = '058C042105' 
              and a.atranid in (4)
               --and a.atranid between 1 and 2
                   --and a.aorderid in ('174')
                  -- and aorderstatus in ('INPROCESS','ACCEPTED','PARTLY TRADED')
                   order by a.aorderid,a.atranid