*start
[cm]
[clearfix]
[start_keyconfig]
@call storage="macros.ks" target="*マクロ"

[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=340 top=480 width=610 height=150 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="10" marginl="10" marginr="10" marginb="0"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;このゲームで登場するキャラクターを宣言
[chara_new  name="gouza"  storage="chara/gouza/pr_gouza.png" jname="豪座" ]

[chara_show  name="gouza" layer=1 width=300 left=1000 top=50 wait="true"]
[anim name="gouza" opacity=0 time=1]
[anim name="gouza" left=750 top=50 time=1]
[anim name="gouza" opacity=255 left=600 top=50 time=300 anim="true" effect="jswing" ]

戦闘を開始します[p]

;ステータスのインストール
*Initialize
[eval exp="tf.Turn=0 , tf.P_ACT = 0"]
[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_DEX=f.P_DEX , tf.P_POW=f.P_POW, tf.P_MND=f.P_MND, tf.P_APP=f.P_APP"]
[eval exp="tf.P_AVD=f.P_AVD , tf.P_ERO=f.P_ERO , tf.P_SAN=f.P_SAN , tf.P_DRESS=f.P_DRESS , tf.P_ARMOR=f.P_ARMOR , tf.P_Barrier=0"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_DEX=f.E_DEX , tf.E_POW=f.E_POW , tf.E_MND=f.E_MND , tf.E_APP=f.E_APP , tf.E_ACT=f.E_ACT , tf.E_MGP=f.E_MGP"]
[eval exp="tf.E_AVD=f.E_AVD ,tf.E_ERO=f.E_ERO , tf.E_SAN=f.E_SAN , tf.E_SEX=f.E_SEX , tf.E_BND=f.E_BND"]

[Initialize_PL_1Tbuff][Initialize_EN_1Tbuff][Initialize_3Tbuff]
*Initialize_BadStatus
;状態異常の初期値設定
[eval exp="tf.P_Stan = 0 , tf.Orga = 0 , tf.OrgaStan = 0 , tf.OrgaCount=0 , tf.OrgaPOWb = 0 ,f.P_INRAN = 0 , tf.Kaikan = 0 , f.Insanity=0"]
[eval exp="tf.Arousal=0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb = 0 , tf.ArousPOWb = 1 , tf.ArousMNDb = 1 , tf.ArousSEXd =1"]
[eval exp="tf.E_scald = 0 , tf.E_stan=0"]

*Initialize_Cards
;カードの情報を収めた連想(ハッシュ・辞書)配列(=オブジェクト)を収めた配列(多次元配列)を作成。
;Deck=カードのidを並べたもの。
[iscript]
f.Cards=[
{color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
];
f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11];
[endscript]

*ターン開始
[Initialize_PL_1Tbuff]
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

*敵攻撃パターン選択
[jump storage="battle-Testenemy.ks" target="*敵攻撃パターン選択"]

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
[glink text="手番継続" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札一覧" cond="f.Red>0"]
[glink text="手番終了" size="18" width="15" height="100" x="350" y="500" color="gray" target="*攻守交代" cond="f.Red<=0"]
[s]

*攻撃
[er]
[if exp="f.Red<1"][jump storage="battle.ks" target="*手札一覧"][endif]
[if exp="f.Red>0"][link target="*攻撃１"]攻撃１[endlink][endif] [if exp="f.Red>1"][link target="*攻撃２"]攻撃２[endlink][endif][r]
[if exp="f.Red>2"][link target="*攻撃３"]攻撃３[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink]
[s]

*技能
[er]
[if exp="f.Green<1"][jump storage="battle.ks" target="*手札一覧"][endif]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル１"]スキル１命中　[endlink][endif]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル２"]スキル２会心　[endlink][endif][r]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル３"]スキル３防御　[endlink][endif]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル４"]スキル４忍耐　[endlink][endif][r]
[if exp="f.Green>1"][link storage="battle-PL-Skill.ks" target="*スキル５"]スキル５修繕　[endlink][endif]
[if exp="f.Green>1"][link storage="battle-PL-Skill.ks" target="*スキル６"]スキル６反撃　[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink][r]
[s]

*忍術
[er]
[if exp="f.Blue<1"][jump storage="battle.ks" target="*手札一覧"][endif]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術１"]忍術１火遁（気力10）[endlink][endif]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術２"]忍術２変わり身（気力5）[endlink][endif][r]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術３"]忍術３魅了（気力5）[endlink][endif]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術４"]忍術４衣替え（気力3）[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink][r]
[s]

*疲労
[er]
疲労カードにコマンド、ボーナスはありません。[r]手札に疲労カードが３枚集まると息切れ(スタン)します。[r]
息切れ発生時、疲労カードが３枚消えます[l][er]
[jump target="*手札一覧"]
[s]

*手番終了
[er]
攻撃を終了します。
[emb exp="tf.E_HP"]
[s]

*攻撃１
[er]
敵に小ダメージ[r]
[Calc_Status]
[eval exp="tf.Cost = 1 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 6.0 , tf.ACC = 30 , tf.CRTrate = 0.5"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
[eval exp="tf.AvoidRate = tf.E_AGI + tf.E_AVD * 10 - tf.HIT "][limit]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[Calc_Damage]
[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの攻撃を回避した[p]

[elsif exp="tf.CRT>1"]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
[enemyname]に[emb exp="tf.Damage"] [r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[quake count=5 time=300 hmax=20]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]

*攻撃２
[er]
敵に中ダメージ[r]
[Calc_Status]
[eval exp="tf.Cost = 2 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 10.0 , tf.ACC = 20 , tf.CRTrate = 1.0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
[eval exp="tf.AvoidRate = tf.E_AGI + tf.E_AVD * 10 - tf.HIT "][limit]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの攻撃を回避した[p]

[elsif exp="tf.CRT>1"]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]


[MiniStatus][Triage]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]

*攻撃３
[er]
敵に大ダメージ[r]
[Calc_Status]
[eval exp="tf.Cost = 3 , tf.Type='red' , f.Red = f.Red - tf.Cost "]
[eval exp="tf.RATE = 14.0 , tf.ACC = 10 , tf.CRTrate = 1.5"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
[eval exp="tf.AvoidRate = tf.E_AGI + tf.E_AVD * 10 - tf.HIT "][limit]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

[if exp="tf.AvoidRate > tf.dice"]
敵はなずなの攻撃を回避した[p]

[elsif exp="tf.CRT>1"]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
会心の一撃[r]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]

[else]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endif]

[MiniStatus][Triage]
[l][er]
[DeActivate]
[jump storage="battle.ks" target="*手札一覧"]
[s]


*息切れ
[cm]
なずな は息切れをした！[r]
この手番は行動ができない！[p]
[Ikigire]
[eval exp="f.P_EXH = f.P_EXH - 3"]
[eval exp="tf.P_Stan = 1"]
[MiniStatus]
;くみつき判定

*攻守交代
[cm]
[eval exp="f.P_MGP = f.P_MGP + f.Blue"]
[eval exp="tf.P_AVD= (f.Red + f.Blue + f.Green)"]
[eval exp="tf.P_ACT = 0"]
[Initialize_EN_1Tbuff]
[ReActivate]
[MiniStatus]
[jump storage="battle-Testenemy.ks" target="*敵攻撃パターン適用"]
[s]

*ターン終了
[freeimage layer="3"]
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
