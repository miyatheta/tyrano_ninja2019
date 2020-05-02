*忍術１
[er]
[if exp="f.P_MGP < 10"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・火遁[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost , f.P_MGP = f.P_MGP - 10"]
[eval exp="tf.RATE = 20.0 , tf.ACC = 1000 , tf.CRTrate = 0"]

[Calc_P_Damage]
[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[MiniStatus][Triage]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]

*忍術２
[er]
[if exp="f.P_MGP < 5"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・魅了[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost , f.P_MGP = f.P_MGP - 5"]
;感情は確定で上昇、上昇幅は抵抗値次第
[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP) * 4.5 * (100 - tf.E_SAN)/100 * (tf.E_ERO + 100)/100) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
[EnName]の欲情が[emb exp="tf.HDamage"]上昇した[p]
;魅了による弱体化
[EnName]は前かがみになった[p]
[eval exp="tf.E_charm_count=3 ,tf.E_charm_STR=0.6 ,tf.E_charm_DUR=0.7"]
[EnName]の攻撃力と防御力が減少した（3ターン）[p]
;スタンは抵抗判定、魅力VS理性と感情
[eval exp="tf.TAG = 100 + tf.E_SAN - tf.E_ERO - (tf.P_APP + tf.ArousAPPb - tf.E_APP)*3"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.TAG < tf.dice"]
;魅了によるスタン
[eval exp="tf.E_stan=1"]
[EnName]は行動不能になった（1ターン）[p]
[endif]
[Triage]
[jump target="*術の終了"]
[s]
[jump storage="battle.ks" target="*手札一覧"]

*忍術３
[er]
[if exp="f.P_MGP < 5"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・変わり身[p]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost , f.P_MGP = f.P_MGP - 5"]
[eval exp="tf.P_Barrier=1"]
[jump storage="battle.ks" target="*手札一覧"]

*忍術４
[er]
[if exp="f.P_MGP < 3"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]

なずな の忍術・着衣[p]
なずなは目にも留まらぬ速さで着衣した[l][er]
[eval exp="tf.Cost = 1 , tf.Type='blue' , f.Blue = f.Blue - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost , f.P_MGP = f.P_MGP - 3"]
[eval exp="tf.P_DRESS=2"]
[chara_mod name="kunugi" face="default"]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]

*忍術５
[er]
なずな の忍術・修羅[p]
３ターン攻撃力が増加し、欲情が増加しない。
[jump storage="battle.ks" target="*手札一覧"]

*忍術６
[er]
[jump storage="battle.ks" target="*手札一覧"]
