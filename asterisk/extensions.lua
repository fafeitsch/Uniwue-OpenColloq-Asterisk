local function wedding_proposal(ctx,ext)
	app.answer()
	app.read("input","marryme",1)
	local answer = channel.input:get()
	if answer == "1" then
		app.playback("thank-you-cooperation")
	else
		app.playback("sorry")
	end
	app.hangup()
end

local function call_to_mobile(ctx, ext)
	local real_ext = string.sub(ext,2)
	local call_by_call = "01052"
	app.answer()
	app.sayDigits(call_by_call .. real_ext)
	app.hangup()
end

extensions = {
	["internal"] = {
		["40"] = wedding_proposal,
		["_001[567]."] = call_to_mobile,
		["50"] = function(ctx,ext)
			app.answer()
			app.VoiceMailMain("joe@contoso","s")
			app.hangup()
		end,
	}
}
