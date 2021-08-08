" Git Fugitive
nmap <leader>gs  :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gb :Git branch<CR>
nmap <leader>gp :lua vim.api.nvim_command("Git push origin " .. vim.fn.input("Push branch > "))<CR>
nmap <leader>gph :Git push origin HEAD<CR>
nmap <leader>gpp :lua vim.api.nvim_command("Git pull origin " .. vim.fn.input("Pull branch > "))<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gcc :lua vim.api.nvim_command("Git checkout " .. vim.fn.input("Branch to checkout > "))<CR>
nmap <leader>gccb :lua vim.api.nvim_command("Git checkout -b " .. vim.fn.input("Branch to heckout (-b) > "))<CR>
