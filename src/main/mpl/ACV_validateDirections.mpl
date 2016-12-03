install {
  /scoreboard objectives add ACV_SURFACE_VALIDATION dummy
  /scoreboard objectives add ACV_SURFACE_VALIDATION_STAT dummy
}

uninstall {
  /scoreboard objectives remove ACV_SURFACE_VALIDATION
  /scoreboard objectives remove ACV_SURFACE_VALIDATION_STAT
}

// Description:
// Params: AS-ACV_Main, ASwT-ACV_DV_PARAM, SCV-color-Color
// Return: dASwT-ACV_DV_RESULT



impulse process ACV_validateDirections {
/scoreboard players set DV_DIRECTION_MASK ACV_Internal 0


// Description: Checks if both ACV_LowerBlock and ACV_UpperBlock are valid blocks.
//              They are if they are non air, and either listed by the Block_Option or the Block_Option is empty.
//              Invalid directions are killed.
// SURFACE_VALIDATION {
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_Up],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_Up],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_Down],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~1 ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_Down],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~-1 {CustomName:"ACV_LowerBlock",Tags:[ACV_South],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~-1 {CustomName:"ACV_UpperBlock",Tags:[ACV_South],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~-1 ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_East],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~-1 ~ ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_East],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~-1 ~1 {CustomName:"ACV_LowerBlock",Tags:[ACV_North],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~ ~ ~1 {CustomName:"ACV_UpperBlock",Tags:[ACV_North],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~1 ~-1 ~ {CustomName:"ACV_LowerBlock",Tags:[ACV_West],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ summon armor_stand ~1 ~ ~ {CustomName:"ACV_UpperBlock",Tags:[ACV_West],NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}


/execute @e[type=armor_stand,name=ACV_LowerBlock] set SuccessCount @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] set SuccessCount @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT


ACV_loadChunks()


/scoreboard players set @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION 0
/scoreboard players set @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION 0
/testforblocks 0 1 1 6 2 1 0 1 2
conditional: /scoreboard players set @e[type=armor_stand,tag=ACV_LowerBlock] ACV_SURFACE_VALIDATION 1
conditional: /scoreboard players set @e[type=armor_stand,tag=ACV_UpperBlock] ACV_SURFACE_VALIDATION 1

/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_LowerBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT

/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
/scoreboard players operations @e[type=armor_stand,name=ACV_UpperBlock] ACV_SURFACE_VALIDATION += @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION_STAT


/execute @e[type=armor_stand,name=ACV_LowerBlock] ~ ~ ~ detect ~ ~ ~ air * scoreboard players set @e[type=armor_stand,name=ACV_LowerBlock,r=0,c=1] ACV_SURFACE_VALIDATION 0
/execute @e[type=armor_stand,name=ACV_UpperBlock] ~ ~ ~ detect ~ ~ ~ air * scoreboard players set @e[type=armor_stand,name=ACV_UpperBlock,r=0,c=1] ACV_SURFACE_VALIDATION 0


/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_Up,score_ACV_SURFACE_VALIDATION=0] ~ ~1 ~ kill @e[type=armor_stand,name=ACV_Up,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_Up,score_ACV_SURFACE_VALIDATION=0] ~ ~1 ~ kill @e[type=armor_stand,name=ACV_Up,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_Down,score_ACV_SURFACE_VALIDATION=0] ~ ~-1 ~ kill @e[type=armor_stand,name=ACV_Down,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_Down,score_ACV_SURFACE_VALIDATION=0] ~ ~-1 ~ kill @e[type=armor_stand,name=ACV_Down,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_South,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~1 kill @e[type=armor_stand,name=ACV_South,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_South,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~1 kill @e[type=armor_stand,name=ACV_South,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_East,score_ACV_SURFACE_VALIDATION=0] ~1 ~ ~ kill @e[type=armor_stand,name=ACV_East,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_East,score_ACV_SURFACE_VALIDATION=0] ~1 ~ ~ kill @e[type=armor_stand,name=ACV_East,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_North,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~-1 kill @e[type=armor_stand,name=ACV_North,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_North,score_ACV_SURFACE_VALIDATION=0] ~ ~ ~-1 kill @e[type=armor_stand,name=ACV_North,dy=0]

/execute @e[type=armor_stand,name=ACV_LowerBlock,tag=ACV_West,score_ACV_SURFACE_VALIDATION=0] ~-1 ~ ~ kill @e[type=armor_stand,name=ACV_West,dy=0]
/execute @e[type=armor_stand,name=ACV_UpperBlock,tag=ACV_West,score_ACV_SURFACE_VALIDATION=0] ~-1 ~ ~ kill @e[type=armor_stand,name=ACV_West,dy=0]


/kill @e[name=ACV_LowerBlock]
/kill @e[name=ACV_UpperBlock]

// SURFACE_VALIDATION }




/summon armor_stand ${this + 2} {CustomName:"ACV_validateDirections_for",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_validateDirections_for] ~ ~ ~ /setblock ~ ~ ~ redstone_block
skip


// Description: Validates all Direction given by ASwT-ACV_DV_PARAM.
//              Invalid directions are killed.
//              Valid directions survive and are added to SCV-directionMask-DV_DIRECTION_MASK
// Params: AS-ACV_Main, ASwT-ACV_DV_PARAM, SCV-color-Color
// Return: SCV-directionMask-DV_DIRECTION_MASK, dAS
// for {

repeat: /scoreboard players tag @e remove ACV_DV_CURRENT
/scoreboard players tag @e[c=1,tag=ACV_DV_PARAM] add ACV_DV_CURRENT
/scoreboard players tag @e[tag=ACV_DV_CURRENT] remove ACV_DV_PARAM
invert: /execute @e[name=ACV_validateDirections_for] ~ ~ ~ /setblock ~ ~ ~ stone
conditional: /kill @e[name=ACV_validateDirections_for]
conditional: start ACV_validateDirections_for_return

/scoreboard players set DV_VALID ACV_Internal 0

// Params: AS-ACV_Main, ASwT-ACV_DV_CURRENT
// Return: AS-ACV_LowerBlock, AS-ACV_UpperBlock
// SET-SURFACE_VALIDATION-PARAMS {

/execute @e[tag=ACV_DV_CURRENT,name=ACV_Up] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~-1 ~ {CustomName:"ACV_LowerBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[tag=ACV_DV_CURRENT,name=ACV_Up] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~-1 ~ {CustomName:"ACV_UpperBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[tag=ACV_DV_CURRENT,name=ACV_Down] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~1 ~ {CustomName:"ACV_LowerBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[tag=ACV_DV_CURRENT,name=ACV_Down] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~1 ~ {CustomName:"ACV_UpperBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[tag=ACV_DV_CURRENT,name=ACV_South] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~-1 ~-1 {CustomName:"ACV_LowerBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[tag=ACV_DV_CURRENT,name=ACV_South] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~ ~-1 {CustomName:"ACV_UpperBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[tag=ACV_DV_CURRENT,name=ACV_East] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~-1 ~-1 ~ {CustomName:"ACV_LowerBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[tag=ACV_DV_CURRENT,name=ACV_East] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~-1 ~ ~ {CustomName:"ACV_UpperBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[tag=ACV_DV_CURRENT,name=ACV_North] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~-1 ~1 {CustomName:"ACV_LowerBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[tag=ACV_DV_CURRENT,name=ACV_North] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~ ~1 {CustomName:"ACV_UpperBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

/execute @e[tag=ACV_DV_CURRENT,name=ACV_West] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~1 ~-1 ~ {CustomName:"ACV_LowerBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[tag=ACV_DV_CURRENT,name=ACV_West] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~1 ~ ~ {CustomName:"ACV_UpperBlock",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}

// SET-SURFACE_VALIDATION-PARAMS }

// Description: Checks if both ACV_LowerBlock and ACV_UpperBlock are valid block.
//              They are if they are non air, and either listed by the Block_Option or the Block_Option is empty
// Params: AS-ACV_LowerBlock, AS-ACV_UpperBlock
// Return: SCV-bool-DV_SV_VALID
// SURFACE_VALIDATION {
/scoreboard players set DV_SV_VALID ACV_Internal 0

ACV_loadChunks()

/scoreboard players set DV_SV_LOWER ACV_Internal 0
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
conditional: /scoreboard players set DV_SV_LOWER ACV_Internal 1

/scoreboard players set DV_SV_UPPER ACV_Internal 0
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 0 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 1 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 2 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 3 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 4 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 5 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 6 1 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 0 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 1 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 2 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 3 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 4 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 5 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblocks ~ ~ ~ ~ ~ ~ 6 2 1
conditional: /scoreboard players set DV_SV_UPPER ACV_Internal 1

/scoreboard players test DV_SV_LOWER ACV_Internal 1 1
conditional: /scoreboard players test DV_SV_UPPER ACV_Internal 1 1
conditional: /scoreboard players set DV_SV_VALID ACV_Internal 1

/testforblocks 0 1 1 6 2 1 0 1 2
conditional: /scoreboard players set DV_SV_VALID ACV_Internal 1
/execute @e[name=ACV_LowerBlock] ~ ~ ~ /testforblock ~ ~ ~ minecraft:air
conditional: /scoreboard players set DV_SV_VALID ACV_Internal 0
/execute @e[name=ACV_UpperBlock] ~ ~ ~ /testforblock ~ ~ ~ minecraft:air
conditional: /scoreboard players set DV_SV_VALID ACV_Internal 0

/kill @e[name=ACV_LowerBlock]
/kill @e[name=ACV_UpperBlock]

// /scoreboard players test DV_SV_VALID 1 1
// conditional: /execute @e[name=ACV_SV_RETURN] ~ ~ ~ /setblock ~ ~ ~ redstone_block
// SURFACE_VALIDATION }

// Description: Checks if there is already a Portal that would overlap
// Params: AS-ACV_Main, AS-ACV_DV_CURRENT, SCV-color-Color
// Return: SCV-bool-DV_PV_VALID
// PORTAL_VALIDATION {

/scoreboard players set DV_PV_VALID ACV_Internal 1
/execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~-1 ~ {CustomName:"ACV_PV_Frame",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_Main] ~ ~ ~ /summon armor_stand ~ ~ ~ {CustomName:"ACV_PV_Frame",NoGravity:1b,Invisible:1b,Invulnerable:1b,Marker:1b}
/execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=!ACV_PortalDisplay,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 0 0
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=-1,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 0 0
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=1,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 1 1
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=0,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 1 1
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=2,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 2 2
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=1,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 2 2
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=3,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 3 3
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR=2,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0
/scoreboard players test Color ACV_Internal 3 3
conditional: /execute @e[name=ACV_PV_Frame] ~ ~ ~ /execute @e[type=item_frame,name=ACV_PortalDisplay,score_ACV_COLOR_min=4,dy=0,c=1] ~ ~ ~ /scoreboard players set DV_PV_VALID ACV_Internal 0

/kill @e[name=ACV_PV_Frame]

// PORTAL_VALIDATION }

// Description: Checks if there is air below a non floor Portal, returning true if so.
// Params: AS-ACV_Main, AS-ACV_DV_CURRENT
// Return: SCV-bool-DV_NFV_VALID
// NOT_FLOOR_VALIDATION {
/execute @e[tag=ACV_DV_CURRENT,name=ACV_Up] ~ ~ ~ /scoreboard players set DV_NFV_VALID ACV_Internal 1
/execute @e[tag=ACV_DV_CURRENT,name=!ACV_Up] ~ ~ ~ /scoreboard players set DV_NFV_VALID ACV_Internal 0
/execute @e[tag=ACV_DV_CURRENT,name=!ACV_Up] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ detect ~ ~-1 ~ minecraft:air 0 /scoreboard players set DV_NFV_VALID ACV_Internal 1
/execute @e[tag=ACV_DV_CURRENT,name=!ACV_Up] ~ ~ ~ /execute @e[name=ACV_Main] ~ ~ ~ detect ~ ~-1 ~ minecraft:carpet -1 /scoreboard players set DV_NFV_VALID ACV_Internal 1
// NOT_FLOOR_VALIDATION }

/scoreboard players test DV_SV_VALID ACV_Internal 1 1
conditional: /scoreboard players test DV_PV_VALID ACV_Internal 1 1
conditional: /scoreboard players test DV_NFV_VALID ACV_Internal 1 1
invert: /kill @e[tag=ACV_DV_CURRENT]

/execute @e[tag=ACV_DV_CURRENT,name=ACV_Up] ~ ~ ~ /scoreboard players add DV_DIRECTION_MASK ACV_Internal 32
/execute @e[tag=ACV_DV_CURRENT,name=ACV_Down] ~ ~ ~ /scoreboard players add DV_DIRECTION_MASK ACV_Internal 16
/execute @e[tag=ACV_DV_CURRENT,name=ACV_South] ~ ~ ~ /scoreboard players add DV_DIRECTION_MASK ACV_Internal 8
/execute @e[tag=ACV_DV_CURRENT,name=ACV_East] ~ ~ ~ /scoreboard players add DV_DIRECTION_MASK ACV_Internal 4
/execute @e[tag=ACV_DV_CURRENT,name=ACV_North] ~ ~ ~ /scoreboard players add DV_DIRECTION_MASK ACV_Internal 2
/execute @e[tag=ACV_DV_CURRENT,name=ACV_West] ~ ~ ~ /scoreboard players add DV_DIRECTION_MASK ACV_Internal 1

// for }
}
