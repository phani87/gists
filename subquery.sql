set lines 999
set pages 100
col owner format a35
col object_type format a35
col created format a40
prompt running query in
prompt
  select * from v$version where banner like 'Oracle%';
prompt
set timing on

select
  d.owner,
  d.object_type,
  d.created
from
  dba_objects d ,
  (
    select
       owner,
       max(data_object_id)
    from
       dba_objects
  ) k
where
  d.object_type in ('TABLE', 'PARTITION', 'VIEW', 'FUNCTION', 'PACKAGE')
and
  d.owner in  ('CONSOLIDATION', 'PHANI', 'SH', 'HR')
order by 1,2
/
