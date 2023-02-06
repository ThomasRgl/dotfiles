local ok, _ = pcall(require, 'shade')
if not ok then
	print 'shade not found!'
	return
end

require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-S-Up>',
    brightness_down  = '<C-S-Down>',
    toggle           = '<Leader>s',
  }
})
