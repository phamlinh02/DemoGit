--check l?nh c?n b? ch?n h?y/s?a
---trd
select a.atranid,a.aorderid,b.aclientcode,b.aordertype,b.adatetime from trd.ttrd_transactionlogdetails a
        inner join trd.ttrd_transactionlog b on a.atranid = b.atranid
        where a.aerrorcode in  ('-9915041','8','28')
        order by b.adatetime
---fu
SELECT atranid, a.aorderid FROM tfu_transactionlogdetails a
               WHERE    a.aerrorcode IN ('9940',
                                          '99910',
                                          '99920',
                                          '991',
                                          '999199')
                     AND a.adatetime > SYSDATE - (6 / (24 * 60))