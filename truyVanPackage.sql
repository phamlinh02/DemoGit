
declare 

pinter varchar2(5000) :='';
pmess varchar2(5000) :='';
penable varchar2(5000):='';
BEGIN
  pkgtrd_jobspara.getinfoJobs('AMO_EOD',pinter,pmess,penable);
  DBMS_OUTPUT.PUT_LINE(pinter);
  DBMS_OUTPUT.PUT_LINE(pmess);
  DBMS_OUTPUT.PUT_LINE(penable);
END;