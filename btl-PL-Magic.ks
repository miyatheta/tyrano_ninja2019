*忍術1
[er]
[if exp="f.P_MGP < 10"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・火遁[p]
[Calc_Status]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , f.P_MGP = f.P_MGP - 10"]
[eval exp="tf.RATE = 20.0 , tf.ACC = 1000 , tf.CRTrate = 0"]

;乱数の発生
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[eval exp="tf.ATP = (tf.P_MND - tf.E_MND) * 20 + (tf.P_MND * 6)"]
[eval exp="tf.Damage = Math.floor(tf.ATP)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]

[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[DeActivate][MiniStatus][Triage]
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
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
[s]

*変わり身発動
[er]
変わり身の術[p]
なずな は衣服を身代わりに攻撃を回避した[p]
なずな は衣服を失った[r][EnName]の精神力が低下した[p]
[eval exp="tf.Mount = 0"]
[eval exp="tf.P_DRESS = 1"]
[chara_mod name="kunugi" face="seminude"]
[eval exp="tf.P_Barrier=0"]
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
;魅了による弱体化
[CHARM]
;スタンは抵抗判定、魅力VS理性の対抗ロール
[Calc_Status]
[eval exp="tf.TAG = Math.floor(tf.P_SEX - tf.E_MND) * 5 "]
[eval exp="tf.TAG = tf.TAG + 50"]
[dice99]
;魅了によるスタン
[if exp="tf.TAG > tf.dice"]
[eval exp="tf.E_Stan=1"]
[EnName]は前かがみになった。行動不能（1ターン）[p]
[endif]

[DeActivate][MiniStatus][Triage]
[jump storage="battle.ks" target="*手札一覧"]
[s]

*忍術4
[er]
[if exp="f.P_MGP < 1"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・早着替え[p]
なずなは目にも留まらぬ速さで装束を纏った[p]
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

*忍術6
[er]
[jump storage="battle.ks" target="*手札一覧"]
