--Created by: @janlou

local function run(msg, matches)
  if matches[1]:lower() == 'semat' and not is_momod(msg) then
     send_document(get_receiver(msg), "./semat/member.webp", ok_cb, false)
    return 'You are a member ًں‘¶'
  end
   if matches[1]:lower() == 'semat' and is_sudo(msg) then
     send_document(get_receiver(msg), "./semat/sudo.webp", ok_cb, false)
    return 'You are my sudo ًںکٹ'
   end
    if matches[1]:lower() == 'semat' and is_owner(msg) then
     send_document(get_receiver(msg), "./semat/owner.webp", ok_cb, false)
    return 'You are a owner ًں—£'
   end
  if matches[1]:lower() == 'semat' and is_momod(msg) then
     send_document(get_receiver(msg), "./semat/momod.webp", ok_cb, false)
    return 'You are a admin ًں‘¤'
  end
end
return {
  patterns = {
    "^[#!/]([Ss][Ee][Mm][Aa][Tt])$"
  }, 
  run = run 
}
