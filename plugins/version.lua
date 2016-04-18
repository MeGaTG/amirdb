do

function run(msg, matches)
  if matches[1]:lower() == 'shield' then -- Put everything you like :)
    send_document(get_receiver(msg), "./data/offline.webp", ok_cb, false)
    return '   〰〰〰〰〰〰〰〰\n with offlineteam〰〰〰〰〰〰〰〰 '
  end
end
return {
  patterns = {
    "^[#!/](version)$"
  }, 
  run = run 
}

end
