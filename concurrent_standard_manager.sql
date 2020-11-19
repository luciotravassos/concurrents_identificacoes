/* Verifica o status do concurrent manager (standard manager) */
SELECT   a.concurrent_queue_name, SUBSTR (b.os_process_id, 0, 10) "OS Proc",
         b.oracle_process_id "Oracle ID", b.process_status_code,
         a.running_processes
    FROM apps.fnd_concurrent_queues a, apps.fnd_concurrent_processes b
   WHERE a.concurrent_queue_id = b.concurrent_queue_id
     AND a.concurrent_queue_name = 'STANDARD'
     AND b.process_status_code = 'A'
ORDER BY b.process_status_code;

