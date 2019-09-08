;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]

[call storage="status.ks" target="status"]

[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=20 top=400 width=920 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=24 x=50 y=410]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;akane
[chara_new  name="kunugi" storage="chara/kunugi/battle_stand.png" jname="くぬぎ"  ]
;キャラクターの表情登録

;yamato
[chara_new  name="gouza"  storage="chara/gouza/pr_gouza.png" jname="豪座" ]


[macro name="show_status"]
体力[emb exp="tf.P_HP"]　気力[emb exp="f.P_AUR"]　呼吸[emb exp="tf.P_ACT"]　[r]
敵体力[emb exp="tf.E_HP"][l]
[cm]
[endmacro]

[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

[macro name="triage"]
[jump target="*tech" cond="tf.P_HP <= 0"]
[jump target="*tech" cond="tf.E_HP <= 0"]
[endmacro]

#
戦闘を開始します[p]
[chara_show  name="kunugi"  ]
[chara_show  name="gouza"  ]

[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_ACT=f.P_ACT"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_ACT=f.E_ACT"]

[eval exp="tf.E_AGI=tf.E_AGI + 0"]

*round_start
;ターン開始

*P_turn_start
[show_status]

*E_skill_quick

*P_attack_select
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="攻撃"  target="*P_attack_option"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="攻撃"  target="*P_attack_option"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="攻撃"  target="*P_attack_option"  ]
[s]

*P_attack_option
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="拳"  target="*P_attack_conf1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="蹴り"  target="*P_attack_conf2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="回し蹴り"  target="*P_attack_conf3"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="310"  text="飛び道具"  target="*P_attack_conf4"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="380"  text="戻る"  target="*P_attack_select"  ]
[s]

*P_attack_conf1
[eval exp="tf.RATE = 2.4 , tf.ACC = 60"]
[eval exp="tf.TAG = tf.ACC + (f.P_TEC * 2 - (tf.E_AGI * 2)) * 5"]
拳：威力24×２：命中率[emb exp="tf.TAG"]：呼吸-1：手番継続[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf2
[eval exp="tf.RATE = 3 , tf.ACC = 50"]
[eval exp="tf.TAG = tf.ACC + (f.P_TEC * 2 - (tf.E_AGI * 2)) * 5"]
蹴り：威力30×１：命中率[emb exp="tf.TAG"]：呼吸-1：手番継続[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf3
[eval exp="tf.RATE = 4 , tf.ACC = 30"]
[eval exp="tf.TAG = tf.ACC + (f.P_TEC * 2 - (tf.E_AGI * 2)) * 5"]
回し蹴り：威力40×１：命中率[emb exp="tf.TAG"]％：呼吸-2：手番終了[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack3"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf4
[eval exp="tf.RATE = 2.1 , tf.ACC = 80"]
[eval exp="tf.TAG = tf.ACC + (f.P_TEC * 2 - (tf.E_AGI * 2)) * 5"]
くない：威力21×３：命中率[emb exp="tf.TAG"]％：呼吸--：手番終了[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack4"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*E_Def_select
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.dice>4"]
;防御
[eval exp="tf.E_AVD=0 , tf.E_GRD=1.5"]
防御[p]
[else]
;回避
[eval exp="tf.E_AVD = tf.E_AGI + 1 , tf.E_GRD=1 "]
[eval exp="tf.AvoidRate = 100 - tf.TAG + tf.E_AVD"][eval exp="tf.AvoidRate=0" cond="tf.AvoidRate<0"]
回避：[emb exp="tf.AvoidRate"]％[p]
[endif]
[return]

*P_attack1
PLの拳[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.TAG < tf.dice + tf.E_AVD"]
[eval exp="tf.Max=9 , tf.Min=0+f.E_LUK"][dice][eval exp="tf.DEF = tf.E_DUR * tf.E_GRD * 2 + tf.dice"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][eval exp="tf.ATP = tf.P_STR * tf.RATE"]
[dice][eval exp="tf.Damage1 = tf.ATP - tf.DEF + tf.dice"][eval exp="tf.Damage1 = 0" cond="tf.Damage1<0"]
[dice][eval exp="tf.Damage2 = tf.ATP - tf.DEF + tf.dice"][eval exp="tf.Damage2 = 0" cond="tf.Damage2<0"]
[eval exp="tf.Damage = Math.floor(tf.Damage1 + tf.Damage2) , tf.E_HP = tf.E_HP - tf.Damage"]
敵に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*P_turn_start"]
[s]

*P_attack2
PLの下段蹴り[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.TAG < tf.dice + tf.E_AVD"]
[eval exp="tf.Max=9 , tf.Min=0+f.E_LUK"][dice][eval exp="tf.DEF = tf.E_DUR * 2 + tf.dice"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"]
敵に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*P_turn_start"]
[s]

*P_attack3
PLの回し蹴り[p]
[eval exp="tf.P_ACT = tf.P_ACT - 2"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.TAG < tf.dice + tf.E_AVD"]
[eval exp="tf.Max=9 , tf.Min=0+f.E_LUK"][dice][eval exp="tf.DEF = tf.E_DUR * 2 + tf.dice"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.ATP = tf.P_STR * tf.RATE"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF + tf.dice)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"]
敵に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*E_attack_select"]
[s]

*P_attack4
PLのくない[p]
[eval exp="tf.P_ACT = tf.P_ACT - 0"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.TAG < tf.dice + tf.E_AVD"]
[eval exp="tf.Max=9 , tf.Min=0+f.E_LUK"][dice][eval exp="tf.DEF = tf.E_DUR * 2 + tf.dice"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][eval exp="tf.ATP = tf.P_STR * tf.RATE"]
[dice][eval exp="tf.Damage1 = tf.ATP - tf.DEF + tf.dice"][eval exp="tf.Damage1 = 0" cond="tf.Damage1<0"]
[dice][eval exp="tf.Damage2 = tf.ATP - tf.DEF + tf.dice"][eval exp="tf.Damage2 = 0" cond="tf.Damage2<0"]
[dice][eval exp="tf.Damage3 = tf.ATP - tf.DEF + tf.dice"][eval exp="tf.Damage3 = 0" cond="tf.Damage3<0"]
[eval exp="tf.Damage = Math.floor(tf.Damage1 + tf.Damage2 + tf.Damage3) , tf.E_HP = tf.E_HP - tf.Damage"]
敵に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*E_attack_select"]
[s]

*P_attack_miss
[if exp="tf.E_AVD > 0"]
敵は攻撃を回避した[p]
[jump target="*E_attack_select"]
[endif]
くぬぎの攻撃は当たらなかった[p]
[jump target="*E_attack_select"]

*E_attack_select
[show_status]
敵の攻撃[p]
[triage]

*round_end
ラウンド終了[p]
[eval exp="tf.P_ACT = f.P_ACT , tf.E_ACT = f.E_ACT"]
[jump target="*round_start"]


*tech
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
このサンプルでは、ティラノスクリプトのごく一部の機能しか紹介できていません[p]
さらに出来ることを知りたい場合、スクリプトを丸ごとダウンロードできるようになっているので[p]
そのサンプルを触ってみることをオススメします！[p]

[iscript]
window.open("http://tyrano.jp/home/demo");
[endscript]

@jump target=button_link


*info
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
ティラノスクリプトでわからないことがあったら[p]
公式掲示板で質問したり、Wikiなどもありますので参考にしてみてください[p]
@jump target=button_link

*tagref
@layopt layer=message0 visible=true
@layopt layer=fix visible=true
タグは詳細なリファレンスページが用意されています。[p]
このページでさらに詳細な使い方を身につけてください[p]

[iscript]
window.open("http://tyrano.jp/home/tag");
[endscript]

@jump target="*button_link"

[s]
