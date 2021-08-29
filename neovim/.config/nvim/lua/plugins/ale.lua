vim.g.ale_warn_about_trailing_whitespace = 1
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
vim.g.ale_set_highlights = 0
vim.g.ale_sign_column_always = 1

vim.g.ale_python_auto_pipenv = 1
vim.g.ale_python_mypy_auto_pipenv = 1

vim.g.ale_completion_enabled = 1

vim.g.ale_linters = {
  python = {'flake8',},
}
