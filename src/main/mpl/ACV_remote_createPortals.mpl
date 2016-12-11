// Creates a portal for each entity with the name ACV_remote_createPortals_PARAM
// The color is specified by tagging the entity with one of: ACV_Blue, ACV_Orange, ACV_Purple or ACV_Red
// Params: entity named ACV_remote_createPortals_PARAM
impulse process ACV_remote_createPortals {
/execute @e[name=ACV_online] ~ ~ ~ /testforblock ~ ~ ~ redstone_block
conditional: /setblock ${this + 4} redstone_block
/execute @e[name=ACV_online] ~ ~ ~ /setblock ~ ~ ~ stone
/entitydata @e[name=ACV_online] {CustomName:"ACV_online_intercepted"}
/summon armor_stand ${this + 1} {CustomName:"ACV_online",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

skip

impulse: /setblock ${this - 1} stone
/kill @e[name=ACV_online,r=2]
/kill @e[name=ACV_Main]
/entitydata @e[name=ACV_online_intercepted] {CustomName:"ACV_online"}

/kill @e[type=armor_stand,tag=ACV_Direction]

/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Up",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Down",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_South",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_East",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_North",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_West",Tags:[ACV_Direction],NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}
/execute @e[name=ACV_remote_createPortals_PARAM] ~ ~ ~ summon armor_stand ~ ~ ~ {CustomName:"ACV_Main",NoGravity:1,Invisible:1,Invulnerable:1,Marker:1}

/execute @e[name=ACV_remote_createPortals_PARAM,tag=ACV_Blue] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=ACV_Main,r=0] ACV_COLOR 0
/execute @e[name=ACV_remote_createPortals_PARAM,tag=ACV_Orange] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=ACV_Main,r=0] ACV_COLOR 1
/execute @e[name=ACV_remote_createPortals_PARAM,tag=ACV_Purple] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=ACV_Main,r=0] ACV_COLOR 2
/execute @e[name=ACV_remote_createPortals_PARAM,tag=ACV_Red] ~ ~ ~ scoreboard players set @e[type=armor_stand,name=ACV_Main,r=0] ACV_COLOR 3
/kill @e[name=ACV_remote_createPortals_PARAM]
ACV_createPortal()
}
