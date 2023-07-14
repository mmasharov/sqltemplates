SELECT r.group_name, p.group_name, d.device_name, d.device_model_name
  FROM public.mi_dms_info_device d
  JOIN mi_dms_map_group_device m
  ON (d.device_id = m.device_id)
  JOIN mi_dms_info_group g
  ON (m.group_id = g.group_id)
  JOIN mi_dms_info_group p
  ON (p.group_id = g.p_group_id)
  JOIN mi_dms_info_group r
  ON (r.group_id = p.p_group_id)
  WHERE d.device_id IN (SELECT device_id FROM public.mi_dms_map_group_device WHERE group_id IN (SELECT group_id FROM public.mi_dms_info_group WHERE p_group_id IN (SELECT group_id FROM public.mi_dms_info_group WHERE p_group_id IN (1522, 716, 159, 160, 158))))
  ORDER BY r.group_name, p.group_name, d.device_name;