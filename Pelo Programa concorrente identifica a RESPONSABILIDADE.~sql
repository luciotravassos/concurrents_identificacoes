select fcpvl.USER_CONCURRENT_PROGRAM_NAME, frtl.RESPONSIBILITY_NAME
  from applsys.FND_REQUEST_GROUPS      frg,
       applsys.FND_REQUEST_GROUP_UNITS frgu,
       applsys.FND_CONCURRENT_PROGRAMS fcp,
       applsys.fnd_responsibility      fr,
       apps.FND_CONCURRENT_PROGRAMS_VL fcpvl,
       apps.FND_RESPONSIBILITY_tL      frtl
 WHERE fcpvl.USER_CONCURRENT_PROGRAM_NAME like '%&Concurrent%'
   and frg.APPLICATION_ID = frgu.APPLICATION_ID
   and frg.REQUEST_GROUP_ID = frgu.REQUEST_GROUP_ID
   and frgu.request_unit_id = fcp.concurrent_program_id
      --and             fr.GROUP_APPLICATION_ID  = frg.GROUP_APPLICATION_ID(+)
   and fr.request_group_id = frg.request_group_id
   and fcpvl.CONCURRENT_PROGRAM_NAME = fcp.CONCURRENT_PROGRAM_NAME
   and fr.RESPONSIBILITY_ID = frtl.RESPONSIBILITY_ID
   and frtl.LANGUAGE = '&lang'