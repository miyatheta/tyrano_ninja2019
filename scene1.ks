*start
[cm ]
[clearfix]
[start_keyconfig]
@call storage="macros.ks" target="*マクロ"

[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=20 top=420 width=920 height=200 page=fore visible=true]

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
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:一撃タイプ"  target="*easy-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*easy-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:拘束タイプ"  target="*easy-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:痴漢タイプ"  target="*easy-4"  ]
[s]

*easy-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*捨て身'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*捨て身' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*捨て身'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*轟爆斧'"]
@jump storage="battle.ks"

*easy-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*見切り'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
@jump storage="battle.ks"

*easy-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='拘束魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 32"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*組付' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
@jump storage="battle.ks"

*easy-4
;セクハラ攻撃主体。筒子
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=24 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=35 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*媚薬'"]
[eval exp="tf.E_skill21='*媚薬' , tf.E_skill22='*奇声' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*奇声' , tf.E_skill32='*媚薬' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*媚薬' , tf.E_skill42='*組付' , tf.E_skill43='*奇声'"]
[eval exp="tf.E_skill51='*奇声' , tf.E_skill52='*媚薬' , tf.E_skill53='*媚薬'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*怪奇剣'"]
@jump storage="battle.ks"

*normal
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:一撃タイプ"  target="*normal-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*normal-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:拘束タイプ"  target="*normal-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:セクハラタイプ"  target="*normal-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:特殊タイプ"  target="*normal-5"  ]
[s]

*normal-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*捨て身'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*捨て身' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*捨て身'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*轟爆斧'"]
@jump storage="battle.ks"

*normal-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*見切り'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
@jump storage="battle.ks"

*normal-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='拘束魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 32"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*組付' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
@jump storage="battle.ks"

*normal-4
;セクハラ。筒子
[eval exp="tf.E_name='痴漢魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*媚薬'"]
[eval exp="tf.E_skill21='*媚薬' , tf.E_skill22='*奇声' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*奇声' , tf.E_skill32='*媚薬' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*媚薬' , tf.E_skill42='*組付' , tf.E_skill43='*奇声'"]
[eval exp="tf.E_skill51='*奇声' , tf.E_skill52='*媚薬' , tf.E_skill53='*媚薬'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*怪奇剣'"]
@jump storage="battle.ks"

*normal-5
;特殊。三元牌
[eval exp="tf.E_name='呪術者2'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*吸収' , tf.E_skill12='*煙幕' , tf.E_skill13='*毒霧'"]
[eval exp="tf.E_skill21='*粘液' , tf.E_skill22='*毒霧' , tf.E_skill23='*煙幕'"]
[eval exp="tf.E_skill31='*吸収' , tf.E_skill32='*粘液' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*粘液' , tf.E_skill42='*組付' , tf.E_skill43='*毒霧'"]
[eval exp="tf.E_skill51='*毒霧' , tf.E_skill52='*粘液' , tf.E_skill53='*毒霧'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*波動A'"]
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
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*捨て身'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*捨て身' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*捨て身'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*轟爆斧'"]
@jump storage="battle.ks"

*hard-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*見切り'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
@jump storage="battle.ks"

*hard-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='拘束魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 32"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*組付' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
@jump storage="battle.ks"

*hard-4
;セクハラ。筒子
[eval exp="tf.E_name='痴漢魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*媚薬'"]
[eval exp="tf.E_skill21='*媚薬' , tf.E_skill22='*奇声' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*奇声' , tf.E_skill32='*媚薬' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*媚薬' , tf.E_skill42='*組付' , tf.E_skill43='*奇声'"]
[eval exp="tf.E_skill51='*奇声' , tf.E_skill52='*媚薬' , tf.E_skill53='*媚薬'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*怪奇剣'"]
@jump storage="battle.ks"

*hard-5
;特殊。三元牌
[eval exp="tf.E_name='呪術者3'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*吸収' , tf.E_skill12='*煙幕' , tf.E_skill13='*毒霧'"]
[eval exp="tf.E_skill21='*粘液' , tf.E_skill22='*毒霧' , tf.E_skill23='*煙幕'"]
[eval exp="tf.E_skill31='*吸収' , tf.E_skill32='*粘液' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*粘液' , tf.E_skill42='*組付' , tf.E_skill43='*毒霧'"]
[eval exp="tf.E_skill51='*毒霧' , tf.E_skill52='*粘液' , tf.E_skill53='*毒霧'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*波動A'"]
@jump storage="battle.ks"
@jump storage="battle.ks"
