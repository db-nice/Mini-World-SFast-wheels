
--本代码使用Apache LICENSE 2.0协议进行保护
--如需使用代码你将需在地图可视化UI界面的开源列表中标明我的Github地址
--著作者:深圳市迷你玩科技有限公司旗下迷你世界_游戏UID为:442775118
--在可视化UI界面列表中您可以简化仅 标明著作者UID 以及项目地址db-nice/Mini-World-SFast-wheels
--项目地址:https://github.com/db-nice/Mini-World-SFast-wheels
--文件:https://github.com/db-nice/Mini-World-SFast-wheels/blob/main/lua/帧式/图片帧动画.lua
--转载需标明出处

local imgurl = [[8_1728243931_1701098652]]--图片地址
local imgentid = [[7369833010268661979_2]]--控件id
local imagwidth = 740 --总图片像素宽度
local imagheight = 740--总图片像素高度

local imgWidth, imgHeight = 72, 72--每帧图片长宽
local columns, rows = 10, 10 --行和列

local imagePositions = {
  loading = {}  -- Initialize the nested table
}

local margin = 1  -- layout_margin

-- 初始化时检查表中是否已经有计算过的值，没有则计算并保存,此处可作为预加载每一帧位置
for i = 1, 99 do
  if not imagePositions["loading"][i] then
    imagePositions["loading"][i] = {x = 0, y = 0}  -- Use a default value
    local colIndex = (i - 1) % columns
    local rowIndex = math.floor((i - 1) / columns)
    local x = margin + colIndex * (imgWidth + 2)
    local y = margin + rowIndex * (imgHeight + 2)
    imagePositions["loading"][i] = {x = x, y = y}
  end
end




local function Game_UI_show(event)
  Customui:setTexture(event.eventobjid, event.CustomUI, imgentid, imgurl)
  Customui:setSize(event.eventobjid, event.CustomUI, imgentid, imagwidth, imagheight)

  local xOffset, yOffset = 0, 0

  for i = 1, 99 do
    local position = imagePositions["loading"][i]
    Trigger:wait(0.02)
    Customui:setPosition(event.eventobjid, event.CustomUI, imgentid, "-" .. xOffset + position.x, "-" .. yOffset + position.y)
  end
end

ScriptSupportEvent:registerEvent([=[UI.Show]=], Game_UI_show)
