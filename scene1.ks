*start
[cm ]
[clearfix]
[start_keyconfig]
[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=20 top=400 width=920 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

[chara_config pos_mode="false"]

;このゲームで登場するキャラクターを宣言
[chara_new  name="kunugi" storage="chara/kunugi/battle_stand.png" jname="くぬぎ"  ]
;キャラクターの表情登録
[chara_face name="kunugi" face="seminude" storage="chara/kunugi/battle_stand_seminude.png"]
[chara_face name="kunugi" face="nude" storage="chara/kunugi/battle_stand_nude.png"]
[chara_mod name="kunugi" face="default"]

[chara_show  name="kunugi" left=0 top=50 ]

*route_select
ルートを選びます[p]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="かんたん"  target="*easy"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="ふつう"  target="*normal"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="むずかしい"  target="*hard"  ]
[s]

*easy
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:遅延タイプ"  target="*easy-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*easy-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:特殊削りタイプ"  target="*easy-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:拘束タイプ"  target="*easy-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:セクハラタイプ"  target="*easy-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="6:一発屋タイプ"  target="*easy-6"  ]
[s]

*easy-1
[eval exp="tf.E_name='遅延魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]
@jump storage="battle.ks"

*easy-2
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]

@jump storage="battle.ks"

*easy-3
[eval exp="tf.E_name='特殊魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]

@jump storage="battle.ks"

*easy-4
[eval exp="tf.E_name='拘束魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 38"]

@jump storage="battle.ks"

*easy-5
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]

@jump storage="battle.ks"

*easy-6
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"


*normal
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:遅延タイプ"  target="*normal-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*normal-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:特殊削りタイプ"  target="*normal-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:拘束タイプ"  target="*normal-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:セクハラタイプ"  target="*normal-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="6:一発屋タイプ"  target="*normal-6"  ]
[s]

*normal-1
@jump storage="battle.ks"

*normal-2
@jump storage="battle.ks"

*normal-3
@jump storage="battle.ks"

*normal-4
@jump storage="battle.ks"

*normal-5
@jump storage="battle.ks"

*normal-6
@jump storage="battle.ks"



*hard
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:遅延タイプ"  target="*hard-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*hard-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:特殊削りタイプ"  target="*hard-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:拘束タイプ"  target="*hard-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:セクハラタイプ"  target="*hard-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="6:一発屋タイプ"  target="*hard-6"  ]
[s]

*hard-1
[eval exp="tf.E_name='遅延魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=25 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
@jump storage="battle.ks"


*hard-2
@jump storage="battle.ks"

*hard-3
@jump storage="battle.ks"

*hard-4
@jump storage="battle.ks"

*hard-5
@jump storage="battle.ks"

*hard-6
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=3000 , f.E_STR=40 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"

*hard-7
[eval exp="tf.E_name='魔人'"]
[eval exp="f.E_HP=5000 , f.E_STR=40 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"
