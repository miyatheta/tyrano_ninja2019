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


*incubation
;蟲の孵化イベント
[if exp="f.P_PARASITE_count > 19"]
[chara_hide name="kunugi"][wt7]
[jump storage="incubation.ks" target="*start" cond="f.P_PARASITE_count == 20"]
[endif]

*route_select
ルートを選びます[p]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="かんたん"  target="*easy"  ]
;[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="ふつう"  target="*normal"  ]
;[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="むずかしい"  target="*hard"  ]
[s]

*easy
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:一撃タイプ"  target="*easy-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*easy-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:長期戦タイプ"  target="*easy-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:痴漢タイプ"  target="*easy-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="戻る"  target="*start"  ]
[s]

[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=23 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28 "]

*easy-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=23 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28 "]
;スキル1
[eval exp="tf.E_skill_A='*全力' , tf.E_skill_B='*集中' , tf.E_skill_C='*激怒'"]
;攻撃
[eval exp="tf.E_Attack11='*E_通常攻撃1' , tf.E_Attack12='*E_通常攻撃2' , tf.E_Attack13='*E_特殊攻撃1' , tf.E_Attack14='*E_組付攻撃' , tf.E_Attack15='*E_通常攻撃1' "]
[eval exp="tf.E_Attack21='*E_通常攻撃2' , tf.E_Attack22='*E_通常攻撃1' , tf.E_Attack23='*E_組付攻撃' , tf.E_Attack24='*E_特殊攻撃1' , tf.E_Attack25='*E_通常攻撃2' "]
[eval exp="tf.E_Attack31='*E_通常攻撃1' , tf.E_Attack32='*E_通常攻撃2' , tf.E_Attack33='*E_組付攻撃' , tf.E_Attack34='*E_特殊攻撃1' , tf.E_Attack35='*E_組付攻撃' "]
[eval exp="tf.E_Attack41='*E_特殊攻撃1' , tf.E_Attack42='*E_通常攻撃2' , tf.E_Attack43='*E_通常攻撃1' , tf.E_Attack44='*E_組付攻撃' , tf.E_Attack45='*E_特殊攻撃1' "]
[eval exp="tf.E_Attack51='*E_通常攻撃2' , tf.E_Attack52='*E_組付攻撃' , tf.E_Attack53='*E_通常攻撃2' , tf.E_Attack54='*E_通常攻撃1' , tf.E_Attack55='*E_通常攻撃1' "]

[eval exp="tf.E_特殊攻撃1='*気迫' "]
[eval exp="tf.E_組付攻撃='*組付' , tf.E_組付攻撃_rate = 1.0 , tf.E_組付攻撃_acc = 30 , tf.E_組付攻撃_crt = 1 "]
[eval exp="tf.E_通常攻撃1='*薙ぎ払い' , tf.E_通常攻撃1_name = '薙ぎ払い' , tf.E_通常攻撃1_rate = 5.0 , tf.E_通常攻撃1_acc = 30 , tf.E_通常攻撃1_crt = 1 "]
[eval exp="tf.E_通常攻撃2='*斬り落とし' , tf.E_通常攻撃2_name = '斬り落とし' , tf.E_通常攻撃2_rate = 8.5 , tf.E_通常攻撃2_acc = 0 , tf.E_通常攻撃2_crt = 1 "]
[eval exp="tf.E_必殺攻撃='*大木断' , tf.E_必殺攻撃_name = '大木断' , tf.E_必殺攻撃_rate = 8.5 , tf.E_必殺攻撃_acc = 50 , tf.E_必殺攻撃_crt = 1 "]
@jump storage="battle.ks"

*easy-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=23 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28 "]
;スキル1
[eval exp="tf.E_skill_A='*集中' , tf.E_skill_B='*見切り' , tf.E_skill_C='*気合'"]
;攻撃
[eval exp="tf.E_Attack11='*E_通常攻撃1' , tf.E_Attack12='*E_特殊攻撃1' , tf.E_Attack13='*E_通常攻撃2' , tf.E_Attack14='*E_組付攻撃' , tf.E_Attack15='*E_通常攻撃1' "]
[eval exp="tf.E_Attack21='*E_通常攻撃2' , tf.E_Attack22='*E_通常攻撃1' , tf.E_Attack23='*E_組付攻撃' , tf.E_Attack24='*E_特殊攻撃1' , tf.E_Attack25='*E_通常攻撃2' "]
[eval exp="tf.E_Attack31='*E_通常攻撃1' , tf.E_Attack32='*E_組付攻撃' , tf.E_Attack33='*E_通常攻撃2' , tf.E_Attack34='*E_特殊攻撃1' , tf.E_Attack35='*E_組付攻撃' "]
[eval exp="tf.E_Attack41='*E_特殊攻撃1' , tf.E_Attack42='*E_通常攻撃2' , tf.E_Attack43='*E_通常攻撃1' , tf.E_Attack44='*E_組付攻撃' , tf.E_Attack45='*E_特殊攻撃1' "]
[eval exp="tf.E_Attack51='*E_特殊攻撃1' , tf.E_Attack52='*E_通常攻撃1' , tf.E_Attack53='*E_通常攻撃1' , tf.E_Attack54='*E_通常攻撃2' , tf.E_Attack55='*E_通常攻撃1' "]

[eval exp="tf.E_特殊攻撃1='*気迫' "]
[eval exp="tf.E_組付攻撃='*組付' , tf.E_組付攻撃_rate = 1.0 , tf.E_組付攻撃_acc = 30 , tf.E_組付攻撃_crt = 1 "]
[eval exp="tf.E_通常攻撃1='*打ち払い' , tf.E_通常攻撃1_name = '打ち払い' , tf.E_通常攻撃1_rate = 5.0 , tf.E_通常攻撃1_acc = 30 , tf.E_通常攻撃1_crt = 1 "]
[eval exp="tf.E_通常攻撃2='*乱れ突き' , tf.E_通常攻撃2_name = '乱れ突き' , tf.E_通常攻撃2_rate = 8.5 , tf.E_通常攻撃2_acc = 0 , tf.E_通常攻撃2_crt = 1 "]
[eval exp="tf.E_必殺攻撃='*旋風棍' , tf.E_必殺攻撃_name = '旋風棍' , tf.E_必殺攻撃_rate = 8.5 , tf.E_必殺攻撃_acc = 50 , tf.E_必殺攻撃_crt = 1 "]
@jump storage="battle.ks"

*easy-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='時間稼'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=23 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28 "]
;スキル1
[eval exp="tf.E_skill_A='*剛体' , tf.E_skill_B='*全力' , tf.E_skill_C='*気合'"]
;攻撃
[eval exp="tf.E_Attack11='*E_通常攻撃1' , tf.E_Attack12='*E_特殊攻撃1' , tf.E_Attack13='*E_通常攻撃2' , tf.E_Attack14='*E_組付攻撃' , tf.E_Attack15='*E_通常攻撃1' "]
[eval exp="tf.E_Attack21='*E_通常攻撃2' , tf.E_Attack22='*E_通常攻撃1' , tf.E_Attack23='*E_組付攻撃' , tf.E_Attack24='*E_特殊攻撃1' , tf.E_Attack25='*E_通常攻撃2' "]
[eval exp="tf.E_Attack31='*E_通常攻撃1' , tf.E_Attack32='*E_組付攻撃' , tf.E_Attack33='*E_通常攻撃2' , tf.E_Attack34='*E_特殊攻撃1' , tf.E_Attack35='*E_組付攻撃' "]
[eval exp="tf.E_Attack41='*E_特殊攻撃1' , tf.E_Attack42='*E_通常攻撃2' , tf.E_Attack43='*E_通常攻撃1' , tf.E_Attack44='*E_組付攻撃' , tf.E_Attack45='*E_特殊攻撃1' "]
[eval exp="tf.E_Attack51='*E_特殊攻撃1' , tf.E_Attack52='*E_通常攻撃1' , tf.E_Attack53='*E_通常攻撃1' , tf.E_Attack54='*E_通常攻撃2' , tf.E_Attack55='*E_通常攻撃1' "]

[eval exp="tf.E_特殊攻撃1='*気迫' "]
[eval exp="tf.E_組付攻撃='*組付' , tf.E_組付攻撃_rate = 1.0 , tf.E_組付攻撃_acc = 30 , tf.E_組付攻撃_crt = 1 "]
[eval exp="tf.E_通常攻撃1='*正拳突き' , tf.E_通常攻撃1_name = '正拳突き' , tf.E_通常攻撃1_rate = 5.0 , tf.E_通常攻撃1_acc = 30 , tf.E_通常攻撃1_crt = 1 "]
[eval exp="tf.E_通常攻撃2='*飛び蹴り' , tf.E_通常攻撃2_name = '飛び蹴り' , tf.E_通常攻撃2_rate = 8.5 , tf.E_通常攻撃2_acc = 0 , tf.E_通常攻撃2_crt = 1 "]
[eval exp="tf.E_必殺攻撃='*青龍拳' , tf.E_必殺攻撃_name = '青龍拳' , tf.E_必殺攻撃_rate = 8.5 , tf.E_必殺攻撃_acc = 50 , tf.E_必殺攻撃_crt = 1 "]
@jump storage="battle.ks"

*easy-4
;セクハラ攻撃主体。筒子
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=23 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28 "]
;スキル1
[eval exp="tf.E_skill_A='*視姦' , tf.E_skill_B='*挑発' , tf.E_skill_C='*気合'"]
;攻撃
[eval exp="tf.E_Attack11='*E_通常攻撃1' , tf.E_Attack12='*E_組付攻撃' , tf.E_Attack13='*E_通常攻撃2' , tf.E_Attack14='*E_組付攻撃' , tf.E_Attack15='*E_通常攻撃1' "]
[eval exp="tf.E_Attack21='*E_通常攻撃2' , tf.E_Attack22='*E_組付攻撃' , tf.E_Attack23='*E_特殊攻撃1' , tf.E_Attack24='*E_通常攻撃1' , tf.E_Attack25='*E_通常攻撃2' "]
[eval exp="tf.E_Attack31='*E_特殊攻撃1' , tf.E_Attack32='*E_組付攻撃' , tf.E_Attack33='*E_通常攻撃1' , tf.E_Attack34='*E_通常攻撃2' , tf.E_Attack35='*E_組付攻撃' "]
[eval exp="tf.E_Attack41='*E_組付攻撃' , tf.E_Attack42='*E_通常攻撃1' , tf.E_Attack43='*E_通常攻撃2' , tf.E_Attack44='*E_組付攻撃' , tf.E_Attack45='*E_特殊攻撃1' "]
[eval exp="tf.E_Attack51='*E_組付攻撃' , tf.E_Attack52='*E_通常攻撃2' , tf.E_Attack53='*E_組付攻撃' , tf.E_Attack54='*E_通常攻撃2' , tf.E_Attack55='*E_通常攻撃1' "]

[eval exp="tf.E_特殊攻撃1='*剥ぎ取り' "]
[eval exp="tf.E_組付攻撃='*組付' , tf.E_組付攻撃_rate = 1.0 , tf.E_組付攻撃_acc = 30 , tf.E_組付攻撃_crt = 1 "]
[eval exp="tf.E_通常攻撃1='*切りつけ' , tf.E_通常攻撃1_name = '切りつけ' , tf.E_通常攻撃1_rate = 5.0 , tf.E_通常攻撃1_acc = 30 , tf.E_通常攻撃1_crt = 1 "]
[eval exp="tf.E_通常攻撃2='*めった切り' , tf.E_通常攻撃2_name = 'めった切り' , tf.E_通常攻撃2_rate = 8.5 , tf.E_通常攻撃2_acc = 0 , tf.E_通常攻撃2_crt = 1 "]
[eval exp="tf.E_必殺攻撃='*つむじ切り' , tf.E_必殺攻撃_name = 'つむじ切り' , tf.E_必殺攻撃_rate = 8.5 , tf.E_必殺攻撃_acc = 50 , tf.E_必殺攻撃_crt = 1 "]
@jump storage="battle.ks"

*normal
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:一撃タイプ"  target="*normal-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*normal-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:長期戦タイプ"  target="*normal-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:セクハラタイプ"  target="*normal-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:特殊タイプ"  target="*normal-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="戻る"  target="*start"  ]
[s]

*normal-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*全力' , tf.E_skill13='*激怒'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*沈静化'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*激怒' , tf.E_skill33='*気合'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*気合' , tf.E_skill43='*激怒'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*沈静化'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*大木断'"]
@jump storage="battle.ks"

*normal-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*沈静化'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*全力'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*見切り' , tf.E_skill43='*沈静化'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
@jump storage="battle.ks"

*normal-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='時間稼 2'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 32"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*沈静化'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*沈静化' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付B' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
@jump storage="battle.ks"

*normal-4
;セクハラ。筒子
[eval exp="tf.E_name='痴漢魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='沈静化' , tf.E_skill13='*視姦'"]
[eval exp="tf.E_skill21='*視姦' , tf.E_skill22='*挑発' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*挑発' , tf.E_skill32='*視姦' , tf.E_skill33='*沈静化'"]
[eval exp="tf.E_skill41='*視姦' , tf.E_skill42='*沈静化' , tf.E_skill43='*挑発'"]
[eval exp="tf.E_skill51='*挑発' , tf.E_skill52='*視姦' , tf.E_skill53='*視姦'"]
;スキル2
[eval exp="tf.E_skill61='*組付B' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*つむじ切り'"]
@jump storage="battle.ks"

*normal-5
;特殊。三元牌
[eval exp="tf.E_name='呪術者2'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*吸収' , tf.E_skill12='*煙幕' , tf.E_skill13='*毒霧'"]
[eval exp="tf.E_skill21='*挑発' , tf.E_skill22='*毒霧' , tf.E_skill23='*煙幕'"]
[eval exp="tf.E_skill31='*吸収' , tf.E_skill32='*挑発' , tf.E_skill33='*沈静化'"]
[eval exp="tf.E_skill41='*挑発' , tf.E_skill42='*沈静化' , tf.E_skill43='*毒霧'"]
[eval exp="tf.E_skill51='*毒霧' , tf.E_skill52='*挑発' , tf.E_skill53='*毒霧'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*波動A'"]
@jump storage="battle.ks"

*hard
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:遅延タイプ"  target="*hard-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*hard-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:特殊削りタイプ"  target="*hard-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:長期戦タイプ"  target="*hard-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:セクハラタイプ"  target="*hard-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="6:一発屋タイプ"  target="*hard-6"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="520"  text="戻る"  target="*start"  ]
[s]

*hard-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*激怒'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*激怒' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*激怒'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*大木断'"]
@jump storage="battle.ks"

*hard-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
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
[eval exp="tf.E_name='時間稼 3'"]
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
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*視姦'"]
[eval exp="tf.E_skill21='*視姦' , tf.E_skill22='*奇声' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*奇声' , tf.E_skill32='*視姦' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*視姦' , tf.E_skill42='*組付' , tf.E_skill43='*奇声'"]
[eval exp="tf.E_skill51='*奇声' , tf.E_skill52='*視姦' , tf.E_skill53='*視姦'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*つむじ切り'"]
@jump storage="battle.ks"

*hard-5
;特殊。三元牌
[eval exp="tf.E_name='呪術者3'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*吸収' , tf.E_skill12='*煙幕' , tf.E_skill13='*毒霧'"]
[eval exp="tf.E_skill21='*挑発' , tf.E_skill22='*毒霧' , tf.E_skill23='*煙幕'"]
[eval exp="tf.E_skill31='*吸収' , tf.E_skill32='*挑発' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*挑発' , tf.E_skill42='*組付' , tf.E_skill43='*毒霧'"]
[eval exp="tf.E_skill51='*毒霧' , tf.E_skill52='*挑発' , tf.E_skill53='*毒霧'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*波動A'"]
@jump storage="battle.ks"
@jump storage="battle.ks"
