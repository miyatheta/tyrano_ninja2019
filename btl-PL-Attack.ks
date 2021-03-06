*攻撃1
[er]
[Calc_Status]
[eval exp="tf.Cost = 1 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 6.0 , tf.ACC = 50 , tf.CRTrate = 0.5"]
[Calc_P_Damage]
[call storage="voice-PL.ks" target="*vc-atk01"]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの攻撃を回避した[p]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage][er][Calc_Status][DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
;-------------------------------------------------------------------------------
*攻撃2
[er]
[Calc_Status]
[eval exp="tf.Cost = 2 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 10.0 , tf.ACC = 30 , tf.CRTrate = 1.0"]
[Calc_P_Damage]
[call storage="voice-PL.ks" target="*vc-atk02"]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの攻撃を回避した[p]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage][er][Calc_Status][DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
;-------------------------------------------------------------------------------
*攻撃3
[er]
[Calc_Status]
[eval exp="tf.Cost = 3 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 17.0 , tf.ACC = 10 , tf.CRTrate = 1.5"]
[Calc_P_Damage]
[call storage="voice-PL.ks" target="*vc-atk03"]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの攻撃を回避した[p]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage][er][Calc_Status][DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
[s]
;-------------------------------------------------------------------------------
*攻撃4
[er]
敵に中ダメージ＆命中低下[p]
[Calc_Status]
[eval exp="tf.Cost = 2 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 8.0 , tf.ACC = 30 , tf.CRTrate = 1.6"]
[Calc_P_DamageEx]
[call storage="voice-PL.ks" target="*vc-atk05"]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの手裏剣を回避した[p]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[r]
[EnName]の命中率が低下した（１ターン）[p]
[eval exp="tf.E_DEXd1 = 5"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage][er][Calc_Status][DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
;-------------------------------------------------------------------------------
*攻撃5
[er]
敵に小ダメージ&攻撃力低下[p]
[Calc_Status]
[eval exp="tf.Cost = 2 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 7.0 , tf.ACC = 40 , tf.CRTrate = 2.1"]
[Calc_P_DamageEx]
[call storage="voice-PL.ks" target="*vc-atk05"]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの撒き菱を回避した[p]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[r]
[EnName]の攻撃力が低下した（１ターン）[r]
[eval exp="tf.E_DEXd1 = 7.5"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage][er][Calc_Status][DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
