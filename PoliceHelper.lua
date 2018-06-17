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
local imgui = require 'imgui'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
encoding.default = 'windows-1251'
u8 = encoding.UTF8

local ScriptLogin = 1;
local resgun = true;
local Version = "1.000";

local myRang = 0;
local myRang1 = "None";
local myOrg = "None";
local rang = "None";


function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	CheckSub()
	CheckUpdate()
	sampAddChatMessage(string.format("{FFFFFF}Police Helper {3399FF}������� ��������. �����������: {FFFFFF}Lawrence Inside aka Charles Waters"), 0xFFFFFF)
	sampAddChatMessage(string.format("{3399FF}��� ���� (����������� � ���� ������): {FFFFFF}%s", myRang), 0xFFFFFF)
	sampAddChatMessage(string.format("{3399FF}���� ����������� (����������� � ���� ������): {FFFFFF}%s", myOrg), 0xFFFFFF)
	sampAddChatMessage("{3399FF}���� ��� ����/�����������, �� ��������� � ������� ����, ����������� �������� � ���. ���������!", 0xFFFFFF)
	sampAddChatMessage("{3399FF}����� ���������� ��� ����������� �������, �������: {FFFFFF}/mvdhelp", 0xFFFFFF)
	sampAddChatMessage("", 0xFFFFFF)
	-- ������� (������)
	sampRegisterChatCommand("mvdhelp", cmd_mvdhelp)
	sampRegisterChatCommand("rpsu", cmd_rpsu)
	sampRegisterChatCommand("rpunsu", cmd_rpunsu)
	sampRegisterChatCommand("rpcuff", cmd_rpcuff)
	sampRegisterChatCommand("rpuncuff", cmd_rpuncuff)
	sampRegisterChatCommand("rpticket", cmd_rpticket)
	sampRegisterChatCommand("rpputm", cmd_rpputm)
	sampRegisterChatCommand("rparrest", cmd_rparrest)
	sampRegisterChatCommand("rpmiranda", cmd_rpmiranda)
    sampRegisterChatCommand('cc', function() ClearChat() end)
	sampRegisterChatCommand("rppatrul", cmd_rppatrul)
	sampRegisterChatCommand("hey", cmd_hi)
	-- ������� (�����)
	font1 = renderCreateFont("Arial", 9, 12)
    while true do wait(0)
		-- ���� � ������ ����� ����
		renderDrawBox(1130, 950, 1200, 85, 0x999999DD)
		renderDrawBox(1135, 955, 138, 66, 0xB4B4B4DD)
		renderFontDrawText(font1,'{3399FF}POLICE {AFAFAF}HELPER',1150, 960, -1)
		renderFontDrawText(font1,'______________',1150, 970, -1)
		renderFontDrawText(font1,string.format('������: %s', Version),1150, 990, -1)
		--renderFontDrawText(font1,'Developer:\n{3399FF}Lawrence Inside',1150, 989, -1)
	end
end

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0
    colors[clr.Text]            = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]        = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]            = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]        = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]            = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]            = colors[clr.PopupBg]
    colors[clr.Border]            = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]        = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]            = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]        = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]        = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]            = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]        = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]        = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.MenuBarBg]            = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]        = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]        = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]    = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CheckMark]            = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]            = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]            = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]        = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]            = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]        = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]            = colors[clr.Border]
    colors[clr.SeparatorHovered]        = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]            = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]    = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]        = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.CloseButton]        = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]    = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]        = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]        = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]    = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]        = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening]    = ImVec4(0.80, 0.80, 0.80, 0.35)

end

apply_custom_style()

local mvdsettings = imgui.ImBool(false)
function imgui.OnDrawFrame()
  local x, y = getScreenResolution()
  if mvdsettings.v then
    imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(900, 500), imgui.Cond.FirstUseEver)     
	imgui.Begin(u8('Police Helper'), mvdsettings)
    imgui.BeginChild('left pane', imgui.ImVec2(150, 0), true)
    if not selected then selected = 1 end
    if imgui.Selectable(u8('����������'), false) then selected = 1 end
    if imgui.Selectable(u8('���������'), false) then selected = 2 end
    imgui.EndChild()
    imgui.SameLine()
    imgui.BeginGroup()
    if selected == 1 then
		imgui.Text(string.format(u8'\t\t\t\t\tPolice Helper - ������������� ������ ��� ����������� ������� ������� Grand Role Play | Saturn\n\t\t\t\t\t����������� �������: Lawrence Inside aka Charles_Waters\n\t\t\t\t\t���������� ��� Grand Role Play\n\t\t\t\t\t������: %s\n\n\n\t\t\t\t\t\t\t\t\t\t������� �������:\n\n\t\t\t\t/mvdhelp - ��� ���������� � �������\n\t\t\t\t/rpsu - �������� ������ � ������\n\t\t\t\t/rpunsu - ������� ������ �� �������\n\t\t\t\t/rpcuff - ������ ��������� �� ������\n\t\t\t\t/rpuncuff - ����� ��������� � ������\n\t\t\t\t/rpputm - �������� ������ � ����������� ����������\n\t\t\t\t/rpticket - ������ ������ ������\n\t\t\t\t/rparrest - ���������� ������\n\t\t\t\t/rpmiranda - �������\n\t\t\t\t/cc - �������� ���\n\t\t\t\t/hey - �� ��������� (�����������, �������� ����������, �.�.�)', Version))
	end
    if selected == 2 then
		imgui.Text(u8'� ����������.')	
	end
    imgui.EndGroup()
    imgui.End()
  end
end

-- ������� (������)
function cmd_hi(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /hey [��������]", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}1 - �����������", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}2 - ���� ������� �� � �������", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}3 - ���� ������� � �������", 0x3399FF)
	else
		if args == "1" then
			lua_thread.create(function()
			sampSendChat(string.format("������������, ��� ��������� %s ������� �.San-Fierro Charles Waters!", myRang1))
			wait(1000)
			sampSendChat("/me ������� ������������� ���������� ������� �.San-Fierro")
			wait(1000)
			sampSendChat("���������� ���� ���������,��� �������� ��������.")
			end)
		end
		if args == "2" then
			sampSendChat("�� � �������! �� ���������� ��� ������, �����.")
		end
		if args == "3" then
			lua_thread.create(function()
			sampSendChat("/me ���������� ������� � ���� �������� ��������")
			wait(1000)
			sampSendChat("/me ������ ����� � �����������")
			wait(1000)
			sampSendChat("/do ������ ����� ��������� ��������������.")
			wait(1000)
			sampSendChat("/me ������ ����� � ������ ��������� �����������")
			wait(1000)
			sampSendChat("/me ������ ��������� � ����� ��������������")
			wait(1000)
			sampSendChat("/do ��������� � ������� �������� ��������� �� ��������.")
			wait(1000)
			sampSendChat("�� ���������� � ����������� ������� � ������ ���� ����������!")
			end)
		end
	end
end
function cmd_mvdhelp()
    mvdsettings.v = not mvdsettings.v
	imgui.Process = mvdsettings.v
end
function cmd_mvdhelp1()
	if ScriptLogin == 0 then return false end
	--if myRang == 1 then sampShowDialog(3, "{3399FF}Police {AFAFAF}Helper | {FFFFFF}����������", "{3399FF}Police Helper {FFFFFF}- ������������� ������ ��� ����������� ������� ������� {3399FF}Grand Role Play | Saturn\n{FFFFFF}����������� �������: {3399FF}Lawrence Inside aka Charles_Waters\n{FFFFFF}���������� ��� Grand Role Play\n������: {3399FF}" ..Version.. "\n\n\n\t\t\t\t\t{FFFFFF}������� �������:\n\n{3399FF}/mvdhelp {FFFFFF}- ��� ���������� � �������\n{3399FF}/rpmiranda {FFFFFF}- �������", "�������", "", 0) end
	--if myRang == 2 then sampShowDialog(3, "{3399FF}Police {AFAFAF}Helper | {FFFFFF}����������", "{3399FF}Police Helper {FFFFFF}- ������������� ������ ��� ����������� ������� ������� {3399FF}Grand Role Play | Saturn\n{FFFFFF}����������� �������: {3399FF}Lawrence Inside aka Charles_Waters\n{FFFFFF}���������� ��� Grand Role Play\n������: {3399FF}" ..Version.. "\n\n\n\t\t\t\t\t{FFFFFF}������� �������:\n\n{3399FF}/mvdhelp {FFFFFF}- ��� ���������� � �������\n{3399FF}/rpsu {FFFFFF}- �������� ������ � ������\n{3399FF}/rpunsu {FFFFFF}- ������� ������ �� �������\n{3399FF}/rpcuff {FFFFFF}- ������ ��������� �� ������\n{3399FF}/rpuncuff {FFFFFF}- ����� ��������� � ������\n{3399FF}/rpputm {FFFFFF}- �������� ������ � ����������� ����������\n{3399FF}/rpticket {FFFFFF}- ������ ������ ������\n{3399FF}/rparrest {FFFFFF}- ���������� ������\n{3399FF}/rpmiranda {FFFFFF}- �������", "�������", "", 0) end
	sampShowDialog(3, "{3399FF}Police {AFAFAF}Helper | {FFFFFF}����������", "{3399FF}Police Helper {FFFFFF}- ������������� ������ ��� ����������� ������� ������� {3399FF}Grand Role Play | Saturn\n{FFFFFF}����������� �������: {3399FF}Lawrence Inside aka Charles_Waters\n{FFFFFF}���������� ��� Grand Role Play\n������: {3399FF}" ..Version.. "\n\n\n\t\t\t\t\t{FFFFFF}������� �������:\n\n{3399FF}/mvdhelp {FFFFFF}- ��� ���������� � �������\n{3399FF}/rpsu {FFFFFF}- �������� ������ � ������\n{3399FF}/rpunsu {FFFFFF}- ������� ������ �� �������\n{3399FF}/rpcuff {FFFFFF}- ������ ��������� �� ������\n{3399FF}/rpuncuff {FFFFFF}- ����� ��������� � ������\n{3399FF}/rpputm {FFFFFF}- �������� ������ � ����������� ����������\n{3399FF}/rpticket {FFFFFF}- ������ ������ ������\n{3399FF}/rparrest {FFFFFF}- ���������� ������\n{3399FF}/rpmiranda {FFFFFF}- �������", "�������", "", 0)
end

function cmd_rpsu(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rpsu [id ������] [���-�� �����] [�������]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ������ ��� �� ����������� �������")
			wait(1000)
			sampSendChat("/me ������ ���� ������ ���,����� ���� ������� ���������� � ������")
			wait(1000)
			sampSendChat("/su " .. args)
		end)
	end
end

function cmd_rpunsu(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rpunsu [id ������]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ������ ��� �� ����������� �������")
			wait(1000)
			sampSendChat("/me ������ ���� ������ ���, ����� ���� ����� �������� �� �������")
			wait(1000)
			sampSendChat("/unsu ".. args .." ������ ���")
		end)
	end
end

function cmd_rpcuff(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rpcuff [id ������]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ���� � ����� ��������� � ����� �� ���� ����������")
			wait(1000)
			sampSendChat("/cuff ".. args)
		end)
	end
end

function cmd_rpuncuff(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rpuncuff [id ������]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ���� ��������� � �������� ��������")
			wait(1000)
			sampSendChat("/uncuff ".. args)
		end)
	end
end

function cmd_rpputm(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rpputm [id ������] [����� (1-3)]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ������� ����������� � ������ ����������")
			wait(1000)
			sampSendChat("/me �������� ������, ������� ����������� � ����������")
			wait(1000)
			sampSendChat("/putm ".. args)
		end)
	end
end

function cmd_rparrest(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rparrest [id ������]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ������ �������� � ������ �����")
			wait(1000)
			sampSendChat("/me ���������� � �������� ������ ������ �����������")
			wait(1000)
			sampSendChat("/do ���� �������.")
			wait(1000)
			sampSendChat("/arrest ".. args)
		end)
	end
end

function cmd_rpticket(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rpticket [id ������]", 0x3399FF)
	else
		lua_thread.create(function()
			wait(10)
			sampSendChat("/me ������ ���������, ����� �����, ����� ������ ���")
			wait(1000)
			sampSendChat("/me ������ ������ ��������, ������� �� � ���")
			wait(1000)
			sampSendChat("/me ������� ���, � ����������� ��� ������ ������")
			wait(1000)
			sampSendChat("/ticket ".. args)
		end)
	end
end

function cmd_rpmiranda()
	if ScriptLogin == 0 then return false end
	lua_thread.create(function()
		wait(10)
		sampSendChat("�� ������ ����� ������� ��������.")
		wait(1000)
		sampSendChat("��, ��� �� �������, ����� � ����� ������������ ������ ��� � ����.")
		wait(1000)
		sampSendChat("��� ������� ����� �������������� ��� �������.")
		wait(1000)
		sampSendChat("���� �� �� ������ �������� ������ ��������, �� ����� ������������ ��� ������������.")
		wait(1000)
		sampSendChat("� ��� ���� ����� �� ���� ���������� ������.")
	end)
end

function cmd_rppatrul(args)
	if ScriptLogin == 0 then return false end
	if #args == 0 then
		sampAddChatMessage("[Police Helper] {FFFFFF}�����������: /rppatrul [��������]", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}1 - ������ ������� (��������� ���������� ����)", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}2 - ������ ������� (���������� ���� � ����� ������ � ������)", 0x3399FF)
		sampAddChatMessage("[Police Helper] {FFFFFF}3 - �������")
	else
		if args == "1" then
			sampSendChat("/r ������� �������. ���: LINCOLN-1.")
		end
		if args == "2" then
			sampSendChat("/r ������� �������. ���: ADAM-1.")
		end
		if args == "3" then
			sampSendChat("/r ���������� �������. ���: 7")
		end
	end
end
-- ������� (�����)

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
			-- ���: ����: ����(������): �����������: ���� ��������� ��������
            local n, r, r1, o, d = w:match('(.*): (.*): (.*): (.*): (.*)')
            users[#users+1] = { name = n, date = d }
			myRang = r
			myRang1 = r1
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
			sampAddChatMessage(string.format("{3399FF}�������� �������������: {FFFFFF}%d.%d.%d", d, m, y), 0xFFFFFF)
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

function getUpdateByUrl(url)
    local n_file, bool, users = os.getenv('TEMP')..os.time(), false, {}
    downloadUrlToFile(url, n_file, function(id, status)
        if status == 6 then bool = true end
    end)
    while not doesFileExist(n_file) do wait(0) end
    if bool then
        local file = io.open(n_file, 'r')
        for w in file:lines() do
            local vn, textupd = w:match('versionnew: (.*): textupd: (.*)')
			if vn > Version then
				downloadUrlToFile(updatefile, 'moonloader\\PoliceHelper.lua')
				sampAddChatMessage("[Police Helper] {FFFFFF}����� ����� ���������� �������!", 0x3399FF)
				sampAddChatMessage(string.format("[Police Helper] {FFFFFF}%s", textupd), 0x3399FF)
				wait(1000)
				thisScript: reload()
			end
        end
        file:close()
        os.remove(n_file)
    end
    return bool, users
end

function CheckUpdate()
	local bool = getUpdateByUrl(update)
    assert(bool, '\n\n\n\n{3399FF}[Police Helper] {FFFFFF}��� ���������� �������, ��������� ������.\n\n\n')
end

function CheckSub()
    local bool, users = getTableUsersByUrl(site)
    assert(bool, '\n\n\n\n{3399FF}[Police Helper] {FFFFFF}��� ������� ����� ��������� ������.\n\n\n')
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    assert(isAvailableUser(users, sampGetPlayerNickname(myid)), string.format('\n\n\n\n{3399FF}[Police Helper] {FFFFFF}� ��� ��� �������� ���� ��� ���� �������� ��������.\n\n\n\n\n\n'))
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

function submenus_show(menu, caption, select_button, close_button, back_button)
    select_button, close_button, back_button = select_button or '�������', close_button or '�������', back_button or '�����'
    prev_menus = {}
    function display(menu, id, caption)
        local string_list = {}
        for i, v in ipairs(menu) do
            table.insert(string_list, type(v.submenu) == 'table' and v.title .. '  >>>' or v.title)
        end
        sampShowDialog(id, caption, table.concat(string_list, '\n'), select_button, (#prev_menus > 0) and back_button or close_button, sf.DIALOG_STYLE_LIST)
        repeat
            wait(0)
            local result, button, list = sampHasDialogRespond(id)
            if result then
                if button == 1 and list ~= -1 then
                    local item = menu[list + 1]
                    if type(item.submenu) == 'table' then
                        table.insert(prev_menus, {menu = menu, caption = caption})
                        if type(item.onclick) == 'function' then
                            item.onclick(menu, list + 1, item.submenu)
                        end
                        return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title)
                    elseif type(item.onclick) == 'function' then
                        local result = item.onclick(menu, list + 1)
                        if not result then return result end
                        return display(menu, id, caption)
                    end
                else
                    if #prev_menus > 0 then
                        local prev_menu = prev_menus[#prev_menus]
                        prev_menus[#prev_menus] = nil
                        return display(prev_menu.menu, id - 1, prev_menu.caption)
                    end
                    return false
                end
            end
        until result
    end
    return display(menu, 31337, caption or menu.title)
end