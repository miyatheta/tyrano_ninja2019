*絶頂判定
;-------------------------------------------------------------------------------
;欲情判定
[if exp="tf.P_ERO >= 700 && tf.Arousal != 2"]
[eval exp="tf.Arousal = 2"]
なずなは欲情状態になった[p]
攻撃力が低下した[r]
敏捷さが低下した[r]
命中が低下した[r]
受ける快感が増幅[r]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousMNDd =1 "]
[endif]
;-------------------------------------------------------------------------------
;絶頂判定
;(敵の性技技能値SEX-P.MND-tf.P_MGP)+50⇒耐えた/失敗⇒スタン&SAN減少
[eval exp="tf.TAG = (tf.E_SEX - tf.P_MND - tf.P_MGP ) * 5 + 50"]
[dice99]
[if exp="tf.P_ERO > 999 && tf.TAG > tf.dice"]
[quake count=8 time=300 hmax=30]
なずなは絶頂を堪えた[p]

[elsif exp="tf.P_ERO > 999 && tf.Orga >= 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
なずなは[emb exp="tf.OrgaCount"]回目の絶頂を迎えた[p]
[eval exp="tf.Orga = 4 , tf.OrgaSEX = 3"]

[elsif exp="tf.P_ERO > 999 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
なずなは絶頂した[r]
絶頂状態になった。房中術が低下した。[p]
[eval exp="tf.Orga = 4 , tf.OrgaSEX = 3"]
[endif]

[return]
