do
local function callback(extra, success, result)
vardump(success)
vardump(result)
end
local function run(msg, matches)
local user = 152321430
if matches[1] == "invamir" then
user = 'user#id'..152321430
end
if is_owner(msg) then
if msg.to.type == 'channel' then
local channel = 'channel#id'..msg.to.id
channel_add_user(channel, user, callback, false)
return "درحال دعوت صاحب ربات برای حل مشکل شما..."
end
elseif not is_owner(msg) then
return 'شما دسترسی برای دعوت صاحب ربات را ندارید'
end
end
return {
description = "insudo",
usage = {
"!invite name [user_name]",
"!invite id [user_id]" },
patterns = {
"^[!/#](invamir)$"
"^([Ii]nvamir)$"
},
run = run
}
end
