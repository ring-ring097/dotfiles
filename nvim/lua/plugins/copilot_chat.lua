require("CopilotChat").setup {
  debug = true, -- Enable debugging
}

-- バッファの内容全体を使って Copilot とチャットする
function CopilotChatBuffer()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end

-- :chat コマンドで Copilot とチャットする
vim.api.nvim_create_user_command('Chat', CopilotChatBuffer, {})
