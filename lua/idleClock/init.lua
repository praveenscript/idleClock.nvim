local M = {}


function M.setup(opts)
  opts = opts or {}

  local async = require("plenary.async")
  local floatingClock = require("idleClock.floatingClock")
  local startTimer = require("idleClock.startTimer")


  local idleTimeLimit = opts.idleTimeLimit or 30 -- time for the user idle start before logic begins
  local idleWaiting = 0
  local triggersCounts = 0


  local function startWaiting(triggerCount)
    async.run(function()
      while triggersCounts == triggerCount do
        async.util.sleep(6000) -- Every 6 seconds
        idleWaiting = idleWaiting + 6

        if triggerCount ~= triggersCounts then
          idleWaiting = 0
          break
        end
        if idleWaiting > idleTimeLimit then
          floatingClock.createBuffer()
          break
        end
      end
    end)
  end





  -- Reset on any user activity
  vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufWritePost", "TextChangedI" }, {
    callback = function()
      triggersCounts = triggersCounts + 1 -- increment every 1 time
      startWaiting(triggersCounts)
      -- print("Yo LOl", triggersCounts)
      startTimer.stop = true
      if floatingClock.created then
        floatingClock.close()
        floatingClock.created = false
      end
    end,
  })
end

return M
