local QBCore = exports['qb-core']:GetCoreObject()


--[[ EDIT THE EVENTS BELOW TO SUIT OTHER DUTY HANDLING RESOURCES NO SUPPORT IS GIVEN FOR SCRIPT CHANGES THAT ARE NOT SUPPORTED BY DEFUALT]]

------------------------PAYMENT SECTION-------------------------------


RegisterServerEvent("lusty94_fishnchips:server:bill:player")
AddEventHandler("lusty94_fishnchips:server:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'fishnchips' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        -- edit the database table names below to suit your phone system.
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname,
                            ['@sendercitizenid'] = biller.PlayerData.citizenid
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source) -- change this to suit your phone event if using phone billing
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')

                        --if using old qb-core method where mnagement handles money then use this snippet below
                        exports['qb-banking']:AddMoney('fishnchips', amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
                         
                        -- if using new qb-core method where banking replaces management menu for money options then uncomment this snippet below and comment out the one above for management
                        --exports['qb-banking']:AddMoney('fishnchips', amount)
                        
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received From Hornys!')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0!', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself!', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online!', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access!', 'error')
        end
end)


