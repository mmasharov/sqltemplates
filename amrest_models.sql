SELECT device_name, device_model_name
  FROM public.mi_dms_info_device
  WHERE device_id IN (SELECT device_id FROM public.mi_dms_map_group_device WHERE group_id IN (SELECT group_id FROM public.mi_dms_info_group WHERE p_group_id IN (SELECT group_id FROM public.mi_dms_info_group WHERE p_group_id = 158)))
  ORDER BY device_name;