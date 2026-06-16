return {
  "neoclide/coc.nvim",
  branch = "release",
  -- build 替代了以前的 run，在插件安装或更新时自动执行
  build = ":CocUpdate", 
  
  -- init 函数会在插件加载前执行，最适合放置 coc 的全局变量和按键映射
  init = function()
    -- 基础选项设置
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.updatetime = 300
    vim.opt.signcolumn = "yes"

    -- 快捷键映射辅助函数
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

    -- 1. 使用 <TAB> 触发补全并导航
    vim.keymap.set("i", "<TAB>", function()
      if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#next"](1)
      end
      -- 如果前一个字符是空白，则输入真正的 TAB
      local col = vim.fn.col(".") - 1
      if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return "<TAB>"
      end
      return vim.fn["coc#refresh"]()
    end, opts)

    -- 2. 使用 <S-TAB> 向上导航
    vim.keymap.set("i", "<S-TAB>", function()
      if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#prev"](1)
      end
      return "<S-TAB>"
    end, opts)

    -- 3. 使用 <CR> (回车) 确认补全
    vim.keymap.set("i", "<CR>", function()
      if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
      end
      return "<CR>"
    end, opts)

    -- 4. 使用 <C-space> 强制触发补全
    vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

    -- 5. 诊断跳转导航
    vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
    vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

    -- 6. 代码导航 (GoTo)
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

    -- 7. 使用 K 显示悬浮文档 (Hover)
    function _G.show_docs()
      local cw = vim.fn.expand("<cword>")
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. cw)
      elseif vim.fn["coc#rpc#ready"]() then
        vim.fn.CocActionAsync("doHover")
      else
        vim.cmd("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end
    vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
  end,
}
