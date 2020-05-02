*敵攻撃パターン選択
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice<20"]   [eval exp="tf.enemy_attack_pattern=1"][image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[elsif exp="tf.dice<40"][eval exp="tf.enemy_attack_pattern=2"][image layer=3 storage="card/Card_B.png" x=600 y=300 width=50 visible=true]
[elsif exp="tf.dice<60"][eval exp="tf.enemy_attack_pattern=3"][image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true][image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]
[elsif exp="tf.dice<80"][eval exp="tf.enemy_attack_pattern=4"][image layer=3 storage="card/Card_G.png" x=600 y=300 width=50 visible=true][image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]
[else]                  [eval exp="tf.enemy_attack_pattern=5"][image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true][image layer=3 storage="card/Card_G.png" x=650 y=300 width=50 visible=true]
[endif]
[jump storage="battle.ks" target="*手番開始"]
[s]

*敵攻撃パターン適用
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==1"]
[jump target="*敵攻撃パターン2" cond="tf.enemy_attack_pattern==2"]
[jump target="*敵攻撃パターン3" cond="tf.enemy_attack_pattern==3"]
[jump target="*敵攻撃パターン4" cond="tf.enemy_attack_pattern==4"]
[jump target="*敵攻撃パターン5" cond="tf.enemy_attack_pattern==5"]
[s]

*敵攻撃パターン1
[call target="*弱攻撃"]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン2
[call target="*組付"]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン3
[call target="*強攻撃"]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン4
[call target="*練気法"]
[call target="*弱攻撃"]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン5
[call target="*弱攻撃"]
[call target="*金縛り"]
[jump storage="battle.ks" target="*ターン終了"][s]

*弱攻撃
[EnName]の弱攻撃[p]
[Calc_Status]
[eval exp="tf.RATE = 6.0 , tf.ACC = 60 , tf.CRTrate = 0.5"]
[Calc_E_Damage]
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
[return]
[s]

*組付
[EnName]の組付[p]
[Calc_Status]
[eval exp="tf.HIT = 40"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[eval exp="tf.AvoidRate = 50 + (tf.P_AGI - tf.HIT) * 5 "][limit]
[if exp="tf.AvoidRate > tf.dice"]
なずなは敵の組付を躱した[p]
[return]
[endif]
なずなは敵に組み付かれた[p]
;[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[jump storage="battle-bound.ks" target="*拘束開始"]
[s]

*強攻撃
「大木断」[p]
大上段から薙刀が叩きつけられた[p]
[Calc_Status]
[eval exp="tf.HIT=10"]
[eval exp="tf.RATE = 12.0 , tf.ACC = 20 , tf.CRTrate = 1.5"]
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
[return]
[s]

*練気法
「練気法」[p]
敵の物理攻撃力が上昇[p]
[eval exp="tf.E_STRb1 = 0.3"]
[return]
[s]

*金縛り
「金縛り」[p]
敵に気圧されたなずなの命中が低下[p]
[eval exp="tf.P_DEXd1 = tf.P_DEXd1 + 0.3 "][limit]
[return]
[s]
