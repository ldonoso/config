--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
    -- Sync clipboard between OS and Neovim. Remove this option if you want your OS clipboard to remain independent.
    vim.opt.clipboard = 'unnamedplus'
end)

-- WSL clipboard provider. Not required
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
