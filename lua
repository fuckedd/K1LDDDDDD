local function onChatted(message)
    local prefix = ".shoot"
    if message:sub(1, #prefix) == prefix then
        local targetName = message:sub(#prefix + 1):lower() -- Convert to lowercase for case-insensitive comparison

        local function convertDisplayNameToUsername(displayName)
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player.DisplayName:lower():find(displayName, 1, true) then
                    return player.Name
                end
            end
            return nil
        end  
  
        local targetUsername = convertDisplayNameToUsername(targetName)

        if targetUsername then
            local args = {
                [1] = game.Players:FindFirstChild(targetUsername).Character
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Kill"):FireServer(unpack(args))
        else
            print(" ")
        end
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)
