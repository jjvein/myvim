"Jjvein 的配置文件
set hls "搜索高亮
set ru  "底部标尺
set number "设置行号
set is "输入搜索命令时， 显示匹配位置
set paste "允许粘贴. 
set ignorecase "忽略大小写
set enc=utf-8 "文件保存时编码
set fileencodings=utf-8,gbk "打开文件时的猜测
set ff=unix "文件默认格式
set tabstop=4 "tab 缩进为4个空格
set shiftwidth=4 "自动缩进时使用4个空格
set softtabstop=4 "编辑插入时， 把tab算作4个空格
set expandtab "缩进使用空格, 如果想要真的使用tab， c-v + tab, 这时就能够显示tab命令。 
set autoindent "自动缩进
set mouse=a "鼠标捕获
syntax on "打开语法高亮
set showtabline=2  "总是显示标签栏
set backspace=indent,eol,start "设置backspace 可以删除行首
set list listchars=tab:>-  "将tab显示为这种样式。。

" map tab 相关的, 想找那种可以获取数字的变量， 这样就不用配置这么多了。。
map sh gt
map sl gT
map 1 1gt
map 2 2gt
map 3 3gt
map 4 4gt
map 5 5gt
" 关闭当前的窗口
map sc :tabc<CR>
" 列出所有的tabs
map ss :tabs<CR>
nmap td :tabnew .<cr>
vmap <buffer> ,w :w! ~/tmp.file<CR>
map ,p :r ~/tmp.file<CR>
let mapleader="," "一定要设置这个变量， 然后可以在普通模式<ESC> 下动态加载.vimrc
nmap <leader>s :source ~/.vimrc<CR>
nmap <leader>e :e ~/.vimrc<CR> 
nmap <leader>w :w!<CR> "强制保存
nmap <leader>q :q!<CR> ",q 不保存退出
nmap <leader>n :set nu!<CR>
nmap <leader>i :NERDTreeToggle<CR>
nmap <leader>l <C-w>l<CR>
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j<CR>
nmap <leader>k <C-w>k<CR>


"下面是Vunle 的配置文件
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVime/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'msanders/snipmate.vim'
call vundle#end()
filetype plugin indent on

"nerdtree 配置
let NERDTreeWinPos='left'
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"这个函数是在visual模式下对选中的内容进行blame操作。 
function! GitBlame() range 
    let beg_line = line("'<")
    let end_line = line("'>")
    exec '!git blame -L ' . beg_line . ',' . end_line . ' %'
endfunction 
vnoremap <leader>g :call GitBlame()<CR>
"对当前行进行blame操作。 
nnoremap <leaderg :exec '!git blame -L ' . line('.') . ',' . line('.') . ' %'<CR>

set cursorline  "当前行带有下划线。
"visual 模式下， 修改缩进不改变模式
vnoremap < <gv
vnoremap > >gv
