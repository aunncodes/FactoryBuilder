schedule function code:tick_1s 20t replace

# item decay logic
scoreboard players add @e[type=item_display,tag=item,x=0] timer 1
execute as @e[type=item_display,tag=item,x=0,scores={timer=121..}] run kill @s

function code:tick_1s.crafters_stagger

# conveyor logic
tag @e[type=item_display,tag=item.cut,tag=item.moved,x=0] remove item.cut
tag @e[type=item_display,tag=item.moved,x=0] remove item.moved
function code:tick_1s.item_stagger

# calculate TPS from actual ticks over elapsed real time
execute store result score #elapsed_ms math run stopwatch query code:tps 1000
stopwatch restart code:tps
execute if score #elapsed_ms math matches 1.. run scoreboard players operation #TPS math = #avg_COUNT math
execute if score #elapsed_ms math matches 1.. run scoreboard players operation #TPS math *= #100000 math
execute if score #elapsed_ms math matches 1.. run scoreboard players operation #TPS math /= #elapsed_ms math
execute unless score #elapsed_ms math matches 1.. run scoreboard players set #TPS math 2000
execute if score #TPS math matches 2001.. run scoreboard players set #TPS math 2000
scoreboard players set #avg_COUNT math 0

scoreboard players add @a stats.playtime 1

function code:update_sidebar
execute as @a run function code:update_list
execute as @a[gamemode=creative] run function code:alert_gmc

execute as @a run scoreboard players operation @s prev_money.0 = @s money.0
execute as @a run scoreboard players operation @s prev_money.1 = @s money.1
execute as @a run scoreboard players operation @s prev_money.2 = @s money.2
execute as @a run scoreboard players operation @s prev_money.3 = @s money.3