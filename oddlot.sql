select * from ttrd_oddlot_transactionlog


select * from ttrd_oddlot_selectedorders

sptrd_oddlot_addorder
sptrd_oddlot_updateorder
sptrd_oddlot_orderlist
sptrd_oddlot_cancelorder

select * from ttrd_oddlot_transactionloghis  where aorderplacedby = 'NHUNGDT' order by abackupdate desc 

select * from ttrd_oddlot_stockbalance where  aclientcode ='058C000645'

select * from ttrd_oddlot_price where astockcode = 'API'

select * from ezopen.topen_dtradinginfo where atblid >0

select *  from ezopen.topen_dtradinginfo a
join ttrd_oddlot_stockbalance b on a.ACUSTACCOUNT = b. aclientcode
 where atblid in (select atblid from ezopen.topen_dcustomerinfo ) and atrade_oddlot >0 and b.AEXCHANGE <> 'HSX'

select nvl(atrade_oddlot,0)  from ezopen.topen_dtradinginfo where atblid=(select atblid from ezopen.topen_dcustomerinfo where acustaccount='058C614809');