
*気迫
「気迫」[p]
敵に気圧されてくぬぎの回避力が低下（１ターン）[p]
[eval exp="tf.P_AGId1 = 0.8"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*全力
「全力」[p]
敵の物理攻撃力が上昇[p]
[eval exp="tf.E_STRb3 = 1.2"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*捨て身
「捨て身」[p]
敵の物理攻撃力が上昇、耐久力が減少（1ターン）[p]
[eval exp="tf.E_STRb1 = 1.3 ,tf.E_DURb1 = 0.8"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*組付
組付[p]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 0 , tf.ACC = 0 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * tf.E_DEXd1 * 3 - tf.P_AGI * tf.ArousAGId)"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
命中：[emb exp="tf.HitRate"]％[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.HIT < tf.dice"]
くぬぎは敵に組み付かれた[p]
[jump storage="battle.ks" target="*mount_start"]
[else]
くぬぎは敵の組付を躱した[p]
[jump storage="battle.ks" target="*P_phase_start"]
[endif]
[s]
