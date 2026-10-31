;メッセージレイヤの定義

		[position width=1280 height=720 top=0 left=0 frame="mw_gradient.png"]


		[position page=fore margint=430 marginl=64 marginr=64 marginb=40 vertical=false ]

		;キャラクター名板：FFXV 琥珀色（字距由 .chara_name_area CSS 控制）
		[ptext name="chara_name_area" layer="message0" color=0xE8A33D size=26 x=74 y=398 bold="bold" edge="undefined" shadow="0x000000"]

		;キャラクターの表示モードに関する定義
		[chara_config ptext="chara_name_area" pos_mode=true time="600" memory="false" anim="true" effect="easeInQuad" pos_change_time="600" ]

		;キャラクターフォーカスなど
		[chara_config  talk_focus="none" ]

		;クリック待ちボタンについて（FFXV 琥珀 ▼：tyrano/images/system/ui_next.png）
		[glyph fix="false" left="0" top="0" line="ui_next.png" ]



		;CG・回想用の共通項目
		[eval exp="sf._tb_cg_noimage='noimage.png'" ]
		[eval exp="sf._tb_replay_noimage='noimage.png'" ]

		;ふきだし用の設定（message1）
		[position layer="message1" width=1280 height=720 top=0 left=0 frame="mw_gradient.png"]
		[position layer="message1" page=fore margint=5 marginl=10 marginr=10 marginb=10 vertical=false ]

		;---- 剧情控制小按钮（fix 层，随消息窗显隐；[cm] 清不掉）
		;---- role 由引擎处理开关与激活态；autoimg / skipimg = 开启后的高亮图
		;---- TITLE（房子图标）= role="title" → kag.backTitle()：弹确认框后回标题页
		;---- SAVE / LOAD 直接开存档界面；CONFIG 经 sleepgame 进 config.ks（[awakegame] 返回）
		[button graphic="ui_btn_title.png" enterimg="ui_btn_title_hover.png" role="title" x="784" y="690" width="62" height="24" visible="false" ]
		[button graphic="ui_btn_save.png" enterimg="ui_btn_save_hover.png" role="save" x="858" y="690" width="62" height="24" visible="false" ]
		[button graphic="ui_btn_load.png" enterimg="ui_btn_load_hover.png" role="load" x="932" y="690" width="62" height="24" visible="false" ]
		[button graphic="ui_btn_config.png" enterimg="ui_btn_config_hover.png" role="sleepgame" storage="config.ks" x="1006" y="690" width="62" height="24" visible="false" ]
		[button graphic="ui_btn_auto.png" enterimg="ui_btn_auto_hover.png" autoimg="ui_btn_auto_on.png" role="auto" x="1080" y="690" width="62" height="24" visible="false" ]
		[button graphic="ui_btn_skip.png" enterimg="ui_btn_skip_hover.png" skipimg="ui_btn_skip_on.png" role="skip" x="1154" y="690" width="62" height="24" visible="false" ]

