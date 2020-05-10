;-------------------------------------------------------------------------------
;リアクションセリフ集

;-------------------------------------------------------------------------------
;弱攻撃
*vc-atk01
[dice99]
[if exp="tf.CRI>1"]
「くらえっ！！」[p]
[return][s]
[elsif exp="tf.dice<25"]
「ていっ！！」[p]
[return][s]
[elsif exp="tf.dice<50"]
「せいっ！」[p]
[return][s]
[elsif exp="tf.dice<75"]
「はっ！」[p]
[return][s]
[else]
「やっ！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;中攻撃
*vc-atk02
[dice99]
[if exp="tf.CRI>1"]
「これなら！どうっ！？」[p]
[return][s]
[elsif exp="tf.dice<25"]
「てやぁっ！！」[p]
[return][s]
[elsif exp="tf.dice<50"]
「せやぁっ！」[p]
[return][s]
[elsif exp="tf.dice<75"]
「ちぇりゃぁっ！」[p]
[return][s]
[else]
「はあっ！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;強攻撃
*vc-atk03
[dice99]
[if exp="tf.CRI>1"]
「いっけぇぇぇっ！！！」[p]
[return][s]
[elsif exp="tf.dice<25"]
「でやぁぁっ！！」[p]
[return][s]
[elsif exp="tf.dice<50"]
「はあああっ！」[p]
[return][s]
[elsif exp="tf.dice<75"]
「ちぇすとぉっ！」[p]
[return][s]
[else]
「ふっとべ！！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;カウンター攻撃
*vc-counter
[dice99]
[if exp="tf.dice<33"]
「もらった！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「残念っ！」[p]
[return][s]
[else]
「隙ありっ！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;飛び道具
*vc-atk05
[dice99]
[if exp="tf.dice<33"]
「これでも食らえっ！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「離れなさいっ！」[p]
[return][s]
[else]
「当たって！！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;火遁
*vc-katon
[dice99]
[if exp="tf.dice<33"]
「燃えろっ！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「忍法・火遁の術！」[p]
[return][s]
[else]
「これで火だるまよっ！！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;変わり身
*vc-kawarimi
[dice99]
[if exp="tf.dice<33"]
「残念でしたっ！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「忍法・変わり身の術！」[p]
[return][s]
[else]
「大外れぇーーー！！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;被ダメ
*vc-damage
[dice99]
[if exp="tf.dice<33 && tf.P_HP<400"]
「ごぼっ！！！」[p]
[return][s]
[elsif exp="tf.dice<66 && tf.P_HP<400"]
「ぐぅっ・・・」[p]
[return][s]
[elsif exp="tf.P_HP<400"]
「ダメっ！！」[p]
[return][s]
[elsif exp="tf.dice<33 && tf.P_HP<1200"]
「ああっ！！」[p]
[return][s]
[elsif exp="tf.dice<66 && tf.P_HP<1200"]
「かはっ！！」[p]
[return][s]
[elsif exp="tf.P_HP<1200"]
「痛っ！！」[p]
[return][s]
[elsif exp="tf.dice<33"]
「ぐっ！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「きゃっ！！」[p]
[return][s]
[elsif exp="tf.dice<99"]
「くっ！！」[p]
[return][s]
[else]
「ちっ！！」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;敗北
*vc-lose
[dice99]
[if exp="tf.dice<33"]
「いやあああああっ！！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「そんな・・・こんなところで・・・」[p]
[return][s]
[else]
「まだ・・・負けるわけには・・・」[p]
[return][s]
[endif]

;-------------------------------------------------------------------------------
;嫌がる
*vc-iya
[dice99]
[if exp="tf.dice<33 && tf.Kaikan>90"]
「やんっ！！」[p]
[return][s]
[elsif exp="tf.dice<66 && tf.Kaikan>90"]
「やめてっ！！」[p]
[return][s]
[elsif exp="tf.Kaikan>90"]
「いやっ！！」[p]
[return][s]
[elsif exp="tf.dice<33"]
「この変態っ！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「ふざけないでっ！！」[p]
[return][s]
[else]
「やめなさいっ！！」[p]
[return][s]
[endif]
;-------------------------------------------------------------------------------
;嬌声
*vc-aeg
[dice99]
[if exp="tf.dice<33 && tf.Kaikan>90"]
「だめぇっ！！」[p]
[return][s]
[elsif exp="tf.dice<66 && tf.Kaikan>90"]
「ああんっ！！」[p]
[return][s]
[elsif exp="tf.Kaikan>90"]
「イヤぁっ！！」[p]
[return][s]
[elsif exp="tf.dice<33"]
「ひあっ！！」[p]
[return][s]
[elsif exp="tf.dice<66"]
「あんっ！！」[p]
[return][s]
[else]
「はひっ！！」[p]
[return][s]
[endif]
;-------------------------------------------------------------------------------
;戦闘時絶頂
*vc-btlOrga
[dice99]
[if exp="tf.dice<25"]
（あっ！そんなっ！戦いの最中なのにぃっ・・・！！）[p]
「イっくぅぅぅぅっ！！！！」[p]
[return][s]
[elsif exp="tf.dice<50"]
「もう、だめぇっ！！」[p]
「イっくぅぅぅぅっ！！！！」
[return][s]
[elsif exp="tf.dice<75"]
「いやぁっ！イクっ！！イクイクっ！！」[p]
「イっちゃうぅぅぅぅっ！！！！」[p]
[return][s]
[else]
「あんっ！あんっ！！ああっ！！」[p]
「いやあぁぁぁぁっ！！！！」[p]
[return][s]
[endif]
