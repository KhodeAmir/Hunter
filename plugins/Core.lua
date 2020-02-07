pat = { "^(ping)$",
     
}
COPYRIGHT = '\n(C) Copyright 2020 CRCO project'

function run(msg,crco)
    if is_sudo(msg.sender_user_id) then
if crco[1] == 'ping' then
  tdbot.sendText(msg.chat_id, msg.id,'☤ *PONG* ☤', 'md', false, false, false, 0, nil, nil, nil)

end
end
end
function pre(msg,first_update)
    timenow = os.date("%M")
end

return {
       patterns = pat,
                runing = run ,
                cmd = false,
                lower = false,
            run = pre 
}

