local h = ngx.req.get_headers()

signature = h["X-Hub-Signature"]

if signature ~= 'YOUR-SECRET' then
    -- Modify it to your secret token!
    ngx.exit(403)
end

local handle = io.popen("cd /data && git pull")
local result = handle:read("*a")
handle:close()

ngx.say(result)