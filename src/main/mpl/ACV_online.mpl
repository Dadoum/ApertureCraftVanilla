repeat process ACV_online {
/kill @e[name=ACV_Main]
/execute @e[type=Arrow,score_ACV_COLOR_min=0,c=1] ~ ~ ~ /summon ArmorStand ~ ~ ~ {CustomName:"ACV_Main",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/kill @e[type=Arrow,score_ACV_COLOR_min=0]
conditional: start ACV_processMain
/scoreboard players set @e[type=Arrow,c=1] ACV_COLOR 0 {inGround:1b,damage:5.5}
/scoreboard players set @e[type=Arrow,c=1] ACV_COLOR 1 {inGround:1b,damage:6.0}
/scoreboard players set @e[type=Arrow,c=1] ACV_COLOR 2 {inGround:1b,damage:6.5}
/scoreboard players set @e[type=Arrow,c=1] ACV_COLOR 3 {inGround:1b,damage:7.0}
/scoreboard players operation Color ACV_Internal = @e[type=Arrow,score_ACV_COLOR_min=0,c=1] ACV_COLOR
conditional: stop
}
