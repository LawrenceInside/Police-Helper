script_name('Police Helper')
script_description('Special for Grand Role Play | Saturn')
script_dependencies('SAMPFUNCS', 'SAMP')
script_moonloader(025)

site = 'https://raw.githubusercontent.com/LawrenceInside/Police-Helper/master/users.html'
update = 'https://raw.githubusercontent.com/LawrenceInside/Police-Helper/master/settings.html'
updatefile = 'https://github.com/LawrenceInside/Police-Helper/blob/master/PoliceHelper.lua?raw=true'

require "lib.moonloader"
require "lib.sampfuncs"
local key = require 'vkeys'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local ScriptLogin = 1;
local resgun = true;
local Version = "1.001";

local myRang = 0;
local myOrg = "None";

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	CheckSub()
	CheckUpdate()
	sampAddChatMessage(string.format("{FFFFFF}Police Helper {3399FF}успешно загружен. Разработчик: {FFFFFF}Lawrence Inside aka Charles Waters"), 0xFFFFFF)
	sampAddChatMessage(string.format("{3399FF}Ваш ранг (прописанный в базе данных): {FFFFFF}%s", myRang), 0xFFFFFF)
	sampAddChatMessage(string.format("{3399FF}Ваша организация (прописанный в базе данных): {FFFFFF}%s", myOrg), 0xFFFFFF)
	sampAddChatMessage("{3399FF}Если Ваш ранг/организация, не совпадает с данными выше, обязательно отпишите в тех. поддержку!", 0xFFFFFF)
	sampAddChatMessage("{3399FF}Чтобы посмотреть все возможности скрипта, введите: {FFFFFF}/mvdhelp", 0xFFFFFF)
	sampAddChatMessage("", 0xFFFFFF)
	x, y = getScreenResolution()
	font = renderCreateFont("Arial", 9, 12)
	renderFontDrawText(font,'POLICE HELPER',x/35, y/3, -1)
	-- Команды (Начало)
	sampRegisterChatCommand("mvdhelp", cmd_mvdhelp)
	sampRegisterChatCommand("rpsu", cmd_rpsu)
	sampRegisterChatCommand("rpunsu", cmd_rpunsu)
	sampRegisterChatCommand("rpcuff", cmd_rpcuff)
	sampRegisterChatCommand("rpuncuff", cmd_rpuncuff)
	sampRegisterChatCommand("rpticket", cmd_rpticket)
	sampRegisterChatCommand("rparrest", cmd_rparrest)
	sampRegisterChatCommand("rpmiranda", cmd_rpmiranda)
    sampRegisterChatCommand('cc', function() ClearChat() end)
	sampRegisterChatCommand("rppatrul", cmd_rppatrul)
	-- Команды (Конец)
	font = renderCreateFont("Arial", 9, 12)
    while true do wait(0)
		-- Меню в правом нижем углу
		renderDrawBox(1130, 950, 1200, 85, 0x999999DD)
		renderDrawBox(1135, 955, 1200, 66, 0xB4B4B4DD)
		renderFontDrawText(font,'{3399FF}POLICE {AFAFAF}HELPER',1150, 965, -1)
		renderFontDrawText(font,'______________',1150, 975, -1)
		renderFontDrawText(font,string.format("Версия: %s", Version),1150, 995, -1)
		--
	end
end


-- Команды (Начало)

function cmd_mvdhelp()
	if ScriptLogin == 0 then return false end
	sampShowDialog(3, "{3399FF}Police {AFAFAF}Helper | {FFFFFF}Информация", "{3399FF}Police Helper {FFFFFF}- Универсальный скрипт для сотрудников Полиции сервера {3399FF}Grand Role Play | Saturn\n{FFFFFF}Разработчик скрипта: {3399FF}Lawrence Inside aka Charles_Waters\n{FFFFFF}Специально для Grand Role Play\nВерсия: {3399FF}" ..Version.. "\n\n\n\t\t\t\t\t{FFFFFF}Команды скрипта:\n\n{3399FF}/mvdhelp {FFFFFF}- вся информация о скрипте\n{3399FF}/rpsu {FFFFFF}- объявить игрока в розыск\n{3399FF}/rpunsu {FFFFFF}- вынести игрока из розыска\n{3399FF}/rpcuff {FFFFFF}- надеть наручники на игрока\n{3399FF}/rpuncuff {FFFFFF}- снять наручники с игрока\n{3399FF}/rpputm {FFFFFF}- затащить игрока в полицейский автомобиль\n{3399FF}/rpticket {FFFFFF}- выдача штрафа игроку\n{3399FF}/rparrest {FFFFFF}- арестовать игрока\n{3399FF}/rpmiranda {FFFFFF}- миранда", "Закрыть", "", 0)
end

function cmd_rpsu(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rpsu [id игрока] [кол-во звезд] [причина]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me достал КПК из внутреннего кармана")
			wait(1000)
			sampSendChat("/me открыл базу данных МВД,после чего объявил нарушителя в розыск")
			wait(1000)
			sampSendChat("/su " .. args)
		end)
	end
end

function cmd_rpunsu(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rpunsu [id игрока]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me достал КПК из внутреннего кармана")
			wait(1000)
			sampSendChat("/me открыл базу данных МВД, после чего вынес человека из розыска")
			wait(1000)
			sampSendChat("/unsu ".. args .." Ошибка КПК")
		end)
	end
end

function cmd_rpcuff(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rpcuff [id игрока]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me снял с пояса наручники и надел на руки нарушителя")
			wait(1000)
			sampSendChat("/cuff ".. args)
		end)
	end
end

function cmd_rpuncuff(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rpuncuff [id игрока]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me снял наручники с человека напротив")
			wait(1000)
			sampSendChat("/uncuff ".. args)
		end)
	end
end

function cmd_rpputm(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rpputm [id игрока]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me потащил преступника к дверям автомобиля")
			wait(1000)
			sampSendChat("/me наклоняя голову, посадил преступника в автомобиль")
			wait(1000)
			sampSendChat("/putm ".. args)
		end)
	end
end

function cmd_rparrest(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rparrest [id игрока]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me открыл бардачок и достал ручку")
			wait(1000)
			sampSendChat("/me записывает в протокол личные данные преступника")
			wait(1000)
			sampSendChat("/do Дело закрыто.")
			wait(1000)
			sampSendChat("/arrest ".. args)
		end)
	end
end

function cmd_rpticket(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rpticket [id игрока]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me достал квитанцию, затем ручку, после достал чек")
			wait(1000)
			sampSendChat("/me сверив данные человека, записал их в чек")
			wait(1000)
			sampSendChat("/me передал чек, с риквезитами для оплаты штрафа")
			wait(1000)
			sampSendChat("/ticket ".. args)
		end)
	end
end

function cmd_rpmiranda()
	if ScriptLogin == 0 then return false end
	lua_thread.create(function()
		wait(10)
		sampSendChat("Вы имеете право хранить молчание.")
		wait(1000)
		sampSendChat("Всё, что вы скажете, может и будет использовано против вас в суде.")
		wait(1000)
		sampSendChat("Ваш адвокат может присутствовать при допросе.")
		wait(1000)
		sampSendChat("Если вы не можете оплатить услуги адвоката, он будет предоставлен вам государством.")
		wait(1000)
		sampSendChat("У вас есть право на один телефонный звонок.")
	end)
end

function cmd_rppatrul(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}Используйте: /rppatrul [параметр]", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}1 - Начать патруль (Одиночный патрульный юнит)", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}2 - Начать патруль (Патрульный юнит с двумя людьми в машине)", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}3 - Перерыв")
	else
		if #args == 1 then
			sampSendChat("/r Начинаю патруль. Код: LINCOLN-1.")
		end
		if #args == 2 then
			sampSendChat("/r Начинаю патруль. Код: ADAM-1.")
		end
		if #args == 3 then
			sampSendChat("/r Заканчиваю патруль. Код: 7")
		end
	end
end
-- Команды (Конец)

function getLocalPlayerId()
	local _, id = sampGetPlayerIdByCharHandle(playerPed)
	return id
end

function getTableUsersByUrl(url)
    local n_file, bool, users = os.getenv('TEMP')..os.time(), false, {}
    downloadUrlToFile(url, n_file, function(id, status)
        if status == 6 then bool = true end
    end)
    while not doesFileExist(n_file) do wait(0) end
    if bool then
        local file = io.open(n_file, 'r')
        for w in file:lines() do
			-- Ник: Ранг: Организация: Дата окончания подписки
            local n, r, o, d = w:match('(.*): (.*): (.*): (.*)')
            users[#users+1] = { name = n, date = d }
			myRang = r
			myOrg = o
        end
        file:close()
        os.remove(n_file)
    end
    return bool, users
end

function isAvailableUser(users, name)
    for i, k in pairs(users) do
        if k.name == name then
            local d, m, y = k.date:match('(%d+)%.(%d+)%.(%d+)')
			sampAddChatMessage("", 0xFFFFFF)
			sampAddChatMessage(string.format("{3399FF}Подписка заканчивается: {FFFFFF}%d.%d.%d", d, m, y), 0xFFFFFF)
            local time = {
                day = tonumber(d),
                isdst = true,
                wday = 0,
                yday = 0,
                year = tonumber(y),
                month = tonumber(m),
                hour = 0
            }
            if os.time(time) >= os.time() then return true end
        end
    end
    return false
end

function ClearChat()
    local memory = require "memory"
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function CheckUpdate()
	local dlstatus = require('moonloader').download_status
	downloadUrlToFile(updatefile, thisScript().path, function(id, status)
	  if status == dlstatus.STATUS_ENDDOWNLOADDATA then
		thisScript():reload()
	  end
	end)
end

function CheckSub()
    local bool, users = getTableUsersByUrl(site)
    assert(bool, '\n\n\n\n{3399FF}[Police Helper] {FFFFFF}При закачке листа произошла ошибка.\n\n\n')
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    assert(isAvailableUser(users, sampGetPlayerNickname(myid)), string.format('\n\n\n\n{3399FF}[Police Helper] {FFFFFF}У Вас нет подписки либо Ваш срок подписки закончен.\n\n\n\n\n\n'))
end

function GetCoordinates()
	if isCharInAnyCar(playerPed) then
		local car = storeCarCharIsInNoSave(playerPed)
		return getCarCoordinates(car)
	else
		return getCharCoordinates(playerPed)
	end
end

function getserial()
    local ffi = require("ffi")
    ffi.cdef[[
    int __stdcall GetVolumeInformationA(
    const char* lpRootPathName,
    char* lpVolumeNameBuffer,
    uint32_t nVolumeNameSize,
    uint32_t* lpVolumeSerialNumber,
    uint32_t* lpMaximumComponentLength,
    uint32_t* lpFileSystemFlags,
    char* lpFileSystemNameBuffer,
    uint32_t nFileSystemNameSize
    );
    ]]
    local serial = ffi.new("unsigned long[1]", 0)
    ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
    return serial[0]
end