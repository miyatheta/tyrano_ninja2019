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
[chara_face name="kunugi" face="seminude" storage="chara/kunugi/battle_stand_seminude.png"]
;キャラクターの表情登録

;yamato
[chara_new  name="gouza"  storage="chara/gouza/pr_gouza.png" jname="豪座" ]


[macro name="show_status"]
ラウンド[emb exp="tf.Round"][r]
体力[emb exp="tf.P_HP"]　気力[emb exp="f.P_AUR"]　呼吸[emb exp="tf.P_ACT"]　欲情度[emb exp="tf.P_ERO"][r]
敵体力[emb exp="tf.E_HP"] 敵気力[emb exp="f.E_AUR"] 欲情度[emb exp="tf.E_ERO"][l]
[cm]
[endmacro]

[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

[macro name="triage"]
[jump target="*game_lose" cond="tf.P_HP <= 0"]
[jump target="*game_win" cond="tf.E_HP <= 0"]
[endmacro]

[macro name="limit"]
[eval exp="tf.E_HP = 0" cond="tf.E_HP < 0"]
[eval exp="tf.P_HP = 0" cond="tf.P_HP < 0"]
[eval exp="tf.E_ERO = 100" cond="tf.E_ERO > 100"]
[eval exp="tf.P_ERO = 100" cond="tf.P_ERO > 100"]
[endmacro]

#
戦闘を開始します[p]
[chara_show  name="kunugi"  ]
[chara_show  name="gouza"  ]
;ステータスのインストール
[eval exp="tf.Round=0"]
[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_DEX=f.P_DEX , tf.P_POW=f.P_POW, tf.P_APP=f.P_APP , tf.P_ACT=f.P_ACT, tf.P_ERO=f.P_ERO"]
[eval exp="tf.P_DEFd1=1 , tf.P_AGId1=1 ,tf.P_DEXd1=1"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_DEX=f.E_DEX , tf.E_POW=f.E_POW, tf.E_ACT=f.E_ACT , tf.E_ERO=f.E_ERO"]
[eval exp="tf.E_DEFd1=1 , tf.E_AGId1=1 , tf.E_DEXd1=1"]
;疲労の反映
[if exp="f.P_EXH >89"]疲労（重度）[p][eval exp="tf.P_AGI=tf.P_AGI-20 , tf.P_ACT=tf.P_ACT-2"]
[elsif exp="f.P_EXH >69"]疲労[p][eval exp="tf.P_AGI=tf.P_AGI-15 , tf.P_ACT=tf.P_ACT-1"]
[elsif exp="f.P_EXH >49"]疲労（軽度）[p][eval exp="tf.P_AGI=tf.P_AGI-10"]
[endif]

*round_start
;ターン開始
[eval exp="tf.Round=tf.Round+1"]
;状態異常のカウント・治癒
;火傷

;

*P_turn_start
;プレーヤーターンの開始
[show_status]
[jump target="*ikigire" cond="tf.P_ACT <= 0"]

*E_skill_quick
;敵のスキル

*P_attack_select
;プレイヤーの攻撃選択
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="攻撃"  target="*P_attack_option"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="忍術"  target="*P_skill_option"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="攻撃"  target="*P_attack_option"  ]
[s]

*P_skill_option
;プレイヤーのスキル選択
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="火炎"  target="*P_skill_conf1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="空蝉"  target="*P_skill_conf2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="魅了"  target="*P_skill_conf3"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="310"  text="降参"  target="*P_attack_select"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="380"  text="戻る"  target="*P_attack_select"  ]
[s]

*P_skill_conf1
火炎：気力40：印4：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 40"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1 , tf.MP=0 , tf.Cost=4 , tf.label='*P_skill1'" storage="SkillGame.ks" target="*game_start"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill1
くぬぎの忍術・火炎[p]
[call target="*E_Def_select"]
[eval exp="tf.DEF = (tf.E_DUR * tf.E_GRD * 2) * tf.E_DEFd1"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][eval exp="tf.ATP = tf.P_POW * 10 + tf.dice"]
[eval exp="tf.Damage = tf.ATP - tf.DEF"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage , tf.E_scald=3"][limit]
[quake count=5 time=300 hmax=20]
敵に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*P_turn_start"]
[s]

*P_skill_conf2

[s]

*P_skill_conf3

[s]

*P_attack_option
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="拳"  target="*P_attack_conf1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="蹴り"  target="*P_attack_conf2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="回し蹴り"  target="*P_attack_conf3"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="310"  text="飛び道具"  target="*P_attack_conf4"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="380"  text="戻る"  target="*P_attack_select"  ]
[s]

*P_attack_conf1
[eval exp="tf.RATE = 5.5 , tf.ACC = 30 , tf.comb=1"]
[eval exp="tf.HIT = tf.ACC + tf.P_DEX * 3 - tf.E_AGI"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
拳：威力55：命中率[emb exp="tf.HitRate"]：呼吸-1：手番継続[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf2
[eval exp="tf.RATE = 6.5 , tf.ACC = 30 , tf.comb=1"]
[eval exp="tf.HIT = tf.ACC + tf.P_DEX * 3 - tf.E_AGI"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
蹴り：威力65×１：命中率[emb exp="tf.HitRate"]：呼吸-1：手番継続[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf3
[eval exp="tf.RATE = 9.0 , tf.ACC = 0 , tf.comb=0"]
[eval exp="tf.HIT = tf.ACC + tf.P_DEX * 3 - tf.E_AGI"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
回し蹴り：威力90×１：命中率[emb exp="tf.HitRate"]％：呼吸-2：手番終了[p]
[if exp="tf.P_ACT<2"]呼吸が足りない！！[p][jump target="*P_attack_option"][endif]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack3"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf4
[eval exp="tf.RATE = 5 , tf.ACC = 20 , tf.comb=0"]
[eval exp="tf.HIT = tf.ACC + tf.P_DEX * 3 - tf.E_AGI"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
くない：威力50：命中率[emb exp="tf.HitRate"]％：呼吸-1：手番終了[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="決定"  target="*P_attack4"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_attack_option"  ]
[s]

*E_Def_select
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.dice>tf.E_ACT-1"]
;防御
[eval exp="tf.E_AVD=0 , tf.E_GRD=1.5 , tf.E_ACT=tf.E_ACT-0"]
防御[p]
[else]
;回避
[eval exp="tf.E_AVD = Math.floor(tf.E_AGI * tf.E_AGId1 * 3) , tf.E_GRD=1 , tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.AvoidRate = 100 - tf.HIT + tf.E_AVD"][eval exp="tf.AvoidRate=0" cond="tf.AvoidRate<0"]
回避：[emb exp="tf.AvoidRate"]％[p]
[endif]
[return]

*P_attack1
くぬぎの拳[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = (tf.E_DUR * tf.E_GRD * 2) * tf.E_DEFd1"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = tf.ATP - tf.DEF"][eval exp="tf.Damage1 = 0" cond="tf.Damage1<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.E_DEFd1 = tf.E_DEFd1 - 0.2"][eval exp="tf.E_DEFd1=0" cond="tf.E_DEFd1 < 0"]
[quake count=5 time=300 hmax=20]
敵に[emb exp="tf.Damage"]のダメージ[p]
敵の防御力低下[p]
[triage]
[jump target="*P_turn_start"]
[s]

*P_attack2
くぬぎの下段蹴り[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = (tf.E_DUR * tf.E_GRD * 2) * tf.E_DEFd1"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.E_AGId1 = tf.E_AGId1 - 0.2"][eval exp="tf.E_AGId1=0" cond="tf.E_AGId1 < 0"]
[quake count=5 time=300 hmax=20]
敵に[emb exp="tf.Damage"]のダメージ[p]
敵の回避が低下[p]
[triage]
[jump target="*P_turn_start"]
[s]

*P_attack3
くぬぎの回し蹴り[p]
[eval exp="tf.P_ACT = tf.P_ACT - 2"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = (tf.E_DUR * tf.E_GRD * 2) * tf.E_DEFd1"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[quake count=5 time=300 hmax=20]
敵に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*E_turn_start"]
[s]

*P_attack4
くぬぎのくない[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = (tf.E_DUR * tf.E_GRD * 2) * tf.E_DEFd1"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = tf.ATP - tf.DEF"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.E_DEXd1 = tf.E_DEXd1 - 0.2" cond="tf.E_DEXd1 > 0"]
[quake count=5 time=300 hmax=20]
敵に[emb exp="tf.Damage"]のダメージ[p]
敵の命中が低下[p]
[triage]
[jump target="*E_turn_start"]
[s]

*P_attack_miss
スカ！[p]
くぬぎの攻撃は当たらなかった[p]
[if exp="tf.comb > 0"]
[jump target="*P_turn_start"]
[else]
[jump target="*E_turn_start"]
[endif]
[s]

*E_avoid_success
回避！[p]
敵は攻撃を回避した[p]
[if exp="tf.comb > 0"]
[jump target="*P_turn_start"]
[else]
[jump target="*E_turn_start"]
[endif]
[s]

*E_turn_start
[show_status]
[jump target="*ikigire" cond="tf.P_ACT <= 0"]
敵の攻撃[p]

*P_skill_select_DEF

*E_attack_select
[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="tf.dice>4"]
敵の薙ぎ払い[p]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 5.0 , tf.ACC = 30 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * tf.E_DEXd1 * 3 - tf.P_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
命中：[emb exp="tf.HitRate"]％[p]
[jump target="*P_Def_select"]

[else]
敵の体当たり[p]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 7.0 , tf.ACC = 0 , tf.E_ATK='*E_attack_2'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * tf.E_DEXd1 * 3 - tf.P_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
命中：[emb exp="tf.HitRate"]％[p]
[jump target="*P_Def_select"]
[endif]
[s]

*P_Def_select
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="回避"  target="*P_DEF_conf1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="防御"  target="*P_DEF_conf2"  ]
[s]

*P_DEF_conf1
[eval exp="tf.P_AVD=tf.P_AGI*3 , tf.P_GRD=0"]
[eval exp="tf.AvoidRate = Math.floor((100-tf.HitRate) * tf.P_AVD / 100)"]
回避率[emb exp="tf.AvoidRate"]%[p]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="回避"  target="*P_DEF_1" ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_Def_select"  ]
[s]
*P_DEF_conf2
[eval exp="tf.P_AVD=0 , tf.P_GRD=1.5"]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="防御"  target="*P_DEF_2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="戻る"  target="*P_Def_select"  ]
[s]

*P_DEF_1
;回避
[eval exp="tf.P_ACT=tf.P_ACT-1"]
[jump target="&tf.E_ATK"][s]

*P_DEF_2
;防御
[eval exp="tf.P_ACT=tf.P_ACT-0"]
[jump target="&tf.E_ATK"][s]

*E_attack_1
敵の薙ぎ払い[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*E_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.P_AVD>0"][eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_avoid_success" cond="tf.P_AVD > tf.dice"][endif]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = (tf.P_DUR * tf.P_GRD * 2 + tf.dice) * tf.P_DEFd1"]
[eval exp="tf.ATP = tf.E_STR * tf.RATE"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*E_turn_end"]
[s]

*E_attack_2
敵の体当たり[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*E_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.P_AVD>0"][eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_avoid_success" cond="tf.P_AVD > tf.dice"][endif]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = (tf.P_DUR * tf.P_GRD * 2 + tf.dice) * tf.P_DEFd1"]
[eval exp="tf.ATP = tf.E_STR * tf.RATE"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[triage]
[if exp="tf.E_ACT>0"][jump target="*E_turn_start"][else][jump target="*round_end"][endif]
[s]

*E_attack_miss
スカ！[p]
敵の攻撃は当たらなかった[p]
[jump target="*E_turn_end"]
[s]

*P_avoid_success
回避![p]
くぬぎは攻撃を回避した[p]
[jump target="*E_turn_end"]
[s]

*E_turn_end
;火傷ダメージ
[if exp="tf.E_scald>1"]
[eval exp="tf.E_HP = tf.E_HP - 100"][limit]
火傷で敵の体力が100減少[p]
[triage]
[endif]
[if exp="tf.E_ACT>0"]
[jump target="*ikigire" cond="tf.P_ACT <= 0"]
[jump target="*E_turn_start"]
[else]
[jump target="*round_end"]
[endif]
[s]

*ikigire
くぬぎは息切れした[p]
#敵
隙あり！[p]
#くぬぎ
しまった！[p]
[quake count=5 time=300 hmax=20]
クヌギは敵に抑え込まれた[p]

*mount_start
[eval exp="tf.Mount = 50 + (tf.E_STR - tf.P_STR) * 5"]

*P_mount_select
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="暴れる"  target="*P_mount_option1"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="耐える"  target="*P_mount_option2"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="色仕掛け"  target="*P_mount_option3"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="310"  text="空蝉の術"  target="*P_mount_option4"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="380"  text="降参する"  target="*P_mount_option5"  ]
[s]

*P_mount_option1
くぬぎは暴れた[p]
[quake count=5 time=300 hmax=20]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.Mount < tf.dice"]
くぬぎは拘束を振りほどいた[p]
[jump target="*mount_end"]
[else]
しかし、拘束を振りほどくことはできなかった[p]
[eval exp="tf.Mount = tf.Mount - tf.P_STR"]
[jump target="*E_mount_select"]
[endif]
[s]

*P_mount_option2
くぬぎは息を整えた[p]
くぬぎの気力が１０上昇[p]
[eval exp="f.P_AUR = f.P_AUR + 10"]
[jump target="*E_mount_select"]
[s]

*P_mount_option3
くぬぎは自ら身体を敵に押し付けた[p]
;感情は確定で上昇、上昇幅は抵抗値次第
[eval exp="tf.HDamage = Math.floor(tf.P_APP*2 * (f.E_SAN / 100)) , tf.E_ERO = tf.E_ERO + tf.HDamage"]
敵の欲情度が[emb exp="tf.HDamage"]上昇した[p]
;デバフは抵抗判定、魅力VS理性と感情
[eval exp="tf.TAG = 50 + f.E_SAN - tf.E_ERO"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.TAG < tf.dice"]
柔らかな感触に敵は相好を崩した[p]
[eval exp="tf.Mount = tf.Mount - tf.P_APP"]
[else]
しかし、敵は動じなかった[p]
[endif]
[if exp="tf.Mount <= 0"]
#くぬぎ
隙あり！！[p]
くぬぎは敵の拘束から抜け出した[p]
[jump target="*mount_end"]
[endif]
[jump target="*E_mount_select"]
[s]

*P_mount_option4
準備中です[p]
[jump target="*P_mount_select"]
[s]

*P_mount_option5
準備中です[p]
[jump target="*P_mount_select"]
[s]

*E_mount_select
[eval exp="tf.Max=10 , tf.Min=1"][dice]
[if exp="tf.dice>9 - (tf.E_ERO/10) && f.P_DRESS>0"][jump target="*E_mount_option1"]
[elsif exp="tf.dice>9 - (tf.E_ERO/10)"][jump target="*E_mount_option2"]
[elsif exp="tf.dice>5 - (tf.E_ERO/10)"][jump target="*E_mount_option3"]
[else][jump target="*E_mount_option4"][endif]

*E_mount_option1
敵はくぬぎの装束を剥ぎ取ろうとした[p]
[eval exp="f.P_DRESS = f.P_DRESS - 30"]
[if exp="f.P_DRESS < 34"]
くぬぎは下着姿に剥かれた[p]くぬぎの色気が1上昇した[p]
[eval exp="tf.P_APP = tf.P_APP+1"]
[chara_mod name="kunugi" face="seminude"]
[elsif exp="f.P_DRESS < 1"]
くぬぎは一糸まとわぬ姿に剥かれた[p]
[eval exp="tf.P_APP = tf.P_APP+1"]
[chara_mod name="kunugi" face="seminude"]
[endif]

[jump target="*mount_continue"]
[s]

*E_mount_option2
敵はくぬぎの胸を揉みしだいた[p]
[eval exp="tf.P_ERO = tf.P_ERO + 10"][limit]
くぬぎの欲情度が１０上昇した[p]
[if exp="tf.P_ERO > 79 && tf.Arousal != 1"]
[eval exp="tf.Arousal = 1"]
くぬぎは興奮状態になった[p]
[endif]
[if exp="tf.P_ERO > 99 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
くぬぎは絶頂した[p]
[eval exp="tf.Orga = 2"]
[endif]
[jump target="*mount_continue"]
[s]

*E_mount_option3
敵はくぬぎを締め上げた[p]
[quake count=3 time=300 hmax=30]
[eval exp="tf.Damage=(tf.E_STR - tf.P_DUR) * 2"]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[jump target="*mount_continue"]
[s]

*E_mount_option4
敵はくぬぎを殴りつけた[p]
[quake count=5 time=300 hmax=20]
[eval exp="tf.Damage=(tf.E_STR - tf.P_DUR) * 4"]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[jump target="*mount_continue"]
[s]

*mount_continue
くぬぎは拘束されている！[p]
疲労度が１上昇した[p]
[eval exp="f.P_EXH = f.P_EXH+1"]
[show_status]
[jump target="*P_mount_select"]
[s]

[jump target="*round_end"]
[s]

*round_end
ラウンド終了[p]
[eval exp="f.P_AUR = f.P_AUR + tf.P_ACT * 10"][eval exp="f.P_AUR=100" cond="f.P_AUR>100"]
[eval exp="tf.Max=2 , tf.Min=1"][dice][eval exp="f.E_AUR=f.E_AUR+tf.dice*10"]
[eval exp="tf.P_ACT = f.P_ACT , tf.E_ACT = f.E_ACT"]
;デバフと状態異常の回復
[eval exp="tf.E_DEFd1=1 , tf.E_AGId1=1 , tf.E_DEXd1=1"]
[eval exp="tf.P_DEFd1=1 , tf.P_AGId1=1 ,tf.P_DEXd1=1"]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[jump target="*round_start"]


*game_lose
くぬぎは敗北した。
[if exp="tf.Round<6"][eval exp="f.P_EXH = f.P_EXH + 5"]疲労度が5増加[p]
[elsif exp="tf.Round<10"][eval exp="f.P_EXH = f.P_EXH + 10"]疲労度が10増加[p]
[else][eval exp="f.P_EXH = f.P_EXH + 15"]疲労度が15増加[p]
[endif]
[s]

*game_win
戦闘に勝利した。
[if exp="tf.Round<6"][eval exp="f.P_EXH = f.P_EXH + 5"]疲労度が5増加[p]
[elsif exp="tf.Round<10"][eval exp="f.P_EXH = f.P_EXH + 10"]疲労度が10増加[p]
[else][eval exp="f.P_EXH = f.P_EXH + 15"]疲労度が15増加[p]
[endif]
[s]
