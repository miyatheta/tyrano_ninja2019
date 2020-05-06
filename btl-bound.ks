*拘束開始
[Calc_Status][limit]

;------------------------------------------------------------------------------

*ターン開始
[Reflesh_PL_buff]
;ターン開始
[eval exp="tf.Turn +=1"]
;状態異常のカウント・治癒

;絶頂
[eval exp="tf.Orga = tf.Orga - 1"]
[if exp="tf.Orga > 0"]
なずな は絶頂の余韻から抜け出せないでいる![p]
[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
なずな は絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1"]
[eval exp="tf.Arousal = 1"]
[endif]

;欲情
[if exp="tf.Arousal == 1"]
なずな の欲情が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =0 , tf.ArousAGId =0 , tf.ArousDEXd =0 "]
[endif]

;スタン
[if exp="tf.E_stan>0"]
[eval exp="tf.E_stan=0"]
[EnName]が自由に動けるようになった[p][endif]
[MiniStatus]

[if exp="tf.Orga==4 && tf.dice>49"]
なずな は絶頂の衝撃で動けない(行動不能)[p]
[eval exp="tf.OrgaStan = 1"]
[eval exp="tf.Orga = tf.Orga-1"]
[jump target="*攻守交代"]

[elsif exp="tf.Orga>0"]
なずな は絶頂の余韻から抜け出せない[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.Orga = tf.Orga-1 "]
[MiniStatus]

[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
なずな は絶頂から抜け出した[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1 , tf.Arousal = 1"]
[endif]

[if exp="tf.Arousal == 1"]
なずな の欲情が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 "]
[eval exp="tf.ArousSTRd =0 , tf.ArousAGId =0 , tf.ArousDEXd =0 , tf.ArousMNDd =0 "]
[endif]
[MiniStatus]

;------------------------------------------------------------------------------
;PLの手番

*手番開始
[MiniStatus]
[glink text="手番開始" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札構築" ]
[s]

*手札構築
[CardShuffle]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[ShowCardList]
[Calc_Card]

*手札一覧
[er]
[ShowCardList]
[MiniStatus]
[if exp="f.Black>=3"][wt7][jump target="*息切れ"][endif]
[glink text="拘束中" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札一覧"]
[s]

*攻撃
[er]
[if exp="f.Red<1"][jump target="*手札一覧"][endif]
[if exp="f.Red>0"][link target="*攻撃2"]
抵抗する：STRに応じて拘束値を減少[endlink][endif][r]
[if exp="f.Red>0"][link target="*攻撃3"]
暴れる：STRに応じて拘束値を大きく減少。疲労が１増加[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink]
[s]

*技能
[er]
[if exp="f.Green<1"][jump target="*手札一覧"][endif]
[if exp="f.Green>0"][link target="*スキル1"]
深呼吸：疲労と欲情を減少[endlink][endif][r]
[if exp="f.Green>0"][link target="*スキル2"]
縄抜け：技量に応じて確率で拘束を解除。拘束値が低いほど確率アップ[endlink][endif][r]
[if exp="f.Green>0"][link target="*スキル3"]
急所狙い：運に応じて確率で拘束を解除。敵が怒り状態になる[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink]
[s]

*忍術
[er]
[if exp="f.Blue<1"][jump target="*手札一覧"][endif]
[if exp="f.Blue>0"][link target="*忍術1"]
色仕掛け（気力0）：房中術に応じて確率で敵の怒り状態を解除[endlink][endif][r]
[if exp="f.Blue>0"][link target="*忍術2"]
空蝉の術（気力10）：拘束を解除する[endlink][endif][r]
[if exp="f.Blue>0"][link target="*忍術3"]
魅了の術（気力5）：房中術に応じて敵を弱体化、確率で拘束解除[endlink][endif][r]
;[if exp="f.Blue>0"][link target="*忍術4"]忍術3房中術（気力3）[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink]
[s]

*疲労
[er]
疲労カードにコマンド、ボーナスはありません。[r]手札に疲労カードが3枚集まると息切れ(スタン)します。[r]
息切れ発生時、疲労カードが3枚消えます[p]
[jump storage="battle.ks" target="*手札一覧"]
[s]

;------------------------------------------------------------------------------
;PLの攻撃

*攻撃2
[er]
なずなは抵抗した
[quake count=5 time=300 hmax=20]
[lr]
[Calc_Status]
[eval exp="tf.Resist = tf.P_STR + (f.Red*2) + tf.E_charm_STR"][dice05]
[eval exp="tf.Resist = Math.floor(tf.Resist * 8) - (tf.E_BND*4) + tf.dice"]
[eval exp="tf.Resist = 1" cond="tf.Resist<1"]
拘束が[emb exp="tf.Resist"]緩んだ[p]
[eval exp="tf.Mount = tf.Mount - tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[jump target="*攻守交代"]

*攻撃3
[er]
なずなは暴れた
[quake count=1 time=100 hmax=30]
[lr]
[Calc_Status]
[eval exp="tf.Resist = tf.P_STR + (f.Red*2) + tf.E_charm_STR"][dice05]
[eval exp="tf.Resist = Math.floor(tf.Resist * 12) - (tf.E_BND*4) + tf.dice"]
[eval exp="tf.Resist = 1" cond="tf.Resist<1"]
拘束が[emb exp="tf.Resist"]緩んだ[r]
疲労が１増加した[p]
[Hirou]
[eval exp="tf.Mount = tf.Mount - tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[jump target="*攻守交代"]

;------------------------------------------------------------------------------
;PLのスキル

*スキル1
[er]
なずな は呼吸を整えた[p]
[eval exp="tf.P_ERO -= 100"][limit]
[if exp="tf.P_EXH > 0"]
[MiniStatus]
;疲労カード削除
[iscript]
i = 0;
n = 0;
while(n < 1){
  if(f.Cards[i]['color']=="black"){
    f.Cards.splice([i],1);
    n++;
  }
  else{
    i++;
  }
}
f.P_EXH = f.P_EXH - 1;
[endscript]
[DeckRemake][MiniStatus]
[endif]
[jump target="*攻守交代"]
[s]

*スキル2
[er]
なずなは縄抜けを試みた[lr]
[Calc_Status]
;AGIとDEX対抗+50(基礎点)
[eval exp="tf.Resist = Math.floor(tf.P_AGI + f.Green - tf.E_AGI) * 5 "]
[eval exp="tf.Resist = tf.Resist - Math.floor(tf.Mount/20) + 45"]
[dice99]

目標値[emb exp="tf.Resist"]以下＝＞ダイス[emb exp="tf.dice"][l]
[if exp="tf.dice < tf.Resist"]
[jump target="*拘束解除"]
[endif]
しかし、拘束は解けなかった[p]
[jump target="*攻守交代"]
[s]

*スキル3
[er]
なずなは金的を狙った[lr]
;LUK対抗
[eval exp="tf.Resist = Math.floor(tf.P_LUK + f.Green - tf.E_LUK) * 5 "]
[eval exp="tf.Resist = tf.Resist - Math.floor(tf.Mount/20) + 45"]
[dice99]

[eval exp="tf.E_anger_count = 3 , tf.E_anger_DEX = 1 , tf.E_anger_STR = 1 "]
[EnName]は怒り状態になった[lr]

目標値[emb exp="tf.Resist"]以下＝＞ダイス[emb exp="tf.dice"][l]
[if exp="tf.dice < tf.Resist"]
[jump target="*拘束解除"]
[endif]

しかし、拘束は解けない！[p]
[jump target="*攻守交代"]

;------------------------------------------------------------------------------
;PLの忍術

*忍術1
[er]
なずなは色仕掛けを試みた[lr]
[Calc_Status]
[eval exp="tf.TAG = Math.floor(tf.P_SEX + f.Blue - tf.E_MND) * 5 "]
[eval exp="tf.TAG = tf.TAG - Math.floor(tf.Mount/20)"]
[dice99]

[if exp="tf.E_anger_count > 1"]
[eval exp="tf.E_anger_count = 0 , tf.E_anger_DEX = 0 , tf.E_anger_STR = 0 "]
[EnName]の怒り状態が解除された[lr]
[Calc_Status]
[endif]

目標値[emb exp="tf.TAG"]以下＝＞ダイス[emb exp="tf.dice"][l]
[jump target="*拘束解除" cond="tf.TAG > tf.dice"]

しかし、拘束は解けない！[p]
[jump target="*攻守交代"]

*忍術2
[er]
[if exp="f.P_MGP < 10"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]
空蝉の術[r]
[eval exp="f.P_MGP = f.P_MGP - 10"]
[jump target="*拘束解除"]

*忍術3
[er]
[if exp="f.P_MGP < 5"]
気力が足りない！[p]
[jump storage="battle.ks" target="*忍術"]
[endif]
[Calc_Status]
[eval exp="f.P_MGP = f.P_MGP - 5"]
魅了の術[p]

[if exp="tf.E_anger_count > 1"]
[eval exp="tf.E_anger_count = 0 , tf.E_anger_DEX = 0 , tf.E_anger_STR = 0 "]
[EnName]の怒り状態が解除された[lr]
[Calc_Status]
[endif]

[CHARM]

[eval exp="tf.TAG = Math.floor(tf.P_SEX + f.Blue - tf.E_MND) * 5 "]
[eval exp="tf.TAG = tf.TAG - Math.floor(tf.Mount/20) + 50"]
[dice99]
目標値[emb exp="tf.TAG"]以下＞ダイス[emb exp="tf.dice"][p]
;魅了によるスタン
[if exp="tf.TAG > tf.dice"]
魅了された[EnName]は拘束を緩めた[p]
[jump target="*拘束解除"]
[endif]

しかし、拘束は解けない！[p]
[jump target="*攻守交代"]
[s]

*忍術4
[er]
房中術[p]
[jump target="*攻守交代"]

;------------------------------------------------------------------------------
;PLの行動終了

*息切れ
[cm]
なずな は息切れをした！[r]
この手番は行動ができない！[p]
[Ikigire]
[eval exp="tf.P_Stan = 1"]
[MiniStatus]

*攻守交代
[cm]
[eval exp="f.P_MGP = f.P_MGP + f.Blue"][limit]
[Reflesh_EN_buff]
[if exp="tf.P_Stan!=1"][ReActivate][endif]
[MiniStatus]

;------------------------------------------------------------------------------
;敵の手番
*敵行動選択
[jump storage="btl-Testenemy.ks" target="*敵拘束行動選択怒り" cond="tf.E_anger_count>0"]
[jump storage="btl-Testenemy.ks" target="*敵拘束行動選択欲情" cond="tf.E_charm_count>0"]
[jump storage="btl-Testenemy.ks" target="*敵拘束行動選択" ]

*敵拘束行動パターン適用
[jump storage="btl-Testenemy.ks" target="*敵拘束行動1" cond="tf.enemy_attack_pattern==1"]
[jump storage="btl-Testenemy.ks" target="*敵拘束行動2" cond="tf.enemy_attack_pattern==2"]
[jump storage="btl-Testenemy.ks" target="*敵拘束行動3" cond="tf.enemy_attack_pattern==3"]
[jump storage="btl-Testenemy.ks" target="*敵拘束行動4" cond="tf.enemy_attack_pattern==4"]
[jump storage="btl-Testenemy.ks" target="*敵拘束行動5" cond="tf.enemy_attack_pattern==5"]
[s]

*敵拘束行動終了
[jump target="*ターン終了"]
[s]

;------------------------------------------------------------------------------
;ターン終了

*ターン終了
[freeimage layer=3]
[eval exp="tf.P_AVD=0"]
[eval exp="f.P_EXH++"]
;Deckに要素を追加。カードの長さ＝追加するカードのナンバーになる。配列のナンバーは０から
;疲労カードの追加スタン時は除外
[if exp="tf.P_Stan < 1"]
[iscript]
f.Deck.push(f.Cards.length);
f.Cards.push({color:"black",value:1,active:1,txt:"疲労",tag:"*疲労"});
[endscript]
[endif]
;バッドステータスのターン短縮
[eval exp="tf.P_Stan = 0"]
[jump target="*ターン開始"]

*拘束解除
[er]
なずな は拘束から抜け出した[p]
[eval exp="tf.Mount = 0"]
[jump storage="battle.ks" target="*ターン開始"]
