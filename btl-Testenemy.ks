;------------------------------------------------------------------------------
;攻撃パターン選択

*敵攻撃パターン選択
[dice99]
[if exp="tf.dice<20"]
[eval exp="tf.enemy_attack_pattern=1"]
[image layer=3 storage="card/Card_B.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[elsif exp="tf.dice<50"]
[eval exp="tf.enemy_attack_pattern=2"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_B.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]

[elsif exp="tf.dice<60"]
[eval exp="tf.enemy_attack_pattern=3"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[elsif exp="tf.dice<80"]
[eval exp="tf.enemy_attack_pattern=4"]
[image layer=3 storage="card/Card_G.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[else]
[eval exp="tf.enemy_attack_pattern=5"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_G.png" x=650 y=300 width=50 visible=true]

[endif]
[jump storage="battle.ks" target="*手番開始"]
[s]

;------------------------------------------------------------------------------
;攻撃パターン選択怒り状態
*敵攻撃パターン選択怒り
[dice99]
[if exp="tf.dice<20"]
[eval exp="tf.enemy_attack_pattern=1"]
[image layer=3 storage="card/Card_B.png" x=600 y=300 width=50 visible=true]

[elsif exp="tf.dice<30"]
[eval exp="tf.enemy_attack_pattern=2"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]

[elsif exp="tf.dice<50"]
[eval exp="tf.enemy_attack_pattern=3"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[elsif exp="tf.dice<80"]
[eval exp="tf.enemy_attack_pattern=4"]
[image layer=3 storage="card/Card_G.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[else]
[eval exp="tf.enemy_attack_pattern=5"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_G.png" x=650 y=300 width=50 visible=true]

[endif]
[jump storage="battle.ks" target="*手番開始"]
[s]

;------------------------------------------------------------------------------
;攻撃パターン選択欲情状態
*敵攻撃パターン選択欲情
[dice99]
[if exp="tf.dice<30"]
[eval exp="tf.enemy_attack_pattern=1"]
[image layer=3 storage="card/Card_B.png" x=600 y=300 width=50 visible=true]

[elsif exp="tf.dice<50"]
[eval exp="tf.enemy_attack_pattern=2"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]

[elsif exp="tf.dice<60"]
[eval exp="tf.enemy_attack_pattern=3"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[elsif exp="tf.dice<80"]
[eval exp="tf.enemy_attack_pattern=4"]
[image layer=3 storage="card/Card_G.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_R.png" x=650 y=300 width=50 visible=true]

[else]
[eval exp="tf.enemy_attack_pattern=5"]
[image layer=3 storage="card/Card_R.png" x=600 y=300 width=50 visible=true]
[image layer=3 storage="card/Card_G.png" x=650 y=300 width=50 visible=true]

[endif]
[jump storage="battle.ks" target="*手番開始"]
[s]
;------------------------------------------------------------------------------
;攻撃パターン適用

*敵攻撃パターン適用
[jump target="*敵攻撃パターン1" cond="tf.enemy_attack_pattern==1"]
[jump target="*敵攻撃パターン2" cond="tf.enemy_attack_pattern==2"]
[jump target="*敵攻撃パターン3" cond="tf.enemy_attack_pattern==3"]
[jump target="*敵攻撃パターン4" cond="tf.enemy_attack_pattern==4"]
[jump target="*敵攻撃パターン5" cond="tf.enemy_attack_pattern==5"]
[s]

*敵攻撃パターン1
[call target="*組付"][P_Barrier]
[jump storage="btl-bound.ks" target="*拘束開始" cond="tf.Mount > 0"]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン2
[call target="*弱攻撃"][P_Counter][P_Barrier]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン3
[call target="*強攻撃"][P_Counter][P_Barrier]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン4
[call target="*剛力"]
[call target="*弱攻撃"][P_Counter][P_Barrier]
[jump storage="battle.ks" target="*ターン終了"][s]

*敵攻撃パターン5
[call target="*弱攻撃"][P_Counter][P_Barrier]
[call target="*金縛り"]
[jump storage="battle.ks" target="*ターン終了"][s]

;------------------------------------------------------------------------------
;攻撃の実行

*弱攻撃
[EnName]の弱攻撃[p]
[Calc_Status]
[eval exp="tf.RATE = 6.0 , tf.ACC = 60 , tf.CRTrate = 0.5"]
[Calc_E_Damage]
[if exp="tf.AvoidRate > tf.dice && tf.P_Stan < 1"]
[eval exp="tf.P_Counter=2" cond="tf.P_Counter==1"]
なずなは敵の攻撃を回避した[p]

[elsif exp="tf.P_Barrier==1"]
;変わり身の発動
[eval exp="tf.P_Barrier=2"]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
なずなに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"]
[limit][MiniStatus][Triage][MAZO][Orgasm][SANcheck]

[else]
[quake count=5 time=300 hmax=20]
なずなに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"]
[limit][MiniStatus][Triage][MAZO][Orgasm][SANcheck]
[endif]

[return]
[s]

*組付
[EnName]の組付[p]
[Calc_Status]
[eval exp="tf.ACC = 100"]
[Calc_E_Hit]
[if exp="tf.AvoidRate > tf.dice && tf.P_Stan < 1"]
なずなは敵の組付を躱した[p]

[elsif exp="tf.P_Barrier==1"]
;変わり身の発動
[eval exp="tf.P_Barrier=2"]

[else]
なずなは敵に組み付かれた[p]
[eval exp="tf.Mount = 1000"]
[endif]
[return]
[s]

*強攻撃
「大木断」[p]
大上段から薙刀が叩きつけられた[p]
[Calc_Status]
[eval exp="tf.RATE = 14.0 , tf.ACC = 40 , tf.CRTrate = 1.5"]
[Calc_E_Damage]

[if exp="tf.AvoidRate > tf.dice && tf.P_Stan < 1"]
[eval exp="tf.P_Counter=2" cond="tf.P_Counter==1"]
なずなは敵の攻撃を回避した[p]

[elsif exp="tf.P_Barrier==1"]
;変わり身の発動
[eval exp="tf.P_Barrier=2"]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
なずなに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[MiniStatus][Triage][MAZO][Orgasm][SANcheck]
[else]

[quake count=5 time=300 hmax=20]
なずなに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[MiniStatus][Triage][MAZO][Orgasm][SANcheck]
[endif]

[return]
[s]

*剛力
[EnName]の「剛力」[p]
[EnName]の物理攻撃力が上昇(１ターン)[p]
[eval exp="tf.E_STRb1 = 5"]
[return]
[s]

*金縛り
[EnName]の「金縛りの術」[p]
[dice99]
[eval exp="tf.TAG = Math.floor(tf.P_MND)"]
目標値[emb exp="tf.TAG"]以下＞ダイス[emb exp="tf.dice"][p]
[if exp="tf.TAG > tf.dice"]
しかし、なずな には効果がなかった[p]
[else]
なずな の回避が低下(３ターン)[p]
[eval exp="tf.P_AGId3 = 5 "][limit]
[endif]
[return]
[s]

;------------------------------------------------------------------------------
;拘束時の行動選択

*敵拘束行動選択
[jump target="*敵行動選択怒り" cond="tf.E_anger_count>0"]
[jump target="*敵行動選択欲情" cond="tf.E_charm_count>0"]
[dice99]
[if exp="tf.dice<20"][eval exp="tf.enemy_attack_pattern=1"]
[elsif exp="tf.dice<40"][eval exp="tf.enemy_attack_pattern=2"]
[elsif exp="tf.dice<60"][eval exp="tf.enemy_attack_pattern=3"]
[elsif exp="tf.dice<80"][eval exp="tf.enemy_attack_pattern=4"]
[else][eval exp="tf.enemy_attack_pattern=5"]
[endif]
[jump storage="btl-bound.ks" target="*敵拘束行動パターン適用"]
[s]

*敵拘束行動選択怒り
[dice99]
[if exp="tf.dice<20"][eval exp="tf.enemy_attack_pattern=1"]
[elsif exp="tf.dice<30"][eval exp="tf.enemy_attack_pattern=2"]
[elsif exp="tf.dice<40"][eval exp="tf.enemy_attack_pattern=3"]
[elsif exp="tf.dice<70"][eval exp="tf.enemy_attack_pattern=4"]
[else][eval exp="tf.enemy_attack_pattern=5"]
[endif]
[jump storage="btl-bound.ks" target="*敵拘束行動パターン適用"]
[s]

*敵拘束行動選択欲情
[dice99]
[if exp="tf.dice<30"][eval exp="tf.enemy_attack_pattern=1"]
[elsif exp="tf.dice<55"][eval exp="tf.enemy_attack_pattern=2"]
[elsif exp="tf.dice<80"][eval exp="tf.enemy_attack_pattern=3"]
[elsif exp="tf.dice<90"][eval exp="tf.enemy_attack_pattern=4"]
[else][eval exp="tf.enemy_attack_pattern=5"]
[endif]
[jump storage="btl-bound.ks" target="*敵拘束行動パターン適用"]
[s]

;------------------------------------------------------------------------------
;拘束時の行動実行

*敵拘束行動1
;脱衣
[dice05]
[jump target="*敵拘束行動2" cond="tf.P_DRESS < 1 && tf.dice < 3"]
[jump target="*敵拘束行動3" cond="tf.P_DRESS < 1"]
[EnName]はなずな の装束を剥ぎ取ろうとした[p]

[if exp="tf.OrgaStan > 0 && tf.P_DRESS > 1"]
絶頂で身動きの取れないなずな は一気に全裸に剥かれてしまった[r][EnName]の精神力が低下した[p]
[eval exp="tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.OrgaStan > 0 && tf.P_DRESS > 0"]
絶頂で身動きの取れないなずな は為す術なく全裸にされた[r][EnName]の精神力が低下した[p]
[eval exp="tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.P_DRESS > 1"]
[eval exp="tf.P_DRESS = 1"]
なずな は下着姿に剥かれた[r][EnName]の精神力が低下した[p]
[chara_mod name="kunugi" face="seminude"]

[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_DRESS = 0"]
なずな は一糸まとわぬ姿に剥かれた[r][EnName]の精神力が低下した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[jump storage="btl-bound.ks" target="*敵拘束行動終了"]
[s]

;------------------------------------------------------------------------------
*敵拘束行動2
[eval exp="tf.RATE= f.P_BOOB"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Kaikan , tf.E_Sukeb_MND += 1"][limit]

[EnName]はなずな の胸を揉みしだいた[p]
[if exp="f.P_BOOB==2"]
揉みしだかれたなずな の乳房から母乳が迸った[p]
[call storage="voice-PL.ks" target="*vc-aeg"]
[elsif exp="tf.P_ERO>500"]
[call storage="voice-PL.ks" target="*vc-aeg"]
[else]
[call storage="voice-PL.ks" target="*vc-iya"]
[endif]

[emb exp="tf.Kaikan"]の快感[r]なずな の欲情が[emb exp="tf.Kaikan"]上昇した[r]
[EnName]の精神力が低下した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][MiniStatus]
[jump storage="btl-bound.ks" target="*敵拘束行動終了"]
[s]

;------------------------------------------------------------------------------
*敵拘束行動3
[eval exp="tf.RATE = 2"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Kaikan , tf.E_Sukeb_MND += 1"][limit]

[EnName]はなずな の秘処をまさぐった[p]
[if exp="tf.P_ERO>500"]
[call storage="voice-PL.ks" target="*vc-aeg"]
[else]
[call storage="voice-PL.ks" target="*vc-iya"]
[endif]

[emb exp="tf.Kaikan"]の快感[r]なずな の欲情が[emb exp="tf.Kaikan"]上昇した[r]
[EnName]の精神力が低下した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][MiniStatus]
[jump storage="btl-bound.ks" target="*敵拘束行動終了"]
[s]

;------------------------------------------------------------------------------
*敵拘束行動4
[Calc_Status]
[eval exp="tf.Damage=Math.floor(tf.E_STR ) * 3"]

[EnName]の攻撃[p]
[quake count=3 time=300 hmax=30]
[call storage="voice-PL.ks" target="*vc-damage"]
なずな に[emb exp="tf.Damage"]のダメージ[p]

[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[MiniStatus][Triage][MAZO][Orgasm][SANcheck][MiniStatus]
[jump storage="btl-bound.ks" target="*敵拘束行動終了"]
[s]

;------------------------------------------------------------------------------
*敵拘束行動5
[Calc_Status]
[eval exp="tf.Damage=Math.floor(tf.E_STR ) * 3"]

[EnName]はなずな を締め上げた[p]
[quake count=5 time=300 hmax=20]
[call storage="voice-PL.ks" target="*vc-damage"]
なずな に[emb exp="tf.Damage"]のダメージ[r]
なずなの疲労度が１上昇した[p]

[Hirou]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[MiniStatus][Triage][MAZO][Orgasm][SANcheck][MiniStatus]
[jump storage="btl-bound.ks" target="*敵拘束行動終了"]
[s]
