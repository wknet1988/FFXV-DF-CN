[_tb_system_call storage=system/_about.ks]

; ---- 清理 free 图层，避免从其他界面跳入时残留 glink 按钮
[cm]

; ---- FBI warning 风格：纯黑底 + 白字 + 顶部徽章，无背景插图
[bg  time="600"  method="crossfade"  storage="bg_dark.jpg"  ]
[freeimage  layer=2  time="0"  ]

; ---- 顶部琥珀徽章（居中 580,110 120x120）
[image  storage="ui_seal.png"  folder="image"  layer="2"  x="580"  y="110"  width="120"  height="120"  time="0"  ]

; ---- FBI warning 式大标题（白色宽字距，字距由 CSS class .fbi_title 提供）
[ptext  name="fbi_title"  layer="2"  color="0xFFFFFF"  size="40"  x="0"  width="1280"  align="center"  y="268"  bold="bold"  edge="undefined"  shadow="0x000000"  text="FAN-MADE&nbsp;WARNING"  ]

; ---- 中文副题（琥珀）
[ptext  layer="2"  color="0xE8A33D"  size="22"  x="0"  width="1280"  align="center"  y="336"  edge="undefined"  shadow="0x000000"  text="同 人 作 品 · 非 官 方"  ]

; ---- 免责正文（白字，逐行居中）
[ptext  layer="2"  color="0xD8D4C8"  size="20"  x="0"  width="1280"  align="center"  y="412"  edge="undefined"  shadow="0x000000"  text="本作为《最终幻想15：未来黎明》同人视觉小说，非 SQUARE ENIX 官方作品。"  ]
[ptext  layer="2"  color="0xD8D4C8"  size="20"  x="0"  width="1280"  align="center"  y="452"  edge="undefined"  shadow="0x000000"  text="本作与 SQUARE ENIX 无任何关联，不代表官方立场。"  ]
[ptext  layer="2"  color="0xD8D4C8"  size="20"  x="0"  width="1280"  align="center"  y="492"  edge="undefined"  shadow="0x000000"  text="全部角色、设定、音乐及图像版权归原作者与各自权利方所有。"  ]
[ptext  layer="2"  color="0xD8D4C8"  size="20"  x="0"  width="1280"  align="center"  y="532"  edge="undefined"  shadow="0x000000"  text="本作仅供学习交流使用，不用于任何商业用途。"  ]

; ---- 底部返回（FFXV 次级样式）
[glink  color="ffxv-back"  font_color="0x9B9488"  shadow="0x000000"  storage="title_screen.ks"  target="*start"  size="20"  text="Back"  x="618"  y="640"  width=""  height=""  _clickable_img=""  ]
[s  ]
