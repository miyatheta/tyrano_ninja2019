
*スキル1
[er]
命中率が上昇
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_DEXb1 = 5"]
[p]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル2
[er]
会心の一撃発生率上昇
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_LUKb1 = 10"]
[p]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル3
[er]
防御力が上昇
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_DURb1 = 10"]
[p]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル4
[er]
快感への耐性が大幅に上昇
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_MNDb1 = 10"]
[p]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル5
[er]
なずなは目にも留まらぬ速さで着衣した[p]
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_DRESS=2"]
[chara_mod name="kunugi" face="default"]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]
[s]

*スキル６
[er]
なずなは反撃の構えを取った[p]
[eval exp="tf.Cost = 3 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_Counter = 1"]
[p]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]
[s]

*PLカウンター発動
[er]
なずなの反撃[p]
[Calc_Status]
[eval exp="tf.RATE = 15.0 , tf.ACC = 1000 , tf.CRTrate = 1"]
[Calc_P_DamageEx]

[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.P_Counter = 0"]
[MiniStatus][Triage][return]
[s]
