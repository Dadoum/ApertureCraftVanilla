repeat process ACV_lightBridges {
// Remove unsupported bridges
/kill @e[type=armor_stand,name=ACV_LightBridge,rxm=-90,rx=-1]
/kill @e[type=armor_stand,name=ACV_LightBridge,rxm=1,rx=90]

/scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,tag=ACV_InAir] remove ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ air * scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ carpet 3 scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] add ACV_InAir
/execute @e[type=armor_stand,name=ACV_LightBridge] ~ ~ ~ detect ~ ~ ~ piston_extension * execute @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] ~ ~ ~ detect ~ ~1 ~ carpet 3 scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,r=0,c=1] add ACV_InAir

/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_PortalIn,dy=0] add ACV_createLightBridges_PARAM
/scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] add ACV_TpProof
/entitydata @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_InAir] {CustomName:"ACV_LightBridgeEnd"}
conditional: start ACV_createLightBridges

// To avoid race conditions, if there are multiple lightbridges in the same block one needs to be processed (setblock) before the others, so that the others summon all markers correctly
/scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge] add ACV_Multiple
/execute @e[type=armor_stand,name=ACV_LightBridge,tag=ACV_Multiple] ~ ~ ~ scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge,dy=0,c=-1] remove ACV_Multiple

/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_Multiple] ~ ~ ~ detect ~ ~-1 ~ carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_Multiple] ~ ~ ~ detect ~ ~ ~ carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeCross",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_Multiple] ~ ~ ~ detect ~ ~1 ~ carpet 3 summon armor_stand ~ ~1 ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_Multiple] ~ ~ ~ setblock ~ ~-1 ~ piston_extension 0 keep
/execute @e[type=armor_stand,name=ACV_LightBridge,tag=!ACV_Multiple] ~ ~ ~ setblock ~ ~ ~ carpet 3

/execute @e[type=armor_stand,name=ACV_LightBridge,tag=ACV_Multiple] ~ ~ ~ detect ~ ~-1 ~ carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge,tag=ACV_Multiple] ~ ~ ~ detect ~ ~ ~ carpet 3 summon armor_stand ~ ~ ~ {CustomName:"ACV_BridgeCross",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[type=armor_stand,name=ACV_LightBridge,tag=ACV_Multiple] ~ ~ ~ detect ~ ~1 ~ carpet 3 summon armor_stand ~ ~1 ~ {CustomName:"ACV_BridgeBelow",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/tp @e[type=armor_stand,name=ACV_LightBridge,rym=45,ry=135] ~-1 ~ ~
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=135,ry=-135] ~ ~ ~-1
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=-135,ry=-45] ~1 ~ ~
/tp @e[type=armor_stand,name=ACV_LightBridge,rym=-45,ry=45] ~ ~ ~1

// Wake up all idle light bridges
/entitydata @e[type=armor_stand,name=ACV_LightBridge_Idle] {CustomName:"ACV_LightBridge"}
/scoreboard players tag @e[type=armor_stand,name=ACV_LightBridge] add ACV_TpProof

/testfor @e[type=armor_stand,name=ACV_LightBridge]
invert: stop
}
