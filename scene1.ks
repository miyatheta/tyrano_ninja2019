*start
[cm ]
[clearfix]
[start_keyconfig]
@call storage="macros.ks" target="*マクロ"

[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=340 top=480 width=610 height=150 color="0x696969" opacity=50 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="10" marginl="10" marginr="10" marginb="10"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

[chara_config pos_mode="false"]

;このゲームで登場するキャラクターを宣言
[chara_new  name="kunugi" storage="chara/kunugi/battle_stand.png" jname="なずな"  ]
;キャラクターの表情登録
[chara_face name="kunugi" face="seminude" storage="chara/kunugi/battle_stand_seminude.png"]
[chara_face name="kunugi" face="nude" storage="chara/kunugi/battle_stand_nude.png"]
[chara_mod name="kunugi" face="default"]
[chara_show  name="kunugi" layer=1 left="-20" top=50 ]


*incubation
;蟲の孵化イベント
[if exp="f.P_PARASITE_count > 19"]
[chara_hide name="kunugi"][wt7]
[jump storage="incubation.ks" target="*start" cond="f.P_PARASITE_count == 20"]
[endif]

*route_select

;easy-
ダミーが現れた[p]
[eval exp="tf.E_name='ダミー'"]
[eval exp="tf.E_HandlName='ダミー'"]
[eval exp="f.E_HP=2000 , f.E_STR=33 , f.E_DUR=31 , f.E_AGI=25 , f.E_DEX=32 , f.E_LUK=27"]
[eval exp="f.E_MND=25 , f.E_APP=25 , f.E_MGP=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=100 , f.E_SEX=33 , f.E_BND = 33 "]
@jump storage="battle.ks"
