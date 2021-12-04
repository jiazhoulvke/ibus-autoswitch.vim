if exists('g:loaded_ibus_autoswitch') || &cp
	finish
endif
let g:loaded_ibus_autoswitch = 1

if !exists('g:ibus_autoswitch_default_engine')
	let g:ibus_autoswitch_default_engine='xkb:us::eng'
endif

if !exists('g:ibus_autoswitch_is_enabled')
	let g:ibus_autoswitch_is_enabled=1
endif

if !exists('g:ibus_autoswitch_last_engine')
	let g:ibus_autoswitch_last_engine=''
endif

function! IBUSAutoSwitchInsertEnter()
	if g:ibus_autoswitch_is_enabled != 1
		return
	endif
	if g:ibus_autoswitch_last_engine != '' 
		call system('ibus engine ' . g:ibus_autoswitch_last_engine)
	endif
endfunction

function! IbusAutoSwitchInsertLeave()
	if g:ibus_autoswitch_is_enabled != 1
		return
	endif
	let g:ibus_autoswitch_last_engine = system('ibus engine')
	call system('ibus engine ' . g:ibus_autoswitch_default_engine)
endfunction

if g:ibus_autoswitch_is_enabled == 1
	augroup ibus
		au InsertEnter * call IBUSAutoSwitchInsertEnter()
		au InsertLeave * call IbusAutoSwitchInsertLeave()
	augroup END
endif
