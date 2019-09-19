nnoremap <silent> <leader>gm :tab split<CR>:Glistmod<CR>
nnoremap <silent> <c-s-j> :call g:DiffNextLoc()<CR>
nnoremap <silent> <c-s-k> :call g:DiffPrevLoc()<CR>

command! Glistmod only | call g:ListModified() | Gdiff
function! g:ListModified()
	let old_makeprg=&makeprg
	let old_errorformat=&errorformat
	let &makeprg = "git ls-files -m"
	let &errorformat="%f"
	lmake
	let &makeprg=old_makeprg
	let &errorformat=old_errorformat
endfunction

function! g:DiffNextLoc()
	windo set nodiff
	only
	lnext
	Gdiff
endfunction

function! g:DiffPrevLoc()
	windo set nodiff
	only
	lprevious
	Gdiff
endfunction
