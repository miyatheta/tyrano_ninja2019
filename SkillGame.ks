*start
[eval exp="tf.label = f.P_Skill[f.SkillSet[0]]['label']"]
[eval exp="tf.Cost = f.P_Skill[f.SkillSet[0]]['cost']"]
[eval exp="tf.MP = f.P_Skill[f.SkillSet[0]]['MP']"]

*Question
[emb exp="tf.MP"]/[emb exp="tf.Cost"][p]
[eval exp="tf.Max=99 ,tf.Min=0"][dice]
[if exp="tf.dice>66"][jump target="*Q1"]
[elsif exp="tf.dice>33"][jump target="*Q2"]
[else][jump target="*Q3"]
[endif]
[s]

*Q1
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>79"][eval exp="tf.Sample='水' "]
[elsif exp="tf.dice>59"][eval exp="tf.Sample='金' "]
[elsif exp="tf.dice>39"][eval exp="tf.Sample='土' "]
[elsif exp="tf.dice>19"][eval exp="tf.Sample='火' "]
[else][eval exp="tf.Sample='木' "]
[endif]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="水"  exp="tf.Answer='水'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="金"  exp="tf.Answer='金'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="土"  exp="tf.Answer='土'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="火"  exp="tf.Answer='火'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="木"  exp="tf.Answer='木'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Q2
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>79"][eval exp="tf.Sample='子' "]
[elsif exp="tf.dice>59"][eval exp="tf.Sample='丑' "]
[elsif exp="tf.dice>39"][eval exp="tf.Sample='寅' "]
[elsif exp="tf.dice>19"][eval exp="tf.Sample='卯' "]
[else][eval exp="tf.Sample='辰' "]
[endif]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="子"  exp="tf.Answer='子'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="丑"  exp="tf.Answer='丑'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="寅"  exp="tf.Answer='寅'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="卯"  exp="tf.Answer='卯'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="辰"  exp="tf.Answer='辰'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Q3
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>79"][eval exp="tf.Sample='赤' "]
[elsif exp="tf.dice>59"][eval exp="tf.Sample='黒' "]
[elsif exp="tf.dice>39"][eval exp="tf.Sample='黄' "]
[elsif exp="tf.dice>19"][eval exp="tf.Sample='白' "]
[else][eval exp="tf.Sample='青' "]
[endif]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="赤"  exp="tf.Answer='赤'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="黒"  exp="tf.Answer='黒'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="黄"  exp="tf.Answer='黄'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="白"  exp="tf.Answer='白'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="青"  exp="tf.Answer='青'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Kotae
[wait_cancel]
[if exp="tf.Sample == tf.Answer"]
成功[wt5]
[eval exp="tf.MP=tf.MP+1"]

[else]
[eval exp="tf.MP=-1"]
失敗[wt7]
くぬぎは術の発動に失敗した[p]
[jump target="*術の終了"]
[endif]

[if exp="tf.MP >= tf.Cost"]
術の発動[p]
[jump target="&tf.label"]
[else]
[jump target="*Question"]
[endif]
[s]

*timeout
[cm]
時間切れ[p]
[eval exp="tf.MP=-1"]
失敗[p]
くぬぎは術の発動に失敗した[p]
[jump target="*術の終了"]
[s]

*P_skill0
集気法[p]
[Calc_Status]
[eval exp="tf.P_ACT = tf.P_ACT+1 , tf.P_ERO = tf.P_ERO-10"][limit]
[jump target="*術の終了"]
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
[jump target="*術の終了"]
[s]

*P_skill2
くぬぎの忍術・空蝉[p]
#
一度だけダメージを無効化する。（途中で衣服を失った場合は発動しない）[p]
[eval exp="tf.P_Barrier=1"]
[jump target="*術の終了"]
[s]

*P_skill3
[image layer=2 page=back top=150 storage="CUT/顔アップ.png"][trans layer=2 time=2000][wt]
くぬぎの忍術・魅了[p]
[image layer=3 page=back storage="CUT/部分拡大.png"][trans layer=3 time=1000]
[freeimage layer=2 page=back][trans layer=2 time=500][wt]
#くぬぎ
あはぁん[p]
#
くぬぎは胸を抱き寄せて見せた[p]
[freeimage layer=3 time=500][wt]
[Calc_Status]
;感情は確定で上昇、上昇幅は抵抗値次第
[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP) * 4.5 * (100 - tf.E_SAN)/100 * (tf.E_ERO + 100)/100) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
[enemyname]の欲情が[emb exp="tf.HDamage"]上昇した[p]
;魅了による弱体化
[enemyname]は前かがみになった[p]
[eval exp="tf.E_charm_count=3 ,tf.E_charm_STR=0.7 ,tf.E_charm_AGI=0.6"]
[enemyname]の攻撃力と回避力が減少した（3ターン）[p]
;スタンは抵抗判定、魅力VS理性と感情
[eval exp="tf.TAG = 100 + tf.E_SAN - tf.E_ERO - (tf.P_APP + tf.ArousAPPb - tf.E_APP)*3"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.TAG < tf.dice"]
;魅了によるスタン
[eval exp="tf.E_stan=1"]
[enemyname]は行動不能になった（1ターン）[p]
[endif]
[triage]
[jump target="*術の終了"]
[s]

*P_skill4
くぬぎの忍術・早着替え[p]
#
くぬぎは目にも留まらぬ速さで着衣した[p]
[eval exp="tf.P_DRESS=2"]
[chara_mod name="kunugi" face="default"]
[jump target="*術の終了"]
[s]

*P_skill5
[image layer=2 page=back top=150 storage="CUT/顔アップ.png"][trans layer=2 time=2000][wt]
くぬぎの忍術・螺旋功[p]
[freeimage layer=2 page=back][trans layer=2 time=500][wt]
[call target="*E_Def_select"]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][eval exp="tf.ATP = (tf.P_POW * tf.OrgaPOWb + tf.ArousPOWb) * 30 + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP + 1)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[quake count=5 time=300 hmax=20]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*術の終了"]
[s]

*E_Def_select
[Calc_Status]
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.dice>tf.E_ACT-1"]
;防御
[eval exp="tf.E_AVD=0 , tf.E_GRD=1.5 , tf.E_ACT=tf.E_ACT-0"]
[enemyname]:防御[r]
[else]
;回避
[eval exp="tf.E_AVD = Math.floor(tf.E_AGI * tf.E_charm_AGI * 3) , tf.E_GRD=0 , tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.AvoidRate = 100 - Math.floor(tf.HitRate/10 * (100 - tf.E_AVD)/10)"][limit]
[enemyname]回避：[emb exp="tf.AvoidRate"]％[r]
[endif]
[return]

*術の終了
[iscript]
f.SkillSet.splice(0,1)
[endscript]
[jump storage="battle.ks" target="*カードの実行"]
[s]
