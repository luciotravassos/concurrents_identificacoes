/* Formatted on 2004/12/21 23:42 (Formatter Plus v4.7.0) */
SELECT application_name,
       application_short_name,
       basepath,
       description,
       application_id,
       last_update_login,
       created_by,
       creation_date,
       last_update_date,
       last_updated_by,
       row_id
  FROM apps.fnd_application_vl
 ORDER BY application_name