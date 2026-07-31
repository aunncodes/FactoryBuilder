function numeral:subtract
data modify storage numeral:io A set from storage numeral:io C
function numeral:format
title @s actionbar [{"text":"Money: ","color":"white"},{"text": "$","color": "green"},{"storage":"minecraft:temp","nbt":"actionbar.money","interpret":true,"color": "green"},{"text": " (","color": "gray"},{"text": "+","color": "dark_green"},{"storage": "numeral:io","nbt": "format","interpret":true,"color": "gray"},{"text": ")","color": "gray"}]