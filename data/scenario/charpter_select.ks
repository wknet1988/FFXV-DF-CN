[_tb_system_call storage=system/_charpter_select.ks]

[cm]

; ---- FFXV 风格：菜单面板（ui_pane2）已合成进背景 bg_select.jpg
[bg  time="1000"  method="crossfade"  storage="bg_select.jpg"  ]
[playbgm  volume="50"  fadein="true"  time="1500"  loop="true"  storage="ffxv_piano_08.ogg"  ]

; ---- 标题：琥珀 + 宽字距（.select_title），在面板内居中
[ptext  name="select_title"  layer="2"  text="請選擇章節"  x="642"  y="190"  size="30"  color="0xE8A33D"  bold="bold"  shadow="0x000000"  align="center"  width="600"  time="1000"  ]

; ---- 章节菜单（FFXV 风格，面板内左对齐；size 18 保证最长条目不溢出面板）
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  storage="charpter1.ks"  size="18"  text="Charpter&nbsp;1&nbsp;《聖者的迷惘》&nbsp;亞丹"  x="680"  y="300"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  storage="charpter2.ks"  size="18"  text="Charpter&nbsp;2&nbsp;《終焉之始》&nbsp;阿拉尼婭"  x="680"  y="353"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  storage="charpter3.ks"  size="18"  text="Charpter&nbsp;3&nbsp;《邁向自由的抉擇》&nbsp;露娜芙蕾雅"  x="680"  y="406"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  storage="charpter4.ks"  size="18"  text="Charpter&nbsp;4&nbsp;《終結一劍》&nbsp;諾克提斯"  x="680"  y="459"  width=""  height=""  _clickable_img=""  ]
[glink  color="ffxv"  font_color="0xC9C3B6"  shadow="0x000000"  storage="scene1.ks"  size="18"  text="Extra&nbsp;番外"  x="680"  y="512"  width=""  height=""  _clickable_img=""  ]

; ---- 返回标题（FFXV 次级样式）
[glink  color="ffxv-back"  font_color="0x9B9488"  shadow="0x000000"  storage="title_screen.ks"  target="*start"  size="17"  text="返回標題"  x="680"  y="572"  width=""  height=""  _clickable_img=""  ]
[s  ]
