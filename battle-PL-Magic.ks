*忍術1
[er]
[if exp="f.P_MGP < 10"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・火遁[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , f.P_MGP = f.P_MGP - 10"]
[eval exp="tf.RATE = 20.0 , tf.ACC = 1000 , tf.CRTrate = 0"]

[Calc_P_Damage]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[MiniStatus][Triage]
[p]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]

*忍術2
[er]
[if exp="f.P_MGP < 5"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]
[if exp="tf.P_DRESS < 2"]
衣服が無いとこの術は使えない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・変わり身[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , f.P_MGP = f.P_MGP - 5"]
[eval exp="tf.P_Barrier=1"]
[jump storage="battle.ks" target="*手札一覧"]
[s]

*変わり身発動
[er]
変わり身の術[p]
なずな は衣服を身代わりに攻撃を回避した[p]
なずな は衣服を失った[p]
[eval exp="tf.Mount = 0"]
[eval exp="tf.P_DRESS = 1"]
[chara_mod name="kunugi" face="nude"]
[return]
[s]

*忍術3
[er]
[if exp="f.P_MGP < 5"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・魅了[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , f.P_MGP = f.P_MGP - 5"]
;感情は確定で上昇
[eval exp="tf.HDamage = Math.floor(tf.P_APP - tf.E_MND) * 10 , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
[EnName]の欲情が[emb exp="tf.HDamage"]上昇した[p]

;魅了による弱体化
[eval exp="tf.E_charm_count = 3 , tf.E_charm_STR = 2 , tf.E_charm_MND = 2"]
[EnName]の攻撃力と理性が低下した（3ターン）[p]

;スタンは抵抗判定、魅力VS理性の対抗ロール
[Calc_Status]
[eval exp="tf.TAG = Math.floor(tf.P_APP - tf.E_MND) * 5 "]
[eval exp="tf.TAG = tf.TAG + 50"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

;魅了によるスタン
[if exp="tf.TAG < tf.dice"]
[eval exp="tf.E_stan=1"]
[EnName]は行動不能になった（1ターン）[p]
[endif]

[Triage]
[jump storage="battle.ks" target="*手札一覧"]
[s]

*忍術4
[er]
[if exp="f.P_MGP < 3"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・着衣[p]
なずなは目にも留まらぬ速さで着衣した[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , f.P_MGP = f.P_MGP - 3"]
[eval exp="tf.P_DRESS=2"]
[chara_mod name="kunugi" face="default"]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]

*忍術5
[er]
なずな の忍術・修羅[p]
３ターン攻撃力が増加し、欲情が増加しない。
[jump storage="battle.ks" target="*手札一覧"]

*忍術６
[er]
[jump storage="battle.ks" target="*手札一覧"]
