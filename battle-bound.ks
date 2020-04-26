*拘束開始
[Calc_Status]
[eval exp="tf.Esc=0"][limit]
[eval exp="tf.Mount = 1000"]

*ターン開始
[Initialize_1Tbuff]
[Refresh_3Tbuff]
;ターン開始
[eval exp="tf.Turn=tf.Turn+1"]
;状態異常のカウント・治癒

;絶頂
[eval exp="tf.Orga = tf.Orga - 1"]
[if exp="tf.Orga > 0"]
くぬぎは絶頂の余韻から抜け出せないでいる![p]
[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1"]
[eval exp="tf.Arousal = 1"]
[endif]

;興奮
[if exp="tf.Arousal == 1"]
くぬぎの興奮が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =0 , tf.ArousPOWb =0 , tf.ArousSEXd =1"]
[endif]

;スタン
[if exp="tf.E_stan>0"][eval exp="tf.E_stan=0"][enemyname]が自由に動けるようになった[p][endif]
[MiniStatus]

[if exp="tf.Orga==4 && tf.dice>49"]
くぬぎは絶頂の衝撃で動けない(行動不能)[p]
[eval exp="tf.OrgaStan = 1"]
[eval exp="tf.Orga = tf.Orga-1"]
[jump target="*攻守交代"]

[elsif exp="tf.Orga>0"]
くぬぎは絶頂の余韻から抜け出せない[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.Orga = tf.Orga-1 "]
[MiniStatus]

[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1 , tf.Arousal = 1"]
[endif]

[if exp="tf.Arousal == 1"]
くぬぎの興奮が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =0 , tf.ArousPOWb =0 , tf.ArousMNDd =0 ,tf.ArousSEXd =1"]
[endif]

[MiniStatus]

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
[if exp="f.black>=3"][wt7][jump target="*息切れ"][endif]
[glink text="拘束中" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札一覧"]
[s]

*攻撃
[er]
[if exp="f.Red<1"][jump target="*手札一覧"][endif]
[if exp="f.Red>0"][link target="*攻撃１"]攻撃１もがく[endlink][endif][r]
[if exp="f.Red>1"][link target="*攻撃２"]攻撃２抵抗する[endlink][endif][r]
[if exp="f.Red>2"][link target="*攻撃３"]攻撃３暴れる[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink]
[s]

*技能
[er]
[if exp="f.Green<1"][jump target="*手札一覧"][endif]
[if exp="f.Green>1"][link target="*スキル１"]スキル１縄抜け[endlink][endif]　
[if exp="f.Green>1"][link target="*スキル２"]スキル２色仕掛け[endlink][endif][r]
[if exp="f.Green>0"][link target="*スキル３"]スキル３急所狙い[endlink][endif]　
[link target="*手札一覧"]戻る[endlink][r]
[s]

*忍術
[er]
[if exp="f.Blue<1"][jump target="*手札一覧"][endif]
[if exp="f.Blue>0"][link target="*忍術１"]忍術１空蝉（気力10）[endlink][endif]　
[if exp="f.Blue>0"][link target="*忍術２"]忍術２魅了（気力5）[endlink][endif][r]
[if exp="f.Blue>0"][link target="*忍術３"]忍術３房中術（気力3）[endlink][endif]　
[link target="*手札一覧"]戻る[endlink][r]
[s]

*疲労
[er]
疲労カードにコマンド、ボーナスはありません。[r]手札に疲労カードが３枚集まると息切れ(スタン)します。[r]
息切れ発生時、疲労カードが３枚消えます[l][er]
[jump storage="battle.ks" target="*手札一覧"]
[s]

*攻撃１
[er]
なずなはもがいた
[quake count=2 time=200 hmax=10]
[lr]
[Calc_Status]
[eval exp="tf.Resist = Math.floor(tf.P_STR * tf.ArousSTRd * 4) - (tf.E_BND*3)"]
[eval exp="tf.Resist = 1" cond="tf.Resist<1"]
拘束が[emb exp="tf.Resist"]緩んだ[p]
[eval exp="tf.Mount = tf.Mount - tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[jump target="*攻守交代"]

*攻撃2
[er]
なずなは抵抗した
[quake count=5 time=300 hmax=20]
[lr]
[Calc_Status]
[eval exp="tf.Resist = Math.floor(tf.P_STR * tf.ArousSTRd * 5) - (tf.E_BND*3)"]
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
[e[eval exp="tf.Resist = Math.floor(tf.P_STR * tf.ArousSTRd * 6) - (tf.E_BND*3)"]
[eval exp="tf.Resist = 1" cond="tf.Resist<1"]
拘束が[emb exp="tf.Resist"]緩んだ[p]
[eval exp="tf.Mount = tf.Mount - tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[jump target="*攻守交代"]

*スキル１
[er]
なずなは縄抜けを試みた[lr]
[Calc_Status]
[eval exp="tf.Resist = Math.floor((tf.P_AGI *  tf.ArousAGId - tf.E_DEX) * 5) "]
[eval exp="tf.Resist = 50" cond="tf.Resist > 50"]
[eval exp="tf.Resist = tf.Resist + Math.floor((1000 - tf.Mount)/5) "]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice < tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[endif]
しかし、拘束は解けなかった[p]
[jump target="*攻守交代"]

*スキル２
[er]
なずなは色仕掛けを試みた[lr]
[Calc_Status]
[eval exp="tf.Resist = Math.floor((tf.P_APP - tf.E_APP) * 5) "]
[eval exp="tf.Resist = 50" cond="tf.Resist > 50"]
[eval exp="tf.Resist = tf.Resist + Math.floor((1000 - tf.Mount)/5) "]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

;[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_MND) * 4.5 * (100 - tf.E_SAN)/100 * (tf.E_ERO + 100)/100) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
;[enemyname]の欲情が[emb exp="tf.HDamage"]上昇した[p]
[if exp="tf.E_anger_count > 1"]
[eval exp="tf.E_anger_count = 0"]
[EnName]の怒り状態が解除された[lr]
[endif]

[if exp="tf.dice < tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[endif]

しかし、拘束は解けない！[p]
[jump target="*攻守交代"]

*スキル３
[er]
なずなは金的を狙った[lr]
[eval exp="tf.Resist = Math.floor((tf.P_DEX *  tf.ArousDEXd - tf.E_AGI) * 5) "]
[eval exp="tf.Resist = 50" cond="tf.Resist > 50"]
[eval exp="tf.Resist = tf.Resist + Math.floor((1000 - tf.Mount)/5) "]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

[eval exp="tf.E_anger_count = 3"]
[EnName]は怒り状態になった[lr]

[if exp="tf.dice < tf.Resist"]
[jump target="*拘束解除" cond="tf.Mount <= 0"]
[endif]

しかし、拘束は解けない！[p]
[jump target="*攻守交代"]


*攻守交代
[cm]
[eval exp="f.P_MGP = f.P_MGP + f.Blue"]
[MiniStatus]

*敵行動選択
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice<20"][eval exp="tf.enemy_attack_pattern=1"]
[elsif exp="tf.dice<40"][eval exp="tf.enemy_attack_pattern=2"]
[elsif exp="tf.dice<60"][eval exp="tf.enemy_attack_pattern=3"]
[elsif exp="tf.dice<80"][eval exp="tf.enemy_attack_pattern=4"]
[else][eval exp="tf.enemy_attack_pattern=5"]
[endif]

*敵行動１
;脱衣
[enemyname]はくぬぎの装束を剥ぎ取ろうとした[p]

[if exp="tf.OrgaStan > 0 && tf.P_DRESS > 1"]
絶頂で身動きの取れないくぬぎは一気に全裸に剥かれてしまった[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 0 , tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.OrgaStan > 0 && tf.P_DRESS > 0"]
絶頂で身動きの取れないくぬぎは為す術なく全裸にされた[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 0 , tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.P_DRESS > 1"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
くぬぎは下着姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]

[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
くぬぎは一糸まとわぬ姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[jump target="*敵行動終了"]
[s]

*敵行動２
[enemyname]はくぬぎの胸を揉みしだいた[p]
[if exp="f.P_BOOB==2"]
#くぬぎ
いやあっ！！[p]
揉みしだかれたくぬぎの乳房から母乳が迸った[p]
[endif]
[eval exp="tf.RATE=2 + (f.P_BOOB*2) , tf.P_SEN = f.P_SEN_BB"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][MiniStatus]
[jump target="*敵行動終了"]
[s]

*敵行動３
[enemyname]はくぬぎの秘処をまさぐった[p]
[eval exp="tf.RATE=3 , tf.P_SEN = f.P_SEN_VG"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][MiniStatus]
[jump target="*敵行動終了"]
[s]

*敵行動４
[enemyname]の攻撃[p]
[quake count=3 time=300 hmax=30]
[Calc_Status]
[eval exp="tf.Damage=Math.floor(tf.E_STR * tf.E_charm_STR) * 3"]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[MAZO][Orgasm][SANcheck][MiniStatus]
[jump target="*敵行動終了"]
[s]

*敵行動５
[enemyname]はくぬぎを締め上げた[p]
[quake count=5 time=300 hmax=20]
[Calc_Status]
[eval exp="tf.Damage=Math.floor(tf.E_STR * tf.E_charm_STR) * 3"]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[MAZO][Orgasm][SANcheck][MiniStatus]
[jump target="*敵行動終了"]
[s]

*敵行動終了


*ターン終了
[eval exp="tf.P_AVD=0"]
[eval exp="f.P_EXH++"]
;バッドステータスのターン短縮
[eval exp="f.P_Stan = 0"]
;Deckに要素を追加。カードの長さ＝追加するカードのナンバーになる。配列のナンバーは０から
;疲労カードの追加
[iscript]
f.Deck.push(f.Cards.length);
f.Cards.push({color:"black",value:1,active:1,txt:"疲労",tag:"*疲労"});
[endscript]
[jump target="*ターン開始"]

*拘束解除
くぬぎは拘束を振りほどいた[p]
[jump storage="battle.ks" target="*ターン開始"]
