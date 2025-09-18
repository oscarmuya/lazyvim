return {
"pocco81/auto-save.nvim",
lazy = false,
config = function()
require("auto-save").setup({
enabled = true,
execution_message = {
message = function()
return "Saved at " .. vim.fn.strftime("%H:%M:%S")
end,
dim = 0.18,
cleaning_interval = 1250,
},
trigger_events = {"InsertLeave", "TextChanged"},
conditions = {
exists = true,
modifiable = true,
},
write_all_buffers = false,
debounce_delay = 135,
})
end,
}
