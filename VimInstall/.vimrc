call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'                     " 函数跳转
Plug 'jiangmiao/auto-pairs'                             " 自动补充括号
Plug 'tpope/vim-commentary'                             " comment
Plug 'octol/vim-cpp-enhanced-highlight'                 " cpp配色补充 
Plug 'Valloric/YouCompleteMe'                           " 补全
Plug 'Yggdroot/LeaderF'                                 " 模糊搜索
Plug 'easymotion/vim-easymotion'                        " 光标快速移动
Plug 'preservim/tagbar'                                 " 函数列表
Plug 'tpope/vim-fugitive'                               " git相关
Plug 'luochen1990/rainbow'                              " 括号颜色
Plug 'chiel92/vim-autoformat'                           " 格式化
Plug 'w0rp/ale'
call plug#end()

"============================================================="
"通用设置
"============================================================="
let mapleader=","                                      	" 定义leader键
set nocompatible	                                      " 设置不兼容原始vi键
set hlsearch	                                        	" 高亮显示搜索结果
set incsearch	                                        	" 开启实时搜索结果
set ignorecase                                       		" 搜索时大小写不敏感
set smartcase                                           " 智能大小写"
set tabstop=2	                                          " 设置编辑时制表符占用空格数
set softtabstop=2
set expandtab	                                        	" 将制表符扩展为空格
set shiftwidth=2                                        " 换行缩进
set autoindent                                          " 设置自动缩进
set cindent                                             " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0                             " 设置C/C++语言的具体缩进方式
set smartindent                                         " 智能的选择对其方式
set t_Co=256                                            " 开启256色支持
set number
set cursorline                                          " 高亮显示当前行
set ruler                                               " 总是显示光标位置
set laststatus=2                                        " 总是显示状态栏
set whichwrap+=<,>,h,l                                  " 设置光标键跨行
set ttimeoutlen=0                                       " 设置<ESC>键响应时间
set virtualedit=block,onemore                           " 允许光标出现在最后一个字符的后面"
filetype indent on                                      " 自适应不同语言的智能缩进
syntax enable
syntax on
filetype on                                             " 开启文件类型侦测
filetype plugin on                                      " 不同类型文件加载对应的插件

colorscheme neodark 
"编码操作"
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"窗口操作"
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap H 5h
nnoremap J 5j
nnoremap K 5k
nnoremap L 5l

"buffer操作"
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
nnoremap <leader>d :CloseBuffer<cr> 
command! -nargs=0 CloseBuffer :call <sid>close_current_buffer()
function! s:close_current_buffer()
  let cur=<sid>get_current_buffer_number()
  execute ":bd " . cur
endfunction

function! s:get_current_buffer_number()
  return bufnr("%")
endfunction

".vimrc"
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader><cr> :nohl<cr>

"代码补全“
set wildmenu
set completeopt-=preview

"============================================================="
"cpp_enhanced_highlight
"============================================================="
"高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_posix_standard = 1

"============================================================="
"vim_rainbow
"============================================================="
let g:rainbow_active = 1
let g:rainbow_conf = {
                        \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
                        \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
                        \ 'guis': [''],
                        \ 'cterms': [''],
                        \ 'operators': '_,_',
                        \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
                        \ 'separately': {
                        \   '*': {},
                        \   'markdown': {
                        \     'parentheses_options': 'containedin=markdownCode contained',
                        \   },
                        \   'lisp': {
                        \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
                        \   },
                        \   'haskell': {
                        \     'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
                        \   },
                        \   'vim': {
                        \     'parentheses_options': 'containedin=vimFuncBody'
                        \   },
                        \   'perl': {
                        \     'syn_name_prefix': 'perlBlockFoldRainbow',
                        \   },
                        \   'stylus': {
                        \     'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
                        \   },
                        \   'css': 0,
                        \   'nerdtree': 0,
                        \ }
                    \}

"============================================================="
"neadtree
"============================================================="
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

"==============================================================="
"nerdtree-git plugin
"==============================================================="
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }


"=============================================================="
"airline
"=============================================================="
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"=============================================================="
"gutentags
"=============================================================="
"gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


"=============================================================="
"YCM
"=============================================================="

" 如果不指定python解释器路径，ycm会自己搜索一个合适的(与编译ycm时使用的python版本匹配)
" let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_confirm_extra_conf = 0 
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_semantic_triggers =  {
"             \   'c' : ['->', '.','re![_a-zA-z0-9]'],
"             \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s',
" 're!^\s*[^\W\d]\w*\s',
"             \             're!\[.*\]\s'],
"             \   'ocaml' : ['.', '#'],
"             \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
"             \   'perl' : ['->'],
"             \   'php' : ['->', '::'],
"             \
" 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"             \   'ruby' : ['.', '::'],
"             \   'lua' : ['.', ':'],
"             \   'erlang' : [':'],
"             \ }
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>i :YcmCompleter GoToDefinition<cr> 
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
nmap <F5> :YcmDiags<cr>


"=============================================================="
"LeaderF
"=============================================================="

nnoremap <leader>f :Leaderf file<cr>
nnoremap <leader>rg :Leaderf rg<cr>
nnoremap <leader>rgw :Leaderf rg -w 
nnoremap <leader>b :Leaderf buffer<cr>
nnoremap <leader>F :Leaderf function<cr>
nnoremap <leader>m :Leaderf mru<cr>
" 如果一个目录含有任何具有list中指定的名字的子目录或者文件, 可以认定其为根目录. 搜索根目录的办法是, 1. 先找当前文件的所有祖先目录里最近的根目录, 如果找到就使用这个根目录为查找起点. (A的含义) 2. 如果没找到任何根目录, 看看当前打开的文件是否在VIM的工作目录(working directory)下, 或者任何其子目录下. 如果是, 就是用工作目录作为查找起点. (F的含义) 3. 如果当前文件不在工作目录和其后代目录下, 则以当前文件所在目录为查找起点.(default)
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0


"=============================================================="
"tagbar
"=============================================================="
let g:tagbar_width = 40
nnoremap <silent> <leader>t :TagbarToggle<cr>


"=============================================================="
"fugitive
"=============================================================="
nnoremap <silent> <leader>g :Git 

"=============================================================="
"auto-format
""=============================================================="
"let g:autoformat_verbosemode=0 "详细模式
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 1
"let g:autoformat_remove_trailing_spaces = 1
let g:formatdef_my_clang = '"clang-format -style=file"'
let g:formatters_c = ['my_clang']
let g:formatters_cpp = ['my_clang']

" 按下 F9，即可对用 vim 打开的当前文件使用自定义 style 文件 .clang-format 格式化代码（当前目录或者更上级目录要存在 .clang-format）
noremap <F9> :Autoformat<cr>
"保存时自动格式化指定文件类型代码
" au BufWrite *:Autoformat
" autocmd BufWrite *.c, *.py, *.cpp, *.cc:Autoformat " 设置发生保存事件时执行格式化


"=============================================================="
"ale"
""=============================================================="
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
""文件内容发生变化时不进行检查
"let g:ale_lint_on_text_changed = 'never'
""打开文件时不进行检查
"let g:ale_lint_on_enter = 0

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
            \ 'c': ['gcc', 'cppcheck'],
            \ 'cpp': ['g++', 'cppcheck'],
            \ }
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
