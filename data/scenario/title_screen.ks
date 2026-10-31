[_tb_system_call storage=system/_title_screen.ks]

[hidemenubutton]

[tb_clear_images]

[tb_keyconfig  flag="0"  ]
[tb_hide_message_window  ]

; ---- FFXV 风格首屏：不带菜单面板（ui_pane 面板烘焙在 bg_title_menu.jpg 里）
; ---- 按惯例，主菜单框架在点击之后才出现。
[bg  storage="bg_title_start.jpg"  cross="true"  time="0"  method="fadeIn"  ]

*title

; ---- 浏览器自动播放策略：首次播放 BGM 前必须有一次用户手势。
; ---- 全宽点击条（宽 1280）：点画面任意横向位置都能开始；文字在条内居中。
; ---- 按钮样式见 ffxv_ui.css 的 .ffxv-gate（琥珀 + 呼吸脉冲 + 下划发丝线）。
[glink  color="ffxv-gate"  font_color="0xFFC55C"  shadow="0x000000"  text="CLICK&nbsp;TO&nbsp;START"  x="0"  y="608"  size="22"  target="*start"  width="1280"  height="46"  _clickable_img=""  ]
[s  ]

*start

; ---- 从 about / charpter_select 等界面跳回 *start 时会跳过文件头的
; ---- [tb_clear_images]，导致上一层画在 free 层（layer 2）的文字/图片残留。
; ---- 在这里统一清理 layer 2，再恢复标题背景。
[freeimage  layer=2  time="0"  ]
[bg  storage="bg_title_menu.jpg"  time="600"  method="crossfade"  ]
[playbgm  volume="80"  time="0"  loop="true"  storage="ffxv_piano_08.ogg"  ]

[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  text="New&nbsp;Game"  x="756"  y="340"  size="22"  target="*start_game"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  text="Load&nbsp;Game"  x="756"  y="396"  size="22"  target="*load"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  text="Charpter&nbsp;Select"  x="756"  y="452"  size="22"  storage="charpter_select.ks"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  text="About"  x="756"  y="508"  size="22"  storage="about.ks"  width=""  height=""  _clickable_img=""  ]
[s  ]

*start_game

; ---- 右下角三道杠主菜单按钮已停用（功能由消息窗底部五按钮 + 右键菜单覆盖）

[cm  ]
[tb_keyconfig  flag="1"  ]
[stopbgm  time="1000"  ]
[jump  storage="opening.ks"  target=""  ]
[s  ]

*load

[cm  ]
[showload]

; 取消读档后直接回到菜单（音频此时已就绪，无需再次点击门控）
[jump  target="*start"  storage=""  ]
[s  ]
