*start
[cm]
[clearfix]
[start_keyconfig]
@call storage="macros.ks" target="*マクロ"

[bg storage="mori_yoru.jpg" time="100"]

;プレイヤーのステータス欄
[layopt layer="2" visible=true]
[macro name="MiniStatus"]
[ptext text="くぬぎ" layer="2" edge="0x000000" size=25 x=20 y=480 ]
[ptext text="体力" layer="2" edge="0x000000" size=20 x=20 y=510 edge=][ptext name="HP" text="&tf.P_HP" layer="2" edge="0x000000" size=20 x=80 y=515 ]
[ptext text="気力" layer="2" edge="0x000000" size=20 x=20 y=540 ][ptext name="AUR" text="&f.P_AUR" layer="2" edge="0x000000" size=20 x=40 y=545 ]
[endmacro]

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

[macro name="triage"]
[jump target="*game_lose" cond="tf.P_HP <= 0"]
[jump target="*game_lose" cond="f.P_EXH >= 100"]
[jump target="*game_win" cond="tf.E_HP <= 0"]
[endmacro]

[macro name="show_status"]
[nowait]
[if exp="tf.Mount>0"][else]ターン[emb exp="tf.Turn"][r][endif]
体力[emb exp="tf.P_HP"]　気力[emb exp="f.P_AUR"]　呼吸[emb exp="tf.P_ACT"]　欲情[emb exp="tf.P_ERO"]　疲労度[emb exp="f.P_EXH"][r]
敵体力[emb exp="tf.E_HP"] 敵気力[emb exp="f.E_AUR"] 欲情[emb exp="tf.E_ERO"][p]
[endnowait][cm]
[endmacro]

;ステータスのインストール
*Initialize
[eval exp="tf.Turn=0"]
[eval exp="tf.Set=0 , f.Selected=[] , f.Cemetery=[] , f.SkillSet=[]"]
[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_DEX=f.P_DEX , tf.P_POW=f.P_POW, tf.P_APP=f.P_APP , tf.P_ACTmax=f.P_ACT , f.P_AUR = f.P_AUR"]
[eval exp="tf.P_ERO=f.P_ERO , tf.P_SAN=f.P_SAN , tf.P_DRESS=f.P_DRESS , tf.P_ARMOR=f.P_ARMOR , tf.P_Barrier=0"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_DEX=f.E_DEX , tf.E_POW=f.E_POW , tf.E_APP=f.E_APP , tf.E_ACT=f.E_ACT , f.E_AUR=0"]
[eval exp="tf.E_ERO=f.E_ERO , tf.E_SAN=f.E_SAN , tf.E_SEX=f.E_SEX , tf.E_BND=f.E_BND"]

[Initialize_1Tbuff]
[Initialize_3Tbuff]
*Initialize_BadStatus
;状態異常の初期値設定
[eval exp="tf.Orga = 0 , tf.OrgaStan = 0 , tf.OrgaCount=0 , tf.OrgaPOWb = 1 ,f.P_INRAN = 0 , tf.Kaikan = 0 , f.Insanity=0"]
[eval exp="tf.Arousal=0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb = 0 , tf.ArousPOWb = 0 , tf.ArousSEXd =1"]
[eval exp="tf.E_scald = 0 , tf.E_stan=0"]

*Initialize_Cards
[iscript]
f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11];
f.OriginalCards=[
{id:0,color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{id:1,color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{id:2,color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{id:3,color:"red",value:1,active:1,txt:"攻撃",tag:"*攻撃"},
{id:4,color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{id:5,color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{id:6,color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{id:7,color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
{id:8,color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
{id:9,color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
{id:10,color:"blue",value:1,active:1,txt:"忍術",tag:"*忍術"},
{id:11,color:"green",value:1,active:1,txt:"技能",tag:"*技能"},
];
[endscript]
;カードのディープコピー作成
;連想配列では値がコピー元と共有されてしまうので、値を変更できるように完全なクローンを作成
;OriginalCards大本のカード。Cards値を一時的に操作するカード。Deckはカードのidを並べたもの。
[iscript]
f.Cards = Object.create(f.OriginalCards);
[endscript]

[MiniStatus]

*手番開始
[glink text="手番開始" size="18" width="15" height="100" x="350" y="500" color="gray" target="*シャッフルスタート" ]
[s]

*シャッフルスタート
[eval exp="tf.set=0 , tf.P_ACTmax=5 , f.Selected=[] ,f.Cemetery=[]"]
;Deckはシャッフルした山札（ただしカード自体ではなくカードのidの列。引き換え番号みたいなもの）
;cemeteryは墓地＝使用済みカードidのプール。
[iscript]
for(i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]

*手札構築
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[ShowCardList]
;各色の数値を計算
[iscript]
f.Red=0,f.Green=0,f.Blue=0;
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "red"){f.Red += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "green"){f.Green += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "blue"){f.Blue += f.Cards[f.Hand[i]]['value'];}
}
[endscript]

*手札一覧
[er]
[ShowCardList]
[iscript]
f.Redtxt = "攻撃" + f.Red;
f.Greentxt = "技能" + f.Green;
f.Bluetxt = "忍術" + f.Blue;
[endscript]

;[glink text="&f.Redtxt" size="15" width="60" x="320" y="480" color="gray" target="*攻撃" ]
;[glink text="&f.Greentxt" size="15" width="60" x="320" y="520" color="gray" target="*技能" ]
;[glink text="&f.Bluetxt" size="15" width="60" x="320" y="560" color="gray" target="*忍術" ]
[glink text="手番終了" size="18" width="15" height="100" x="350" y="500" color="gray" target="*守備" ]
[s]

*攻撃
[er]
[if exp="f.Red<1"]コスト不足[jump target="*手札一覧"][endif]
[if exp="f.Red>0"][link target="*攻撃１"]攻撃１[endlink][endif] [if exp="f.Red>1"][link target="*攻撃２"]攻撃２[endlink][endif][r]
[if exp="f.Red>2"][link target="*攻撃３"]攻撃３[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink]
[s]

*技能
[er]
[if exp="f.Green<1"]コスト不足[jump target="*手札一覧"][endif]
[if exp="f.Green>0"][link target="*スキル１"]スキル１命中[endlink][endif]　[if exp="f.Green>0"][link target="*スキル２"]スキル２会心[endlink][endif][r]
[if exp="f.Green>0"][link target="*スキル３"]スキル３攻撃[endlink][endif]　[if exp="f.Green>0"][link target="*スキル４"]スキル４防御[endlink][endif][r]
[if exp="f.Green>1"][link target="*スキル５"]スキル５回避[endlink][endif]　[if exp="f.Green>1"][link target="*スキル６"]スキル６必中[endlink][endif]　[link target="*手札一覧"]戻る[endlink][r]
[s]

*忍術
[er]
青をコストに忍術を使います。
[s]

*手番終了
[er]
攻撃を終了します。
[s]

*攻撃１
[er]
敵に小ダメージ[r]
[eval exp="f.Red = f.Red - 1"]
[eval exp="tf.RATE = 6.0 , tf.ACC = 30 , tf.CRTrate = 1.2"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;[jump target="*P_attack_miss" cond="tf.HitRate < tf.dice"]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[triage]
[l][er]
[jump target="*手札一覧"]

*攻撃２
[er]
敵に中ダメージ[r]
[eval exp="f.Red = f.Red - 2"]
[eval exp="tf.RATE = 10.0 , tf.ACC = 20 , tf.CRTrate = 1.3"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;[jump target="*P_attack_miss" cond="tf.HitRate < tf.dice"]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[triage]
[l][er]
[jump target="*手札一覧"]

*攻撃３
[er]
敵に大ダメージ[r]
[eval exp="f.Red = f.Red - 3"]
[eval exp="tf.RATE = 14.0 , tf.ACC = 10 , tf.CRTrate = 1.5"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;[jump target="*P_attack_miss" cond="tf.HitRate < tf.dice"]
[Calc_Damage]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[triage]
[l][er]
[jump target="*手札一覧"]

*スキル１
[er]
命中率が上昇
[eval exp="f.Green = f.Green - 1"]
[eval exp="tf.P_DEXb1=0.3"]
[l][er]
[jump target="*手札一覧"]

*スキル２
[er]
会心の一撃発生率上昇
[eval exp="f.Green = f.Green - 1"]
[eval exp="tf.P_LUKb1=0.3"]
[l][er]
[jump target="*手札一覧"]

*スキル３
[er]
攻撃力が上昇
[eval exp="f.Green = f.Green - 1"]
[eval exp="tf.P_STRb1=0.3"]
[l][er]
[jump target="*手札一覧"]

*スキル４
[er]
防御力が上昇
[eval exp="f.Green = f.Green - 1"]
[eval exp="tf.P_DURb1=0.3"]
[l][er]
[jump target="*手札一覧"]

*スキル５
[er]
回避が大幅に上昇
[eval exp="f.Green = f.Green - 2"]
[eval exp="tf.P_AGIb1=0.5"]
[l][er]
[jump target="*手札一覧"]

*スキル６
[er]
命中が大幅に上昇
[eval exp="f.Green = f.Green - 2"]
[eval exp="tf.P_DEXb1=0.5"]
[l][er]
[jump target="*手札一覧"]

*game_win
勝利[s]


*game_lose
敗北[s]
