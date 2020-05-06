
*スキル1
[er]
「必至」[r]
命中率が上昇(１ターン)[p]
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_DEXb1 = 5"]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル2
[er]
「心眼」[r]
会心の一撃発生率上昇(１ターン)[p]
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_LUKb1 = 20"]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル3
[er]
「金剛」[r]
物理防御力が大幅に上昇(１ターン)[p]
[eval exp="tf.Cost = 1 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_DURb1 = 20"]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル4
[er]
「瞑想」[r]
精神が大幅に上昇(３ターン)[p]
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_MNDb3 = 10"]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]

*スキル5
[er]
「練気」[r]
任意の手札を１枚追加します(この対戦中持続)[p]
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[Calc_Status][DeActivate]
*スキル5選択
[link target="*スキル5適用" exp="tf.TAG=1"]攻撃(赤)[endlink][r]
[link target="*スキル5適用" exp="tf.TAG=2"]技能(緑)[endlink][r]
[link target="*スキル5適用" exp="tf.TAG=3"]忍術(青)[endlink][r]
[s]
*スキル5適用
;Deckに要素を追加。カードの長さ＝追加するカードのナンバーになる。配列のナンバーは０から
[iscript]
f.Deck.push(f.Cards.length);
if(tf.TAG==1){
  f.Cards.push({color:"red",value:1,active:1,txt:"攻撃＋",tag:"*攻撃"});
}else if(tf.TAG==2){
  f.Cards.push({color:"green",value:1,active:1,txt:"技能＋",tag:"*技能"});
}else{
  f.Cards.push({color:"blue",value:1,active:1,txt:"忍術＋",tag:"*忍術"});
}
[endscript]
[DeckRemake][MiniStatus]
[jump storage="battle.ks" target="*技能"]
[s]

*スキル6
[er]
なずなは反撃の構えを取った(１ターン)[p]
[eval exp="tf.Cost = 2 , tf.Type='green' , f.Green = f.Green - tf.Cost "]
[eval exp="tf.P_Counter = 1"]
[Calc_Status][DeActivate]
[jump storage="battle.ks" target="*技能"]
[s]

*PLカウンター発動
[er]
なずなの反撃[p]
[Calc_Status]
[eval exp="tf.RATE = 10.0 , tf.ACC = 100 , tf.CRTrate = 1"]
[Calc_P_DamageEx]

[quake count=5 time=300 hmax=20]
[EnName]に[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[eval exp="tf.P_Counter = 0"]
[MiniStatus][Triage][return]
[s]
