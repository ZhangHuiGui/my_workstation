local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.clangd.setup {
--   cmd = {
--     -- "/opt/homebrew/Cellar/llvm@15/15.0.7/bin/clangd", -- NOTE: 只支持clangd 13.0.0 及其以下版本，新版本会有问题
--     "/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin/clangd",
--     -- "/opt/homebrew/opt/llvm@15/bin/clangd",
--     "--offset-encoding=utf-32",
--     "--background-index", -- 后台建立索引，并持久化到disk
--     "--clang-tidy", -- 开启clang-tidy
--     -- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
--     -- "--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
--     -- "--completion-style=detailed",
--     "--cross-file-rename=true",
--     "--header-insertion=iwyu",
--     "--pch-storage=memory",
--     -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
--     "--function-arg-placeholders=false",
--     -- "--log=verbose",
--     -- "--ranking-model=decision_forest",
--     -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
--     "--header-insertion-decorators",
--     "-j=12",
--     "--pretty",
--   },
-- }

--
-- lspconfig.pyright.setup { blabla}
