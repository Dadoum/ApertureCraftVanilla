# execute at @e[tag=acv_pos,type=area_effect_cloud,limit=1] run setblock ~ ~ ~ light_gray_stained_glass
execute unless entity @s[tag=acv_raycast_finished] if score @s acv_axis matches 0 run function acv:raycast/recursive_step_x
execute unless entity @s[tag=acv_raycast_finished] if score @s acv_axis matches 1 run function acv:raycast/recursive_step_y
execute unless entity @s[tag=acv_raycast_finished] if score @s acv_axis matches 2 run function acv:raycast/recursive_step_z