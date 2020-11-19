/* Formatted on 2005/07/27 20:06 (Formatter Plus v4.7.0) */
SELECT SUBSTR(c.user_concurrent_queue_name, 1, 30) "CONCURRENT",
       SUBSTR(c.target_node, 1, 12) "SERVIDOR",
       c.max_processes "PROCESSO",
       SUBSTR(a.request_id, 1, 20) request_id,
       SUBSTR(b.user_name, 1, 30) requestor,
       running_processes,
       a.phase_code "Phase Code",
       a.status_code,
       c.description,
       concurrent_queue_name
  FROM apps.fnd_concurrent_queues_vl c,
       apps.fnd_conc_req_summary_v   a,
       apps.fnd_user                 b,
       apps.fnd_concurrent_programs  fcp
 WHERE c.enabled_flag = 'Y'
   AND user_concurrent_queue_name like '%STANDARD%'
 ORDER BY DECODE(c.application_id,
                 0,
                 DECODE(concurrent_queue_id, 1, 1, 4, 2)),
          SIGN(max_processes) DESC,
          concurrent_queue_name,
          c.application_id