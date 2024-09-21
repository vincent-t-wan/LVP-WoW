print("Hello World!")

local f = CreateFrame("Frame")

function f:OnEvent(event, ...)
	self[event](self, event, ...) -- call the appropriate event handler
end

function f:ADDON_LOADED(event, addOnName) -- parameters are in order and are dependent on the event (see /etrace in WoW)
	print(event, addOnName)
end

function f:PLAYER_ENTERING_WORLD(event, isLogin, isReload)
	print(event, isLogin, isReload)
end

function f:CHAT_MSG_CHANNEL(event, text, playerName, _, channelName)
	print(event, text, playerName, channelName)
end

f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("CHAT_MSG_CHANNEL")
f:SetScript("OnEvent", f.OnEvent) -- binds f.OnEvent to run everytime an event occurs