*start
[cm]
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

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=24 x=50 y=410]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
[chara_new  name="gouza"  storage="chara/gouza/pr_gouza.png" jname="豪座" ]

[macro name="triage"]
[jump target="*game_lose" cond="tf.P_HP <= 0"]
[jump target="*game_lose" cond="f.P_EXH >= 100"]
[jump target="*game_win" cond="tf.E_HP <= 0"]
[endmacro]

[macro name="show_status"]
[nowait]
[if exp="tf.Mount>0"][else]ターン[emb exp="tf.Turn"][r][endif]
体力[emb exp="tf.P_HP"]　気力[emb exp="f.P_AUR"]　呼吸[emb exp="tf.P_ACT"]　欲情[emb exp="tf.P_ERO"]　疲労度[emb exp="f.P_EXH"][r]
敵体力[emb exp="tf.E_HP"] 敵気力[emb exp="f.E_AUR"] 欲情[emb exp="tf.E_ERO"][l]
[endnowait]
[cm]
[endmacro]

#
[chara_show  name="gouza" width=300 left=1000 top=50 wait="true"]
[anim name="gouza" opacity=0 time=1]
[anim name="gouza" left=750 top=50 time=1]
[anim name="gouza" opacity=255 left=550 top=50 time=300 anim="true" effect="jswing" ]
戦闘を開始します[p]

;ステータスのインストール
*Initialize
[eval exp="tf.Turn=0 , tf.P_EXH=0"]
[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_DEX=f.P_DEX , tf.P_POW=f.P_POW, tf.P_APP=f.P_APP , tf.P_ACTmax=f.P_ACT , f.P_AUR = f.P_AUR"]
[eval exp="tf.P_ERO=f.P_ERO , tf.P_SAN=f.P_SAN , tf.P_DRESS=f.P_DRESS , tf.P_ARMOR=f.P_ARMOR , tf.P_Barrier=0"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_DEX=f.E_DEX , tf.E_POW=f.E_POW , tf.E_APP=f.E_APP , tf.E_ACT=f.E_ACT , f.E_AUR=0"]
[eval exp="tf.E_ERO=f.E_ERO , tf.E_SAN=f.E_SAN , tf.E_SEX=f.E_SEX , tf.E_BND=f.E_BND"]
;サイズの設定
[eval exp="tf.Max=20 , tf.Min=0"][dice][eval exp="tf.E_SIZ=tf.dice"]
;性格の設定
;暴力性の決定
;性的指向の設定
[Initialize_1Tbuff]
[Initialize_3Tbuff]

*Initialize_BudStatus
;状態異常の初期値設定
[eval exp="tf.Orga = 0 , tf.OrgaStan = 0 , tf.OrgaCount=0 , tf.OrgaPOWb = 1"]
[eval exp="tf.Arousal=0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb = 0 , tf.ArousPOWb = 0 , tf.ArousSEXd =1"]

[eval exp="tf.E_scald = 0"]

;疲労の反映
[if exp="f.P_EXH >89"]疲労（重度）[p][eval exp="tf.P_AGI=tf.P_AGI-20 , tf.P_ACTmax=tf.P_ACTmax-2"]
[elsif exp="f.P_EXH >69"]疲労[p][eval exp="tf.P_AGI=tf.P_AGI-15 , tf.P_ACTmax=tf.P_ACTmax-1"]
[elsif exp="f.P_EXH >49"]疲労（軽度）[p][eval exp="tf.P_AGI=tf.P_AGI-10"]
[endif]
[eval exp="tf.P_ACT=tf.P_ACTmax"]
;欲情の反映
[if exp="tf.P_ERO >79"]
くぬぎは興奮している[p]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =0.8 , tf.ArousAGId =0.8 , tf.ArousDEXd =0.8 , tf.ArousAPPb =2 , tf.ArousPOWb =2 , tf.ArousSEXd =2"]
[endif]

*turn_start
;ターン開始
[eval exp="tf.Turn=tf.Turn+1"]
;状態異常のカウント・治癒
;絶頂
[eval exp="tf.Orga = tf.Orga - 1"]
[if exp="tf.Orga > 0"]
[eval exp="tf.P_ACT = tf.P_ACT - 1"][limit]
くぬぎは絶頂の余韻から抜け出せないでいる!(呼吸-1)[p]
[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1"]
[eval exp="tf.Arousal = 1"]
[endif]
;興奮
[if exp="tf.Arousal == 1"]
くぬぎの興奮が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =0 , tf.ArousPOWb =0 , tf.ArousSEXd =1"]
[endif]
;火傷

;デバフ
[if exp="tf.P_AGId3_count > 0"][eval exp="tf.P_AGId3_count = tf.P_AGId3_count-1"][endif]

*E_skill_select
;敵のスキル(３の倍数+1のターンのみ実行)
[if exp="tf.sho = tf.Turn % 3 , tf.sho!=1"]
[jump target="*E_skill_play"]
[endif]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;コンボルート選定
[if exp="tf.dice >= 66"][eval exp="tf.E_skill_route =1"]
;コンボルート1 足止め＞足止め＞火力アップ・防御ダウン
[eval exp="tf.E_skill1='*集中' , tf.E_skill2='*集中' , tf.E_skill3='*捨て身'"]
[elsif exp="tf.dice >= 33"][eval exp="tf.E_skill_route =2"]
;コンボルート2　火力アップ＞足止め＞組付
[eval exp="tf.E_skill1='*全力' , tf.E_skill2='*集中' , tf.E_skill3='*全力'"]
[else exp="tf.dice >= 0"][eval exp="tf.E_skill_route =3"]
;コンボルート3 火力アップ＞火力アップ・防御ダウン＞組付
[eval exp="tf.E_skill1='*全力' , tf.E_skill2='*捨て身' , tf.E_skill3='*組付'"]
[endif]
[jump target="*E_skill_play"]
[s]

*E_skill_play
[if exp="tf.sho = tf.Turn % 3 , tf.sho!=1"]
[jump storage="skilllist.ks" target="&tf.E_skill1"]
[elsif exp="tf.sho = tf.Turn % 3 , tf.sho!=2"]
[jump storage="skilllist.ks" target="&tf.E_skill2"]
[elese]
[jump storage="skilllist.ks" target="&tf.E_skill3"]
[endif]
[s]

*P_phase_start
;プレーヤーターンの開始
[show_status]
[jump target="*ikigire" cond="tf.P_ACT <= 0"]

*P_attack_select
;プレイヤーの攻撃選択
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="攻撃"  target="*P_attack_option"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="忍術"  target="*P_skill_option"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="240"  text="攻撃"  target="*P_attack_option"  ]
[s]

*P_skill_option
;プレイヤーのスキル選択
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="火炎"  target="*P_skill_conf1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="空蝉"  target="*P_skill_conf2" cond="tf.P_DRESS>0"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="衣変"  target="*P_skill_conf4" cond="tf.P_DRESS==0"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="240"  text="魅了"  target="*P_skill_conf3"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="310"  text="螺旋功"  target="*P_skill_conf5"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="380"  text="戻る"  target="*P_attack_select"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="410"  text="集気法"  target="*P_attack_conf0" cond="tf.P_AUR==0"]
[s]

*P_skill_conf0
集気法:気力+10,防御力上昇（１ターン）[r]
気力0：印0：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 60"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1" target="*P_skill0"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill0
集気法[p]
[Calc_Status]
[eval exp="f.P_AUR = f.P_AUR+10 , tf.P_DURb1 = 1.3"]][limit]
[jump target="*P_phase_start"]
[s]

*P_skill_conf1
火炎:敵に必中で非物理ダメージ。火傷（100ダメージ）を３回付与[r]
気力60：印4：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 60"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1 , f.P_AUR = f.P_AUR - 60 , tf.MP=0 , tf.Cost=4 , tf.label='*P_skill1'" storage="SkillGame.ks" target="*game_start"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill1
くぬぎの忍術・火炎[p]
[Calc_Status]
[eval exp="tf.HIT = 1000"]
[eval exp="tf.HitRate = tf.HIT"]
[call target="*E_Def_select"]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][eval exp="tf.ATP = (tf.P_POW * tf.OrgaPOWb + tf.ArousPOWb) * 18 + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage , tf.E_scald=3"][limit]
[quake count=5 time=300 hmax=20]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*P_phase_start"]
[s]

*P_skill_conf2
空蝉：敵の攻撃被弾時に一度だけダメージを無効化する。代わりに衣服を失う。衣服を着ていないと使えない[r]
気力50：印4：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 50"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1 , f.P_AUR = f.P_AUR - 50 , tf.MP=0 , tf.Cost=4 , tf.label='*P_skill2'" storage="SkillGame.ks" target="*game_start"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill2
くぬぎの忍術・空蝉[p]
#
一度だけダメージを無効化する。（途中で衣服を失った場合は発動しない）[p]
[eval exp="tf.P_Barrier=1"]
[jump target="*P_phase_start"]
[s]

*P_skill_conf3
魅了：気力30：印3：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 30"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1 , f.P_AUR = f.P_AUR - 30 , tf.MP=0 , tf.Cost=3 , tf.label='*P_skill3'" storage="SkillGame.ks" target="*game_start"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill3
くぬぎの忍術・魅了[p]
#くぬぎ
あはぁん[p]
#
くぬぎは胸を寄せながら、胸元をはだけて見せた[p]
[Calc_Status]
;感情は確定で上昇、上昇幅は抵抗値次第
[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP) * 4.5 * (100 - tf.E_SAN)/100 * (tf.E_ERO + 100)/100) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
[enemyname]の欲情が[emb exp="tf.HDamage"]上昇した[p]

;デバフは抵抗判定、魅力VS理性と感情
[eval exp="tf.TAG = 50 + tf.E_SAN - tf.E_ERO - (tf.P_APP + tf.ArousAPPb - tf.E_APP)*3"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.TAG < tf.dice"]
;魅了による弱体化
[enemyname]は前かがみになった[p]
[eval exp="tf.E_charm_count=3 ,tf.E_charm_STR=0.6 ,tf.E_charm_AGI=0.7"]
[enemyname]の攻撃力と回避力が減少した（3ターン）[p]
[endif]
[triage]
[jump target="*P_phase_start"]
[s]

*P_skill_conf4
衣変：失った衣装を復元します。どこから服が出てくるかは謎[r]
気力20：印0：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 20"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1 , f.P_AUR = f.P_AUR - 20 , tf.MP=0 , tf.Cost=3" target="*P_skill4"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill4
くぬぎの忍術・早着替え[p]
#
くぬぎは目にも留まらぬ速さで着衣した[p]
[eval exp="tf.P_DRESS=2"]
[chara_mod name="kunugi" face="default"]
[jump target="*P_phase_start"]
[s]

*P_skill_conf5
[Calc_Status]
[eval exp="tf.ACC = 0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI * tf.E_charm_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]

螺旋功:防御力無視・装甲貫通の非物理ダメージ[r]
命中率[emb exp="tf.HitRate"]％[r]
気力100：印5：呼吸-1：手番継続[p]
[if exp="f.P_AUR < 100"]気力が足りない[p][jump target="*P_skill_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_ACT = tf.P_ACT - 1 , f.P_AUR = f.P_AUR - 100 , tf.MP=0 , tf.Cost=5 , tf.label='*P_skill5'" storage="SkillGame.ks" target="*game_start"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_skill_option"  ]
[s]

*P_skill5
くぬぎの忍術・螺旋功[p]
[call target="*E_Def_select"]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][eval exp="tf.ATP = (tf.P_POW * tf.OrgaPOWb + tf.ArousPOWb) * 25 + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage , tf.E_scald=3"][limit]
[quake count=5 time=300 hmax=20]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*P_phase_start"]
[s]

*P_attack_option
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="拳　：呼吸-1【攻撃継続】"  target="*P_attack_conf1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="蹴り　：呼吸-1【攻撃継続】"  target="*P_attack_conf2"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="240"  text="回し蹴り　：呼吸-2【攻守交代】"  target="*P_attack_conf3"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="310"  text="飛び道具　：呼吸-1【攻守交代】"  target="*P_attack_conf4"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="380"  text="戻る"  target="*P_attack_select"  ]
[s]

*P_attack_conf1
[Calc_Status]
[eval exp="tf.RATE = 6.5 , tf.ACC = 30 , tf.CRTrate = 1.2 , tf.comb=1"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI * tf.E_charm_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
拳：命中率[emb exp="tf.HitRate"]％[p]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="決定"  target="*P_attack1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf2
[Calc_Status]
[eval exp="tf.RATE = 7.5 , tf.ACC = 20 , tf.CRTrate = 1.0 , tf.comb=1"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI * tf.E_charm_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
蹴り：命中率[emb exp="tf.HitRate"]％[p]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="決定"  target="*P_attack2"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf3
[Calc_Status]
[eval exp="tf.RATE = 13.0 , tf.ACC = 0 , tf.CRTrate = 1.5 , tf.comb=0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI * tf.E_charm_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
回し蹴り：命中率[emb exp="tf.HitRate"]％[p]
[if exp="tf.P_ACT<2"]呼吸が足りない！！[p][jump target="*P_attack_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="決定"  target="*P_attack3"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_attack_option"  ]
[s]

*P_attack_conf4
[Calc_Status]
[eval exp="tf.RATE = 5.5 , tf.ACC = 40 , tf.CRTrate = 1.0 , tf.comb=0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI * tf.E_charm_AGI)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
くない：命中率[emb exp="tf.HitRate"]％[p]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="決定"  target="*P_attack4"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_attack_option"  ]
[s]

*E_Def_select
[Calc_Status]
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.dice>tf.E_ACT-1"]
;防御
[eval exp="tf.E_AVD=0 , tf.E_GRD=1.5 , tf.E_ACT=tf.E_ACT-0"]
防御[p]
[else]
;回避
[eval exp="tf.E_AVD = Math.floor(tf.E_AGI * tf.E_charm_AGI * 3) , tf.E_GRD=0 , tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.AvoidRate = 100 - Math.floor(tf.HitRate/10 * (100 - tf.E_AVD)/10)"][limit]
回避：[emb exp="tf.AvoidRate"]％[p]
[endif]
[return]

*P_attack1
くぬぎの拳[p]
[Calc_Status]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.5" cond="tf.dice <= f.P_LUK * 4 * tf.CRTrate"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.ArousSTRd * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.E_DURd1 = tf.E_DURd1 - 0.25"][eval exp="tf.E_DURd1=0" cond="tf.E_DURd1 < 0"]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[enemyname]の防御力低下[p]
[triage]
[jump target="*P_phase_start"]
[s]

*P_attack2
くぬぎの下段蹴り[p]
[Calc_Status]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.5" cond="tf.dice <= f.P_LUK * 4 * tf.CRTrate"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.ArousSTRd * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.E_AGId1 = tf.E_AGId1 - 0.25"][eval exp="tf.E_AGId1=0" cond="tf.E_AGId1 < 0"]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[enemyname]の回避が低下[p]
[triage]
[jump target="*P_phase_start"]
[s]

*P_attack3
くぬぎの回し蹴り[p]
[Calc_Status]
[eval exp="tf.P_ACT = tf.P_ACT - 2"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.5" cond="tf.dice <= f.P_LUK * 4 * tf.CRTrate"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.ArousSTRd * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*E_phase_start"]
[s]

*P_attack4
くぬぎのくない[p]
[Calc_Status]
[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.5" cond="tf.dice <= f.P_LUK * 4 * tf.CRTrate"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.ArousSTRd * tf.RATE + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.E_DEXd1 = tf.E_DEXd1 - 0.2" cond="tf.E_DEXd1 > 0"]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[enemyname]の命中が低下[p]
[triage]
[jump target="*E_phase_start"]
[s]

*P_attack_miss
スカ！[p]
くぬぎの攻撃は当たらなかった[p]
[if exp="tf.comb > 0"]
[jump target="*P_phase_start"]
[else]
[jump target="*E_phase_start"]
[endif]
[s]

*E_avoid_success
回避！[p]
[enemyname]は攻撃を回避した[p]
[if exp="tf.comb > 0"]
[jump target="*P_phase_start"]
[else]
[jump target="*E_phase_start"]
[endif]
[s]

*E_phase_start
[show_status]
[jump target="*ikigire" cond="tf.P_ACT <= 0"]
[enemyname]の攻撃[p]

*E_skill_select2
[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="f.E_AUR>0 && tf.dice>7"]
[jump storage="skilllist.ks" target="*組付"]
[endif]

[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="f.E_AUR>=10 && tf.dice>6"]
[jump storage="skilllist.ks" target="*気迫"]
[endif]

[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="f.E_AUR>=50 && tf.dice>0"]
[jump storage="skilllist.ks" target="*轟爆斧"]
[endif]

*E_attack_select
[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="tf.dice>4"]
[enemyname]の薙ぎ払い[p]
[Calc_Status]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 5.0 , tf.ACC = 30 , tf.CRTrate = 1 ,tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
命中：[emb exp="tf.HitRate"]％[p]
[jump target="*P_Def_select"]

[else]
[enemyname]の体当たり[p]
[Calc_Status]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 8.5 , tf.ACC = 0 , tf.CRTrate = 1 , tf.E_ATK='*E_attack_2'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
命中：[emb exp="tf.HitRate"]％[p]
[jump target="*P_Def_select"]
[endif]
[s]

*P_Def_select
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="回避"  target="*P_DEF_conf1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="防御"  target="*P_DEF_conf2"  ]
[s]

*P_DEF_conf1
[Calc_Status]
[eval exp="tf.P_AVD=Math.floor(tf.P_AGI * tf.ArousAGId * 3) , tf.P_GRD=0"]
[eval exp="tf.AvoidRate = 100 - Math.floor(tf.HitRate/10 * (100 - tf.P_AVD)/10)"][limit]
回避率[emb exp="tf.AvoidRate"]%[p]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="回避"  target="*P_DEF_1" ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_Def_select"  ]
[s]
*P_DEF_conf2
[eval exp="tf.P_AVD=0 , tf.P_GRD=1.5"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="防御"  target="*P_DEF_2"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_Def_select"  ]
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
[enemyname]の薙ぎ払い[p]
[Calc_Status]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*E_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.P_AVD>0"][eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_avoid_success" cond="tf.P_AVD > tf.dice"][endif]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.5" cond="tf.dice <= f.E_LUK * 4 * tf.CRTrate"]
[eval exp="tf.ATP = tf.RATE * tf.E_STR * tf.E_charm_STR * tf.CRT"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[if exp="f.P_MAZO>0"]
[eval exp="tf.RATE=f.P_MAZO*2 , tf.P_SEN = f.P_SEN_EX"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
[endif]
[jump target="*E_phase_end"]
[s]

*E_attack_2
[enemyname]の体当たり[p]
[Calc_Status]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*E_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.P_AVD>0"][eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_avoid_success" cond="tf.P_AVD > tf.dice"][endif]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.5" cond="tf.dice <= f.E_LUK * 4 * tf.CRTrate"]
[eval exp="tf.ATP = tf.RATE * tf.E_STR * tf.E_charm_STR * tf.CRT"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[if exp="f.P_MAZO>0"]
[eval exp="tf.RATE=f.P_MAZO*2 , tf.P_SEN = f.P_SEN_EX"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
[endif]
[if exp="tf.E_ACT>0"][jump target="*E_phase_start"][else][jump target="*turn_end"][endif]
[s]

*E_attack_miss
スカ！[p]
[enemyname]の攻撃は当たらなかった[p]
[jump target="*E_phase_end"]
[s]

*P_avoid_success
回避![p]
くぬぎは攻撃を回避した[p]
[jump target="*E_phase_end"]
[s]

*P_Barrier
#くぬぎ
甘い！！空蝉の術！！[p]
#
くぬぎは服を身代わりにして攻撃を躱した[p]
[eval exp="tf.P_Barrier=0"]
[if exp="tf.P_DRESS > 1"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
くぬぎは下着姿になった[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]
[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
くぬぎは一糸まとわぬ姿になった[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[jump target="*E_phase_end"]
[s]

*E_phase_end
;火傷ダメージ
[if exp="tf.E_scald>1"]
[eval exp="tf.E_HP = tf.E_HP - 100"][limit]
火傷で[enemyname]の体力が100減少[p]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[triage]
[endif]

[jump target="*ikigire" cond="tf.P_ACT <= 0"]

[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.E_ACT>1"]
[jump target="*E_phase_start"]
[eval exp="f.E_AUR = f.E_AUR + 10"][elsif exp="tf.E_ACT==1 && tf.dice>4"]
[jump target="*turn_end"]
[else]
[jump target="*turn_end"]
[endif]
[s]

*ikigire
くぬぎは息切れした[p]
#敵
隙あり！[p]
#くぬぎ
しまった！[p]
[quake count=5 time=300 hmax=20]
くぬぎは[enemyname]に抑え込まれた[p]
[jump target="*mount_start"]
[s]

*mount_start
[Calc_Status]
[eval exp="tf.mount_turn=0 , tf.Esc=0"][limit]
[eval exp="tf.Mount = 50 + Math.floor(tf.E_BND * tf.E_charm_STR - tf.P_STR * tf.ArousSTRd) * 5"]

*P_mount_phase
[eval exp="tf.mount_turn = tf.mount_turn + 1"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
拘束[emb exp="tf.mount_turn"]ターン目[r]
拘束力[emb exp="tf.Mount"][p]

[if exp="tf.Orga==4 && tf.dice>49"]
くぬぎは絶頂の衝撃で動けない(行動不能)[p]
[eval exp="tf.OrgaStan = 1"]
[eval exp="tf.Orga = tf.Orga-1"]
[jump target="*E_mount_select"]

[elsif exp="tf.Orga>0"]
くぬぎは絶頂の余韻から抜け出せない(呼吸-1)[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.Orga = tf.Orga-1 , tf.P_ACT = tf.P_ACT-1"]

[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1 , tf.Arousal = 1"]
[endif]

[if exp="tf.Arousal == 1"]
くぬぎの興奮が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =0 , tf.ArousPOWb =0 ,tf.ArousSEXd =1"]
[endif]

[show_status]
[jump target="*P_mount_select"]
[s]

*P_mount_select
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="暴れる　：拘束に腕力で抵抗します"  target="*P_mount_option1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="耐える　：呼吸を回復し、快感を軽減"  target="*P_mount_option2"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="240"  text="色仕掛け：拘束に色気で抵抗します"  target="*P_mount_option3"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="310"  text="空蝉の術：気力と衣装を消費して脱出"  target="*P_mount_option4"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="380"  text="降参する：敵の欲情次第で房中に移行"  target="*P_mount_option5"  ]
[s]

*P_mount_option1
[if exp="tf.P_ACT < 1"]
呼吸が足りない！[p]
[jump target="*P_mount_select"]
[endif]

[eval exp="tf.P_ACT = tf.P_ACT-1"]
くぬぎは暴れた[p]
[Calc_Status]
[quake count=5 time=300 hmax=20]
[eval exp="tf.Resist = Math.floor(tf.P_STR * tf.ArousSTRd)"]
[eval exp="tf.Max=tf.Resist , tf.Min=0"][dice]
[if exp="tf.Mount < tf.dice"]
くぬぎは拘束を振りほどいた[p]
[eval exp="tf.Esc=1"]
[jump target="*mount_end"]

[else]
しかし、拘束を振りほどくことはできなかった[p]
[eval exp="tf.Mount = tf.Mount - tf.Resist"]
[jump target="*E_mount_select"]
[endif]
[s]

*P_mount_option2
くぬぎは息を整えた[p]
くぬぎの気力が１０上昇[p]
このターンのくぬぎは快感への抵抗力が上昇[p]
[eval exp="tf.P_ACT = tf.P_ACTmax , f.P_AUR = f.P_AUR + 10 , tf.P_DefSKBb1 = 0.5"][limit]
[jump target="*E_mount_select"]
[s]

*P_mount_option3
[if exp="tf.P_ACT < 1"]
呼吸が足りない！[p]
[jump target="*P_mount_select"]
[endif]

[eval exp="tf.P_ACT = tf.P_ACT-1"]
くぬぎは自ら身体を[enemyname]に押し付けた[p]
[Calc_Status]
;感情は確定で上昇、上昇幅は抵抗値次第
[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP) * 3 * (100 - tf.E_SAN)/100 * (tf.E_ERO + 100)/100) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
[enemyname]の欲情が[emb exp="tf.HDamage"]上昇した[p]

;デバフは抵抗判定、魅力VS理性と感情
[eval exp="tf.TAG = tf.E_SAN - tf.E_ERO"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

[if exp="tf.TAG < tf.dice"]
柔らかな感触に[enemyname]は大きく動揺した[p]
[eval exp="tf.Mount = tf.Mount - (tf.P_APP + tf.ArousAPPb)"]
[else]
柔らかな感触に[enemyname]は動揺した[p]
[eval exp="tf.Mount = tf.Mount - (tf.P_APP + tf.ArousAPPb)/2"]
[endif]

[if exp="tf.Mount <= 0"]
#くぬぎ
隙あり！！[p]
くぬぎは[enemyname]の拘束から抜け出した[p]
[eval exp="tf.Esc=1"]
[jump target="*mount_end"]
[endif]

[jump target="*E_mount_select"]
[s]

*P_mount_option4
[if exp="tf.P_ACT < 1"]
呼吸が足りない！[p]
[jump target="*P_mount_select"]
[endif]
準備中です[p]
[jump target="*P_mount_phase"]
[s]

*P_mount_option5
[jump target="*bochu"]
[s]

*E_mount_select
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice> 79"][jump target="*E_mount_option1"]
[elsif exp="tf.dice> 59"][jump target="*E_mount_option2"]
[endif]

[Calc_Status]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[eval exp="tf.SKB=(50 + tf.E_SAN) - Math.floor(tf.E_ERO + (tf.P_APP + tf.ArousAPPb - tf.E_APP)*5)"]
[if exp="tf.dice> tf.SKB"][jump target="*E_mount_option0"]
[endif]

[jump target="*E_mount_select"]
[s]

*E_mount_option0
;セクハラ
[Calc_Status]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice> 66 && tf.P_DRESS>0"][jump target="*E_mount_datui"]
[endif]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice> 49"][jump target="*E_mount_sukebe1"]
[else][jump target="*E_mount_sukebe2"]
[endif]

*E_mount_datui
[enemyname]はくぬぎの装束を剥ぎ取ろうとした[p]

[if exp="tf.OrgaStan > 0 && tf.P_DRESS > 1"]
絶頂で身動きの取れないくぬぎは一気に全裸に剥かれてしまった[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 0 , tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.OrgaStan > 0 && tf.P_DRESS > 0"]
絶頂で身動きの取れないくぬぎは為す術なく全裸にされた[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 0 , tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.P_DRESS > 1"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
くぬぎは下着姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]

[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
くぬぎは一糸まとわぬ姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]

[jump target="*mount_end"]
[s]

*E_mount_sukebe1
[enemyname]はくぬぎの胸を揉みしだいた[p]
[if exp="f.P_BOOB==1"]
#くぬぎ
いやあっ！！[p]
揉みしだかれたくぬぎの乳房から母乳が迸った[p]
#
[elsif exp="f.P_BOOB==2"]
#くぬぎ
いやあっ！！[p]
揉みしだかれたくぬぎの乳房から母乳が迸った[p]
#
[endif]
[eval exp="tf.RATE=2 + (f.P_BOOB*3) , tf.P_SEN = f.P_SEN_BB"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]

[if exp="tf.P_ERO >= 70 && tf.Arousal != 2"]
[eval exp="tf.Arousal = 2"]
くぬぎは興奮状態になった[p]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =0.8 , tf.ArousAGId =0.8 , tf.ArousDEXd =0.8 , tf.ArousAPPb =2 , tf.ArousPOWb =2 , tf.ArousSEXd =2"]
[endif]

[if exp="tf.Kaikan > 99 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
くぬぎは絶頂した[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]

[elsif exp="tf.Kaikan > 99 && tf.Orga >= 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
くぬぎは[emb exp="tf.OrgaCount"]回目の絶頂を迎えた[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]
[endif]
[jump target="*Orga_end" cond="tf.OrgaCount > 9"]
[jump target="*mount_end"]
[s]

*E_mount_sukebe2
[enemyname]はくぬぎの秘処をまさぐった[p]
[eval exp="tf.RATE=3 , tf.P_SEN = f.P_SEN_VG"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]

[if exp="tf.P_ERO >= 70 && tf.Arousal != 2"]
[eval exp="tf.Arousal = 2"]
くぬぎは興奮状態になった[p]
[endif]

[if exp="tf.Kaikan > 99 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
くぬぎは絶頂した[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]

[elsif exp="tf.Kaikan > 99 && tf.Orga >= 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
くぬぎは[emb exp="tf.OrgaCount"]回目の絶頂を迎えた[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]
[endif]
[jump target="*Orga_end" cond="tf.OrgaCount > 9"]
[jump target="*mount_end"]
[s]

*E_mount_option1
[enemyname]はくぬぎを締め上げた[p]
[quake count=3 time=300 hmax=30]
くぬぎの呼吸が１減少[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"][limit]
[if exp="tf.P_ACT == 0"][jump target="*Remount"][endif]
[jump target="*mount_end"]
[s]

*E_mount_option2
[enemyname]はくぬぎを締め上げた[p]
[quake count=5 time=300 hmax=20]
[Calc_Status]
[eval exp="tf.Damage=Math.floor(tf.E_STR * tf.E_charm_STR - tf.P_DUR) * 3"]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[if exp="f.P_MAZO>0"]
[eval exp="tf.RATE=f.P_MAZO*2 , tf.P_SEN = f.P_SEN_EX"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
[endif]
[jump target="*mount_end"]
[s]

*Remount
くぬぎは息切れした[p]
#敵
苦しそうだなフハハハ[p]
#
敵はくぬぎを拘束し直した[p]
[Calc_Status]
[eval exp="tf.Mount = tf.Mount + tf.E_BND * tf.E_charm_STR"]
[jump target="*mount_end"]
[s]

*mount_continue
くぬぎは拘束されている！[p]
[jump target="*P_mount_phase"]
[s]

*mount_end
;疲労処理
[eval exp="tf.Damage = Math.floor(tf.mount_turn / 3) + 1 , f.P_EXH = f.P_EXH + 1"]
くぬぎの疲労度が1上昇した[p][triage]
;火傷ダメージ
[if exp="tf.E_scald>1"]
[eval exp="tf.E_HP = tf.E_HP - 100"][limit]
火傷で[enemyname]の体力が100減少[p]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[triage]
[endif]
;セクハラ抵抗力をリセット
[eval exp="tf.P_DefSKBb1=1"]
;拘束継続
[if exp="tf.Esc != 1"]
[jump target="*mount_continue"]
[endif]
;ターンエンド処理
[eval exp="f.P_AUR = f.P_AUR + tf.P_ACT * 10"][eval exp="f.P_AUR=100" cond="f.P_AUR>100"]
[eval exp="f.E_AUR = f.E_AUR + 10"]
[eval exp="tf.P_ACT = tf.P_ACTmax , tf.E_ACT = f.E_ACT"]
[Initialize_1Tbuff][Refresh_3Tbuff]
;デバフと状態異常の回復
[eval exp="tf.E_DURd1=1 , tf.E_AGId1=1 , tf.E_DEXd1=1"]
[eval exp="tf.P_DURd1=1 , tf.P_AGId1=1 , tf.P_DEXd1=1"]
[jump target="*turn_start"]
[s]

*turn_end
ターン終了[p]
[eval exp="f.P_AUR = f.P_AUR + tf.P_ACT * 10"][eval exp="f.P_AUR=100" cond="f.P_AUR>100"]
[eval exp="f.E_AUR = f.E_AUR + 10"]
[eval exp="tf.P_ACT = tf.P_ACTmax , tf.E_ACT = f.E_ACT"]
[Initialize_1Tbuff][Refresh_3Tbuff]
;デバフと状態異常の回復
[eval exp="tf.E_DURd1=1 , tf.E_AGId1=1 , tf.E_DEXd1=1"]
[eval exp="tf.P_DURd1=1 , tf.P_AGId1=1 , tf.P_DEXd1=1"]
[jump target="*turn_start"]


*game_lose
[if exp="f.P_EXH >= 100"]
疲労のためにくぬぎは立ち上がれなくなった[p]
[endif]
くぬぎは敗北した。[p]
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO"][limit]
[GoSKB]
[if exp="tf.GoSKB == 1"]
#敵
ぐふふふふ！さぁて楽しませてもらおうか！！[p]
#くぬぎ
きゃあ！！[p]
#
[enemyname]下卑た笑みを浮かべくぬぎに手を伸ばしてきた。[p]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump target="*bochu"]
[endif]
#敵
おらっ！！大人しくしな！！[p]
#くぬぎ
くふっ！！[p]
「金燎様が生け捕りにしろと言っていたのはこの女だよな」[p]
「仕方ねぇ、屋敷まで運ぶか・・・」[p]
意識を失ったくぬぎを敵は抱えあげるとその場から立ち去った[p]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump storage="prison.ks" target="*start"]
[s]

*game_win
[chara_hide name="gouza"]
戦闘に勝利した。[p]
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO"]
[eval exp="tf.Temp = tf.Turn * 3 , f.P_EXH = f.P_EXH + tf.Temp"][limit]
[eval exp="f.P_EXH = 99" cond="f.P_EXH >= 100"]
疲労度が[emb exp="tf.Temp"]上昇した[p]
[chara_hide name="kunugi"]
[jump storage="scene1.ks"]
[s]

*Orga_end
#くぬぎ
もう・・・らめぇ・・・・[p]
#
くぬぎは立て続けの絶頂により気を失った[p]
「金燎様が生け捕りにしろと言っていたのはこの女だよな」[p]
「仕方ねぇ、屋敷まで運ぶか・・・」[p]
意識を失ったくぬぎを敵は抱えあげるとその場から立ち去った[p]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO"][limit]
[jump storage="prison.ks" target="*start"]
[s]

*bochu
[jump storage="bochu.ks" target="*start"]
[s]
