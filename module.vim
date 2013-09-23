call vice#Extend({
    \ 'ft_addons': {
        \ 'actionscript': [
            \ 'github:endel/actionscript.vim',
        \ ],
        \ 'brainfuck': [
           \ 'github:vim-scripts/brainfuck-syntax'
        \ ],
        \ 'css\|sass\|scss\|stylus': [
            \ 'github:hail2u/vim-css3-syntax',
        \ ],
        \ 'clojure': [
            \ 'github:guns/vim-clojure-static',
            \ 'github:kien/rainbow_parentheses.vim',
            \ 'github:vim-scripts/paredit.vim',
            \ 'github:tpope/vim-fireplace',
        \ ],
        \ 'coffee': [
            \ 'github:kchmck/vim-coffee-script',
        \ ],
        \ 'elixir': [
            \ 'github:elixir-lang/vim-elixir',
        \ ],
        \ 'go': [
            \ 'github:jnwhiteh/vim-golang',
        \ ],
        \ 'haml\|sass\|scss': [
            \ 'github:tpope/vim-haml',
        \ ],
        \ 'haskell': [
            \ 'github:wlangstroth/vim-haskell',
            \ 'github:zeekay/haskellmode-vim',
            \ 'github:bitc/vim-hdevtools',
        \ ],
        \ 'help': [
            \ 'github:juanpabloaj/help.vim',
	    \ ],
        \ 'html\|xhtml\|xml': [
            \ 'github:othree/html5.vim',
        \ ],
        \ 'jade': [
            \ 'github:digitaltoad/vim-jade',
        \ ],
        \ 'javascript': [
            \ 'github:zeekay/vim-js2coffee',
            \ 'github:jelera/vim-javascript-syntax',
            \ 'github:pangloss/vim-javascript',
        \ ],
        \ 'json': [
            \ 'github:elzr/vim-json',
        \ ],
        \ 'lua\|ruby\|sh\|vim\|zsh': [
            \ 'github:tpope/vim-endwise',
        \ ],
        \ 'markdown': [
            \ 'github:tpope/vim-markdown',
            \ 'github:zeekay/vim-instant-markdown',
        \ ],
        \ 'nginx': [
            \ 'github:thiderman/nginx-vim-syntax'
        \ ],
        \ 'python': [
            \ 'github:hynek/vim-python-pep8-indent',
            \ 'github:hdima/python-syntax',
            \ 'github:jmcantrell/vim-virtualenv',
        \ ],
        \ 'php': [
            \ 'github:spf13/PIV',
        \ ],
        \ 'scala': [
            \ 'github:derekwyatt/vim-scala',
        \ ],
        \ 'stylus': [
            \ 'github:wavded/vim-stylus',
        \ ],
    \ },
\ })

" Indent {{{
    au FileType xml,xhtml,htmldjango setl shiftwidth=4
    au FileType css,html,coffee,haml,stylus,jade,javascript setl shiftwidth=2
" }}}

" Enable omnicomplete {{{
    au FileType c setl omnifunc=ccomplete#Complete
    au FileType coffee,javascript setl omnifunc=javascriptcomplete#CompleteJS
    au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType php setl omnifunc=phpcomplete#CompletePHP
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby,eruby setl omnifunc=rubycomplete#Complete
    au FileType xhtml,html setl omnifunc=htmlcomplete#CompleteTags
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags
" }}}

" Detect filetypes {{{
    au BufNewFile,BufRead *.as set filetype=actionscript
    au BufNewFile,BufRead *.coffee,Cakefile set filetype=coffee
    au BufNewFile,BufRead *.go set filetype=go
    au BufNewFile,BufRead *.haml set filetype=haml
    au BufNewFile,BufRead *.jade set filetype=jade
    au BufNewFile,BufRead *.json set filetype=json
    au BufNewFile,BufRead *.sass set filetype=sass
    au BufNewFile,BufRead *.scss set filetype=scss
    au BufNewFile,BufRead *.scala set filetype=scala
    au BufNewFile,BufRead *.styl set filetype=stylus
    au BufNewFile,BufRead *.{brainfuck,bf} set filetype=brainfuck
    au BufNewFile,BufRead *.{ex,exs} set filetype=elixir
    au BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
    au BufNewFile,BufRead /etc/nginx/* set filetype=nginx
" }}}

" Clojure {{{
    " ugly hack to get tpope's vim-fireplace to load
    func! s:ClojureHack()
        if !exists('g:clojurehack_loaded')
            let g:clojurehack_loaded = 1
            so ~/.vim/addons/vim-fireplace/plugin/fireplace.vim
            so ~/.vim/addons/vim-fireplace/autoload/nrepl/fireplace_connection.vim
            set filetype=clojure
        endif
    endf
    au FileType clojure call s:ClojureHack()
" }}}

" CoffeeScript {{{
    au FileType coffee setl foldmethod=indent nofoldenable
    au FileType coffee setl nosmartindent
" }}}

" Haskell {{{
    let g:haddock_browser="open"
" }}}

" Javascript {{{
    au FileType javascript hi link javascriptBraces Text |
                         \ hi link javascriptParens Text |
                         \ hi link javaScriptOpSymbols Text |
                         \ hi link javaScriptEndColons Text |
                         \ hi link javaScriptExceptions Statement |
                         \ hi link javaScriptPrototype Text
" }}}

" JSON {{{
    au FileType json setl nobomb
    au FileType json setl conceallevel=0
" }}}

" Markdown {{{
    au FileType markdown set textwidth=80
" }}}

" Python {{{
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    let g:virtualenv_auto_activate = 1
    let g:virtualenv_directory = '~/ve'
    au FileType python setlocal nosmartindent
    au FileType python setlocal nocindent
" }}}
