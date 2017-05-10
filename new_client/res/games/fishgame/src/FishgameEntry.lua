--
-- Author: dreamslin
-- Date: 2016-12-29 11:47:21
-- 游戏入口
--

local FishgameEntry = class("FishgameEntry")
local FishGameScene = import("FishGameScene")

import(".controller.FishGameManager")

--在切换场景之前会调用，用于游戏初始化
function FishgameEntry:ctor()
	--注册管理器
	local fishManager = FishGameManager:getInstance()
	GameManager:getInstance():getHallManager():setSubGameManager(fishManager)
end
--获取进入游戏场景需要预加载的资源数组，每个元素为完整路径
function FishgameEntry:getNeedPreloadResArray()
	-- body
	return FishGameScene.getNeedPreloadResArray()
end

function FishgameEntry:getStartScene()
	-- body
    local sceneLayer = FishGameScene:create()
	local scene = cc.Scene:create()
	scene:addChild(sceneLayer)
	return scene
	
end

return FishgameEntry