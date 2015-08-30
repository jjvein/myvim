<h1>工欲善其事，必先利其器！</h1>

<h2>安装操作</h2>
执行命令<br>
    <ul>
        <li>git clone https://www.github.com/vein1992/myvim</li>
        <li>vim</li>
        <li>:PluginInstall(解释：通过vundle插件对其他插件管理)</li>
    </ul>  
<hr>

<h2>推荐插件</h2>
<pre>
<a href="https://www.github.com/suan/vim-instant-markdown">vim-instant-markdown</a>
<a href="https://www.github.com/scrolloose/nerdtree">nerdtree</a>
</pre>

<h3>Vundle配置</h3>
<pre>
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVime/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'suan/vim-instant-markdown'
call vundle#end()
filetype plugin indent on
</pre>
