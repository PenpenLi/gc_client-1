
local AppBase = class("AppBase")

function AppBase:ctor(configs)
    self.configs_ = {
        viewsRoot  = "app.views",
        modelsRoot = "app.models",
        defaultSceneName = "LaunchScene",
    }

    for k, v in pairs(configs or {}) do
        self.configs_[k] = v
    end

    if type(self.configs_.viewsRoot) ~= "table" then
        self.configs_.viewsRoot = {self.configs_.viewsRoot}
    end
    if type(self.configs_.modelsRoot) ~= "table" then
        self.configs_.modelsRoot = {self.configs_.modelsRoot}
    end

    if DEBUG > 1 then
        dump(self.configs_, "AppBase configs")
    end

    if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end

    -- event
    self:onCreate()
end

function AppBase:run(initSceneName)
    initSceneName = initSceneName or self.configs_.defaultSceneName
    self:enterScene(initSceneName)
end

function AppBase:enterScene(sceneName, transition, time, more)
    local view = self:createView(sceneName)
    view:showWithScene(transition, time, more)
    return view
end

function AppBase:createView(name)
    local view = require(name..".lua")
    return view:create();
end

function AppBase:onCreate()
end

return AppBase
