SELECT request_id request,
       user_name,
       user_concurrent_program_name program,
       ses.username,
       ses.process,
       ses.action,
       ses.module,
       ses.status,
       ses.sid,
       ses.serial#,
       p.spid,
       ses.program,
       ses.machine,
       ses.LAST_CALL_ET,
       TO_CHAR(actual_start_date, 'DD-MON-YY HH24:MI') started
  FROM apps.fnd_concurrent_queues      fcq,
       apps.fnd_concurrent_requests    fcr,
       apps.fnd_concurrent_programs    fcp,
       apps.fnd_user                   fu,
       apps.fnd_concurrent_processes   fpro,
       gv$session                      ses,
       gv$Process                      p,
       apps.fnd_concurrent_programs_vl prog
 WHERE phase_code = 'R'
   and fcr.concurrent_program_id = prog.concurrent_program_id
   and fcr.program_application_id = prog.application_id
   AND fcr.controlling_manager = concurrent_process_id
   AND (fcq.concurrent_queue_id = fpro.concurrent_queue_id AND
       fcq.application_id = fpro.queue_application_id)
   AND (fcr.concurrent_program_id = fcp.concurrent_program_id AND
       fcr.program_application_id = fcp.application_id)
   AND fcr.requested_by = user_id
   AND fcr.oracle_session_id = ses.audsid
   AND p.addr = ses.paddr
   and spid in (&listpid)