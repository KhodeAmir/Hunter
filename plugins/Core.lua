pat = { "^(setusername) @(.*)$",
"^(delusername) @(.*)$",
"^(checker)$",
"^(ping)$"

     
}
COPYRIGHT = '☤ Powered by [Amir Bagheri](http://github.com/KhodeAmir) and [Milad Heidary](http://github.com/MiladHeidary)'
Locking = function(username)

        function get(a,b)
            if b and b._ == 'error' then
                text = "☤ Message : *Access Denied*\nError : *"..b.message.."*"
                del('Users:Cloud:')
                del('Found:User:')
            else
                del('Users:Cloud:')
                del('Found:User:')
                
                text = '☤ Message : *Username* :'..username..' *  Locked :) *'
          
        
                end
                tdbot.sendText(config.info.is_log, 0,text, 'md', false, false, false, 0, nil, nil, nil)
            end
                tdbot.setUsername(string.upper(username),get,nil)

      

    
    
end
adduser =function(username)
    if Get('Users:Cloud:',username) then
        return   tdbot.sendText(msg.chat_id, msg.id,'☤ Message : *User* :`'..username..'` *  is *Already*  in checking *', 'md', false, false, false, 0, nil, nil, nil)

    else
        save('Users:Cloud:',username)

        return   tdbot.sendText(msg.chat_id, msg.id,'☤ Message : *User* :`'..username..'` * seted to  user check *', 'md', false, false, false, 0, nil, nil, nil)
    end

end
deluser =function(username)
    if not Get('Users:Cloud:',username) then
        return   tdbot.sendText(msg.chat_id, msg.id,'☤ Message : *User* :`'..username..'` *  is *Not found *', 'md', false, false, false, 0, nil, nil, nil)

    else
        del('Users:Cloud:',username)
        return   tdbot.sendText(msg.chat_id, msg.id,'☤ Message : *User* :`'..username..'` * unseted from user check *', 'md', false, false, false, 0, nil, nil, nil)
    end

end
function run(msg,crco)
    if is_sudo(msg.sender_user_id) then
        if crco[1] == 'ping' then 
            return tdbot.sendText(msg.chat_id, msg.id,'*☤ PONG ☤*','md',false, false, false, 0, nil, nil, nil)
        end
if crco[1] == 'setusername' and crco[2] then
        getMainUsername = function(ex,CR)
          if not CR.id then
            return tdbot.sendText(msg.chat_id, msg.id,'☤ Message : *User* :`'..crco[2]..'` * is Not Found *','md',false, false, false, 0, nil, nil, nil)
            else
                adduser(crco[2])
        end
        end
        tdbot.searchPublicChat(crco[2],getMainUsername,nil)
        

end
if crco[1] == 'delusername' and crco[2] then
    
            deluser(crco[2])

  
    

end
if crco[1] == 'checker' then

username_ = returndata(Get('Users:Cloud:') )
Time = os.date("%H:%M")

return tdbot.sendText(msg.chat_id, msg.id,'☤ username : '..username_..' checked in : '..Time..'\n\n'..COPYRIGHT,'md',false, false, false, 0, nil, nil, nil)
end
----
end
end
function pre(msg,fast_update)
 if fast_update then
    if not Get('Found:User:') and Get('Users:Cloud:') then
    local users = returndata(Get('Users:Cloud:') )
        res = https.request("https://t.me/"..users)
        if res and res:match('<i class="tgme_icon_user"></i>') then
            save('Found:User:',users)
          
        
    end
   end

if Get('Found:User:') then
    text = '☤ Username '..returndata(Get('Found:User:'))..'  starting for locking !'
     tdbot.sendText(config.info.is_log, 0,text,'md',false, false, false, 0, nil, nil, nil)

    Locking(returndata(Get('Found:User:')))
end
end
end
return {
       patterns = pat,
                runing = run ,
                cmd = false,
                lower = false,
            run = pre 
}

