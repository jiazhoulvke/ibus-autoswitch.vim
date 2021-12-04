插件会在进入normal模式自动切换到指定的输入法，并在进入插入模式时自动恢复之前的输入法。

插件仅支持ibus，如果用的是fcitx请使用[fcitx.vim](https://github.com/lilydjwg/fcitx.vim)

## 用法

请确保ibus设置了两个输入法，并且其中一个是`英语（美国）`，如果用的是别的layout，就需要修改`g:ibus_autoswitch_default_engine`。另一个输入法随意，我用的是Rime。

安装好本插件，比如用vim-plug:

```vim
Plug 'jiazhoulvke/ibus-autoswitch.vim'
```

接下来就可以用了。

## 配置

- `g:ibus_autoswitch_default_engine`  

  进入normal模式时启用的输入法，默认是`xkb:us::eng`，也就是英语（美国）

- `g:ibus_autoswitch_is_enabled`

  是否启用自动切换，如果为1则启用。默认为启用


## 小技巧
`ibus`不支持使用`Shift`切换输入法。我将ibus的快捷键设为`Ctrl+space`，然后用`xcape`这个软件将右`Shift`映射到`Ctrl+space`，间接达到用Shift切换输入法的目的。

xcape命令：

```bash
xcape -e 'Shift_R=Control_L|space'
```
