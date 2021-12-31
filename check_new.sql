select 
--'58' || LPAD(TO_CHAR(a.aorderid),6,'0')
a.atranid,a.aorderid,a.aclientcode,a.aordertype,
a.aproducttype as protype,'',
a.astockcode as stock,a.abuysell as BS,a.aquantity,b.aremainingqty,a.aprice,
b.aremainingqty as KLSS,b.amodifyqty,b.aorderstatus,a.adatetime,a.alasttranid,a.aexchange
from ttrd_transactionlog a
               inner join ttrd_transactionlogdetails b
                   on b.atranid = a.atranid
               inner join (
                           select max(aid) aid,max (tt1.atranid) atranid, max(tt1.aorderid) aorderid from ttrd_transactionlogdetails tt1 inner join
                            (
                               select max (t1.atranid) atranid, max(t1.aorderid) aorderid from ttrd_transactionlogdetails t1 inner join
                                            (select max (atranid) atranid, max(aid) aid
                                             from ttrd_transactionlogdetails 
                                           group by atranid)t2 on t1.aid=t2.aid where aorderstatus <> 'REJECTED' group by t1.aorderid
                             ) tt2 on tt1.atranid=tt2.atranid group by tt1.aorderid
                           ) c
                           --group by aorderid) c
                   on c.atranid = a.atranid and c.aid = b.aid 
                   --AND aclientcode = '058C881303' 
                  and a.atranid in(65	)
                  --and a.atranid between 9 and 11 
                   --and a.aorderid in (239, 245, 236, 237,238, 242)
                   --and aorderstatus = 'INPROCESS'
                   --and apricetype <> 'ATC' 
                   --AND a.aexchange = 'HSX'
                   order by a.aorderid,a.atranid
                   
                   
                   
/*
--Acc Th?a thu?n HSX
HoSTCPutThroughDealConfirmation_2L,2L,58,X (1 firm: X, Buy: B, Sell:S),DealID = 83(FPT dat ban: DealID = TraniD Sell, Mua: Lay DealID gui ve),Firm MUa: 058(001,002,...),1000 (Quantity),50000000 (Giá: x1000),29 (confirmNo-t?
 b?a),0,
HoSTCPutThroughDealConfirmation_2L,2L,58,B,11,58,34000,000000040000,11,0,
HoSTCPutThroughDealConfirmation_2L,2L,58,S,241,58,17000,000050000000,241,0,
 

HoSTCPutThroughDealConfirmation_2L,2L,58,S,,48,27812,000020000000,155,0,

 

HoSTCPutThroughDealConfirmation_2L,2L,58,S,4589,58,21000,000000023000,4589,0,
-- 1 firm
HoSTCPutThroughDealConfirmation_2L,2L,58,X,7978,58,20000,000000025400,7978,0,
HoSTCPutThroughDealConfirmation_2L,2L,58,X,3597,58,5349510,000018000000,3597,0,
HoSTCPutThroughDealConfirmation_2L,2L,58,X,3599,58,3400250,000018000000,3599,0,
HoSTCPutThroughDealConfirmation_2L,2L,58,X,22,58,20000,000000033500,22,0,
-- 2 firm
HOSTCPutThroughAcknowledgment_2F,2F,58,581,S,48,482,FPT,20000,000051000000,S,162,0,
48,482 là firm nhà d?i ?ng, 20000-kh?i lu?ng,000051000000--giá (? cu?i luôn th?m 000 : hi?u là giá *1000 ?y), 162- s? hi?u l?nh t?i s?


*/
--Trade cho l?nh tt HNX
/*'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210715-13:41:37,,3,2,BVS00000003,BVS00000003,BVS00000003,20210715-13:41:37,7777,28888,BVS00000003,8,BVS,3'*/
/*'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210715-13:46:05,,3,2,SHS00000005,SHS00000005,SHS00000005,20210715-13:46:05,11111,41111,SHS00000005,8,SHS,5'*/




/*HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-14:00:00,,3,2,SHB000000041,SHB000000041,SHB000000041,20210126-13:34:57,52,15100,SHB000000041,8,SHB,41*/
/*'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-13:59:35,,3,2,HMH00007984,HMH00007984,HMH00007984,20210305-13:59:35,5500,10000,HMH00007984,8,HMH,7984'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-13:59:35,,3,2,HMH00007982,HMH00007982,HMH00007982,20210305-13:59:35,7000,10000,HMH00007982,8,HMH,7982'*/
/*'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-14:11:04,,3,2,ACV00007987,ACV00007987,ACV00007987,20210305-14:11:04,1000,65000,ACV00007987,8,ACV,7987'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-14:11:04,,3,2,ACV00007989,ACV00007989,ACV00007989,20210305-14:11:04,3000,70000,ACV00007989,8,ACV,7989'*/
/*'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-14:30:13,,3,2,PVS00007998,PVS00007998,PVS00007998,20210305-14:30:13,6000,21000,PVS00007998,8,PVS,7998'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210305-14:31:24,,3,2,CEO00008004,CEO00008004,CEO00008004,20210305-14:31:24,7700,11200,CEO00008004,8,CEO,8004'*/
/*'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210309-14:16:13,,3,2,L1400000066,L1400000066,L1400000066,20210309-14:16:13,10,71100,L1400000066,8,L14,66'
  'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210331-11:34:32,,3,2,SHB00000006,SHB00000006,SHB00000006,20210331-11:34:32,60,14300,SHB00000006,8,SHB,6'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210401-10:43:46,,3,2,PVS00000009,PVS00000009,PVS00000009,20210401-10:43:46,20,22700,PVS00000009,8,PVS,9'

 'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210910-13:53:45,,3,2,IDJ00000270,IDJ00000270,IDJ00000270,20210910-13:53:45,6000,20000,IDJ00000270,8,IDJ,270D271'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210910-14:13:37,,3,2,A3200000275,A3200000275,A3200000275,20210910-14:13:37,500,33500,A3200000275,8,A32,275'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210913-09:47:45,,3,2,KVC00000146,KVC00000146,KVC00000146,20210913-09:47:45,80,3500,KVC00000146,8,KVC,146'
'HNX_TradedConfirm,8,HNX,058.01GWNEW,20210913-09:59:53,,3,2,HCT00000149,HCT00000149,HCT00000149,20210913-09:59:53,70,14000,HCT00000149,8,HCT,149'



*/

 

/*s? acc cho l?nh bán TT d?t lên
--b?ng select * from ttrd_hnxnewordercross_ack b?ng acc cho l?nh bán tt
HNX_NewOrderCross,s,HNX,058.01GW,20210315-12:21:02,1,0,PVS00000005,2,2,5,1,058,058C019690,5000,2,1,,1,034,,5000,2,20210315-12:21:02,PVS,27000,,

 HNX_NewOrderCross,s,HNX,058.01GW,20210913-13:54:06,1,0,PVS00009999,2,2,15089,1,002,002C022542,3500,2,1,,1,058,058C094500,3500,2,20210913-13:54:06,PVS,24000,,  (B)

HNX_NewOrderCross,s,HNX,058.01GW,20201118-03:31:02,1,0,SHL ex sell,2,2,SHL sell,1,party sell,stk sell,qty sell,2,1,,1,party buy,stk buy,qty buy,2,20200923-03:31:02,SHB,price,,*/