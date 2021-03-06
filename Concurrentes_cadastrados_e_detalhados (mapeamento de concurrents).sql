
/*set line 5000
col Program for a150
col user_concurrent_queue_name for a100
col argument1 for a500
col argument2 for a500
col argument3 for a500
col argument4 for a500*/
SELECT distinct USER_CONCURRENT_QUEUE_NAME,
                fcp.user_concurrent_program_name "Program",
                fcr.RESUBMIT_INTERVAL,
                fcr.RESUBMIT_INTERVAL_UNIT_CODE
                --fcr.RESTART,
                --fcr.argument_text
                /*fcr.argument1,
                fcr.argument2,
                fcr.argument3,
                fcr.argument4*/
  FROM apps.fnd_concurrent_requests    fcr,
       apps.fnd_concurrent_programs_tl fcp,
       apps.FND_CONCURRENT_QUEUES_TL   mgr,
       apps.fnd_concurrent_processes   pro
 WHERE fcr.program_application_id = fcp.application_id
   AND fcr.concurrent_program_id = fcp.concurrent_program_id
   AND fcp.LANGUAGE = 'US'
   AND pro.CONCURRENT_PROCESS_ID = fcr.CONTROLLING_MANAGER
   AND pro.QUEUE_APPLICATION_ID = mgr.APPLICATION_ID
   and pro.CONCURRENT_QUEUE_ID = mgr.CONCURRENT_QUEUE_ID
   and mgr.SOURCE_LANG = 'PTB'
 order by 1, 2