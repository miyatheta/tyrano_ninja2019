*game_lose
[MiniStatus]
くぬぎは敗北した。[p]
#敵
ぐふふふふ！さぁて楽しませてもらおうか！！[p]
#くぬぎ
きゃあ！！[p]
#
[EnName]は下卑た笑みを浮かべくぬぎに手を伸ばしてきた。[p]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump target="*bochu"]
[s]

*game_win
[MiniStatus]
[chara_hide name="gouza"]
戦闘に勝利した。[p]
[if exp="tf.Orga>0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0"][eval exp="tf.Arousal = 1"]
[endif]
[if exp="tf.Arousal == 1"]
くぬぎの欲情が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =0 , tf.ArousAGId =0 , tf.ArousDEXd =0 , tf.ArousMNDd =0"]
[endif]
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO , f.P_SAN = tf.P_SAN"]
[eval exp="f.P_EXH = 99" cond="f.P_EXH >= 100"]
[MiniStatus]
[chara_hide name="kunugi"]
[jump storage="scene1.ks"]
[s]

*Orga_end
#
短時間に５以上の理性を喪失した。[p]
もう戦えない！！[p]
「らめぇ・・・・」[p]
続け様の絶頂によりくぬぎはその場に力なくへたり込んだ[p]
「へっ、だらしねえな」[p]
「あううううう・・・」[p]
目の前に立った敵にくぬぎはいやいやと首を振りながら後ずさりをした[p]
くぬぎの怯えた表情と潤んだ瞳に敵は舌なめずりをしながら手を伸ばした[p]
「へへっ、お楽しみはこれからだぜ」[p]
「いやあああああああっ！！」[p]
[MiniStatus]
[jump target="*bochu"]
[s]

*bochu
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO , f.P_SAN = tf.P_SAN"][limit]
[MiniStatus]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump storage="bochu.ks" target="*start"]
[s]
