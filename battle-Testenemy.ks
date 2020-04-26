*敵攻撃パターン選択
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice<20"][eval exp="tf.enemy_attack_pattern=1"][image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[elsif exp="tf.dice<40"][eval exp="tf.enemy_attack_pattern=2"][image layer=3 storage="card/Card_G.png" x=600 y=300 width=50 visible=true]
[elsif exp="tf.dice<60"][eval exp="tf.enemy_attack_pattern=3"][image layer=3 storage="card/Card_B.png" x=600 y=300 width=50 visible=true]
[elsif exp="tf.dice<80"][eval exp="tf.enemy_attack_pattern=4"][image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[else][eval exp="tf.enemy_attack_pattern=5"][image layer=3 storage="card/Card_G.png" x=600 y=300 width=50 visible=true]
[endif]
[jump storage="battle.ks" target="*手番開始"]
[s]

*敵攻撃パターン適用
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==1"]
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==2"]
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==3"]
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==4"]
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==5"]
[s]

*敵攻撃パターン1
[enemyname]の薙ぎ払い[p]
[Calc_Status]
[eval exp="tf.HIT=30"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * 2 + tf.dice)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.3" cond="tf.dice <= f.E_LUK * 4 * tf.CRTrate"]
[eval exp="tf.ATP = 5 * tf.E_STR * tf.E_charm_STR * tf.CRT"]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.AvoidRate = tf.P_AGI + tf.P_AVD * 20 - tf.HIT "][limit]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.AvoidRate > tf.dice && tf.P_Stan < 1"]
なずなは敵の攻撃を回避した[p]
[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
なずなに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[else]
[quake count=5 time=300 hmax=20]
なずなに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage]
[MAZO][Orgasm][SANcheck]
[jump storage="battle.ks" target="*ターン終了"]

*敵攻撃パターン2
[enemyname]の組付[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.P_AVD>0 && tf.AvoidRate > tf.dice"]
なずなは敵の組付を躱した[p]
[jump storage="battle.ks" target="*ターン終了"]
[endif]
なずなは敵に組み付かれた[p]
;[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[jump storage="battle-bound.ks" target="*拘束開始"]
[s]

*敵攻撃パターン3

*敵攻撃パターン4

*敵攻撃パターン5

*敵攻撃パターン6
