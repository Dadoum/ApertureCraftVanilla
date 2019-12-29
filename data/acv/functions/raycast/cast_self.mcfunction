teleport @s ^ ^ ^
execute store result score @s acv_origin_x run data get entity @s Pos[0] 1000
execute store result score @s acv_origin_y run data get entity @s Pos[1] 1000
execute store result score @s acv_origin_z run data get entity @s Pos[2] 1000

teleport @s ^ ^ ^1
execute store result score @s acv_delta_x run data get entity @s Pos[0] 1000
execute store result score @s acv_delta_y run data get entity @s Pos[1] 1000
execute store result score @s acv_delta_z run data get entity @s Pos[2] 1000

scoreboard players operation @s acv_delta_x -= @s acv_origin_x
scoreboard players operation @s acv_delta_y -= @s acv_origin_y
scoreboard players operation @s acv_delta_z -= @s acv_origin_z

scoreboard players set @s acv_step_x 0
scoreboard players set @s acv_step_y 0
scoreboard players set @s acv_step_z 0

scoreboard players operation @s acv_x_pos_x = @s acv_origin_x
scoreboard players operation @s acv_x_pos_x /= 1000 acv_constant
scoreboard players operation @s acv_x_pos_x *= 1000 acv_constant
execute if score @s acv_delta_x matches 1.. run scoreboard players set @s acv_step_x 1000
function acv:raycast/next_x_pos
execute if score @s acv_delta_x matches ..-1 run scoreboard players set @s acv_step_x -1000

scoreboard players operation @s acv_y_pos_y = @s acv_origin_y
scoreboard players operation @s acv_y_pos_y /= 1000 acv_constant
scoreboard players operation @s acv_y_pos_y *= 1000 acv_constant
execute if score @s acv_delta_y matches 1.. run scoreboard players set @s acv_step_y 1000
function acv:raycast/next_y_pos
execute if score @s acv_delta_y matches ..-1 run scoreboard players set @s acv_step_y -1000

scoreboard players operation @s acv_z_pos_z = @s acv_origin_z
scoreboard players operation @s acv_z_pos_z /= 1000 acv_constant
scoreboard players operation @s acv_z_pos_z *= 1000 acv_constant
execute if score @s acv_delta_z matches 1.. run scoreboard players set @s acv_step_z 1000
function acv:raycast/next_z_pos
execute if score @s acv_delta_z matches ..-1 run scoreboard players set @s acv_step_z -1000

function acv:raycast/recursive_step
tag @s remove acv_raycast_finished