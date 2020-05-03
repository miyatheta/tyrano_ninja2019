
*スキル１
[er]
命中率が上昇
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost"]
[eval exp="tf.P_DEXb1 = 5"]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル２
[er]
会心の一撃発生率上昇
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost"]
[eval exp="tf.P_LUKb1 = 5"]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル３
[er]
防御力が上昇
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost"]
[eval exp="tf.P_DURb1 = 10"]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル４
[er]
快感への耐性が大幅に上昇
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost"]
[eval exp="tf.P_MNDb1 = 10"]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル５
[er]
なずなは目にも留まらぬ速さで着衣した[l][er]
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost"]
[eval exp="tf.P_DRESS=2"]
[chara_mod name="kunugi" face="default"]
[DeActivate]
[jump storage="battle.ks" target="*技能"]
[s]

*スキル６
[er]
カウンター
[eval exp="tf.Cost = 3 , tf.Type='green' , f.Green = f.Green - tf.Cost , tf.P_ACT = tf.P_ACT + tf.Cost"]
[eval exp="tf.P_STRb1 = 5"]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*技能"]
