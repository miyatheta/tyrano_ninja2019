*マクロ
;文法関係
[macro name="lr"]
[l][r]
[endmacro]

[macro name="lrcm"]
[l][r][cm]
[endmacro]

[macro name="wt7"]
[wait time=800][cm]
[endmacro]

[macro name="wt5"]
[wait time=600][cm]
[endmacro]

[macro name="EnName"]
[emb exp="tf.E_HandlName"]
[endmacro]

;レイヤー関係
[macro name="ShowMsg"]
[position layer=message0 visible=true]
[endmacro]

[macro name="HideMsg"]
[position layer=message0 visible=false]
[endmacro]

;数値関係
[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

;ステータス関係
[macro name="hideStatus"]
[freeimage layer=1]
[freeimage layer=2]
[freeimage layer=3]
[freeimage layer=4]
[freeimage layer=5]
[freeimage layer=8]
[freeimage layer=9]
[endmacro]

;戦闘関連
[macro name="Masochism"]
[iscript]
tf.Damage = Math.floor(3 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Estrus"]
[iscript]
tf.Damage = Math.floor(3 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Parasite"]
[iscript]
tf.Damage = Math.floor(5 * f.SEN / 100);
[endscript]
[endmacro]

;新規追加部分
[macro name="enemyname"]
[emb exp="tf.E_name"]
[endmacro]

[macro name="enemy_attack_mt"]
[emb exp="tf.E_attack_mt"]
[endmacro]

[macro name="enemy_attack_1"]
[emb exp="tf.E_attack_1"]
[endmacro]

[macro name="enemy_attack_2"]
[emb exp="tf.E_attack_2"]
[endmacro]

[macro name="enemy_attack_ex"]
[emb exp="tf.E_attack_ex"]
[endmacro]

[macro name="limit"]
[eval exp="tf.P_HP = 0" cond="tf.P_HP < 0"]
[eval exp="tf.E_HP = 0" cond="tf.E_HP < 0"]
[eval exp="f.P_EXH = 100" cond="f.P_EXH > 100"]
[eval exp="f.P_MGP = 100" cond="f.P_MGP > 100"]
[eval exp="f.E_MGP = 100" cond="f.E_MGP > 100"]
[eval exp="f.P_MGP = 0" cond="f.P_MGP < 0"]
[eval exp="tf.P_LUK = 100" cond="tf.P_LUK > 100"]
[eval exp="tf.P_LUK = 0" cond="tf.P_LUK < 0"]
[eval exp="tf.E_LUK = 100" cond="tf.E_LUK > 100"]
[eval exp="tf.E_LUK = 0" cond="tf.E_LUK < 0"]
[eval exp="tf.P_ERO = 9999" cond="tf.P_ERO > 9999"]
[eval exp="tf.P_ERO = 0" cond="tf.P_ERO < 0"]
[eval exp="tf.E_ERO = 9999" cond="tf.E_ERO > 9999"]
[eval exp="tf.E_ERO = 0" cond="tf.E_ERO < 0"]
[eval exp="tf.HIT= 0" cond="tf.HIT < 0"]
[eval exp="tf.HIT = 100" cond="tf.HIT > 100"]
[eval exp="tf.AvoidRate = 0" cond="tf.AvoidRate < 0"]
[eval exp="tf.AvoidRate = 100" cond="tf.AvoidRate > 100"]
[eval exp="tf.E_ACT = f.E_ACT" cond="tf.E_ACT > f.E_ACT"]
[eval exp="tf.P_ACT = tf.P_ACTmax" cond="tf.P_ACT > tf.P_ACTmax"]
[eval exp="tf.P_ARMOR = 0" cond="tf.P_ARMOR < 0"]
[endmacro]

[macro name="Calc_Status"]
;evalだと括弧を計算順序が考慮しない
[iscript]
tf.P_STR = f.P_STR  - tf.P_STRd3 - tf.P_STRd1 + tf.P_STRb3 + tf.P_STRb1 - tf.ArousSTRd;
tf.P_DUR = f.P_DUR  - tf.P_DURd3 - tf.P_DURd1 + tf.P_DURb3 + tf.P_DURb1 ;
tf.P_AGI = f.P_AGI  - tf.P_AGId3 - tf.P_AGId1 + tf.P_AGIb3 + tf.P_AGIb1 - tf.ArousAGId;
tf.P_DEX = f.P_DEX  - tf.P_DEXd3 - tf.P_DEXd1 + tf.P_DEXb3 + tf.P_DEXb1 - tf.ArousDEXd;
tf.P_LUK = f.P_LUK  - tf.P_LUKd3 - tf.P_LUKd1 + tf.P_LUKb3 + tf.P_LUKb1 ;
tf.P_MND = f.P_MND  - tf.P_MNDd3 - tf.P_MNDd1 + tf.P_MNDb3 + tf.P_MNDb1 ;
tf.P_APP = f.P_APP  - tf.P_APPd3 - tf.P_APPd1 + tf.P_APPb3 + tf.P_APPb1 + (2 - tf.P_DRESS) ;

tf.E_STR = f.E_STR - tf.E_STRd3 - tf.E_STRd1 + tf.E_STRb3 + tf.E_STRb1 - tf.E_charm_STR;
tf.E_DUR = f.E_DUR - tf.E_DURd3 - tf.E_DURd1 + tf.E_DURb3 + tf.E_DURb1 - tf.E_charm_DUR;
tf.E_AGI = f.E_AGI - tf.E_AGId3 - tf.E_AGId1 + tf.E_AGIb3 + tf.E_AGIb1 ;
tf.E_DEX = f.E_DEX - tf.E_DEXd3 - tf.E_DEXd1 + tf.E_DEXb3 + tf.E_DEXb1 ;
tf.E_LUK = f.E_LUK - tf.E_LUKd3 - tf.E_LUKd1 + tf.E_LUKb3 + tf.E_LUKb1 ;
tf.E_MND = f.E_MND - tf.E_MNDd3 - tf.E_MNDd1 + tf.E_MNDb3 + tf.E_MNDb1 ;
tf.E_APP = f.E_APP - tf.E_APPd3 - tf.E_APPd1 + tf.E_APPb3 + tf.E_APPb1 ;
[endscript]
[endmacro]

[macro name="Initialize"]
[eval exp="tf.Turn=0 , tf.P_ACT = 0"]
[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_DEX=f.P_DEX , tf.P_LUK=f.P_LUK , tf.P_MND=f.P_MND, tf.P_APP=f.P_APP"]
[eval exp="tf.P_AVD=f.P_AVD , tf.P_ERO=f.P_ERO , tf.P_SAN=f.P_SAN , tf.P_SEX=f.P_SEX  , tf.P_DRESS=f.P_DRESS , tf.P_ARMOR=f.P_ARMOR , tf.P_Barrier=0"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_DEX=f.E_DEX , tf.E_LUK=f.E_LUK , tf.E_MND=f.E_MND , tf.E_APP=f.E_APP"]
[eval exp="tf.E_AVD=f.E_AVD ,tf.E_ERO=f.E_ERO , tf.E_SAN=f.E_SAN , tf.E_SEX=f.E_SEX , tf.E_BND=f.E_BND , tf.E_MGP=f.E_MGP"]

[eval exp="tf.P_STRb1=0 , tf.P_DURb1=0 , tf.P_AGIb1=0 , tf.P_DEXb1=0 , tf.P_MNDb1=0 , tf.P_APPb1=0 , tf.P_LUKb1=0"]
[eval exp="tf.E_STRd1=0 , tf.E_DURd1=0 , tf.E_AGId1=0 , tf.E_DEXd1=0 , tf.E_MNDd1=0 , tf.E_APPd1=0 , tf.E_LUKd1=0"]
[eval exp="tf.P_STRd1=0 , tf.P_DURd1=0 , tf.P_AGId1=0 , tf.P_DEXd1=0 , tf.P_MNDd1=0 , tf.P_APPd1=0 , tf.P_LUKd1=0"]
[eval exp="tf.E_STRb1=0 , tf.E_DURb1=0 , tf.E_AGIb1=0 , tf.E_DEXb1=0 , tf.E_MNDb1=0 , tf.E_APPb1=0 , tf.E_LUKb1=0"]
[eval exp="tf.P_STRb3=0 , tf.P_DURb3=0 , tf.P_AGIb3=0 , tf.P_DEXb3=0 , tf.P_MNDb3=0 , tf.P_APPb3=0 , tf.P_LUKb3=0"]
[eval exp="tf.E_STRd3=0 , tf.E_DURd3=0 , tf.E_AGId3=0 , tf.E_DEXd3=0 , tf.E_MNDd3=0 , tf.E_APPd3=0 , tf.E_LUKd3=0"]
[eval exp="tf.P_STRd3=0 , tf.P_DURd3=0 , tf.P_AGId3=0 , tf.P_DEXd3=0 , tf.P_MNDd3=0 , tf.P_APPd3=0 , tf.P_LUKd3=0"]
[eval exp="tf.E_STRb3=0 , tf.E_DURb3=0 , tf.E_AGIb3=0 , tf.E_DEXb3=0 , tf.E_MNDb3=0 , tf.E_APPb3=0 , tf.E_LUKb3=0"]
[endmacro]

[macro name="Reflesh_PL_buff"]
;PLのスキルによる効果(1ターン)
[eval exp="tf.P_STRb1=0 , tf.P_DURb1=0 , tf.P_AGIb1=0 , tf.P_DEXb1=0 , tf.P_MNDb1=0 , tf.P_APPb1=0 , tf.P_LUKb1=0"]
[eval exp="tf.E_STRd1=0 , tf.E_DURd1=0 , tf.E_AGId1=0 , tf.E_DEXd1=0 , tf.E_MNDd1=0 , tf.E_APPd1=0 , tf.E_LUKd1=0"]
;PLのスキルによる効果(3ターン)
[eval exp="tf.P_STRb3_count = tf.P_STRb3_count-1" cond="tf.P_STRb3_count>1"][eval exp="tf.P_STRb3=0 ,tf.P_STRb3_count=0" cond="tf.P_STRb3_count==1"]
[eval exp="tf.P_DURb3_count = tf.P_DURb3_count-1" cond="tf.P_DURb3_count>1"][eval exp="tf.P_DURb3=0 ,tf.P_DURb3_count=0" cond="tf.P_DURb3_count==1"]
[eval exp="tf.P_AGIb3_count = tf.P_AGIb3_count-1" cond="tf.P_AGIb3_count>1"][eval exp="tf.P_AGIb3=0 ,tf.P_AGIb3_count=0" cond="tf.P_AGIb3_count==1"]
[eval exp="tf.P_DEXb3_count = tf.P_DEXb3_count-1" cond="tf.P_DEXb3_count>1"][eval exp="tf.P_DEXb3=0 ,tf.P_DEXb3_count=0" cond="tf.P_DEXb3_count==1"]
[eval exp="tf.P_MNDb3_count = tf.P_MNDb3_count-1" cond="tf.P_MNDb3_count>1"][eval exp="tf.P_MNDb3=0 ,tf.P_MNDb3_count=0" cond="tf.P_MNDb3_count==1"]
[eval exp="tf.P_APPb3_count = tf.P_APPb3_count-1" cond="tf.P_APPb3_count>1"][eval exp="tf.P_APPb3=0 ,tf.P_APPb3_count=0" cond="tf.P_APPb3_count==1"]

[eval exp="tf.E_STRd3_count = tf.E_STRd3_count-1" cond="tf.E_STRd3_count>1"][eval exp="tf.E_STRd3=0 ,tf.E_STRd3_count=0" cond="tf.E_STRd3_count==1"]
[eval exp="tf.E_DURd3_count = tf.E_DURd3_count-1" cond="tf.E_DURd3_count>1"][eval exp="tf.E_DURd3=0 ,tf.E_DURd3_count=0" cond="tf.E_DURd3_count==1"]
[eval exp="tf.E_AGId3_count = tf.E_AGId3_count-1" cond="tf.E_AGId3_count>1"][eval exp="tf.E_AGId3=0 ,tf.E_AGId3_count=0" cond="tf.E_AGId3_count==1"]
[eval exp="tf.E_DEXd3_count = tf.E_DEXd3_count-1" cond="tf.E_DEXd3_count>1"][eval exp="tf.E_DEXd3=0 ,tf.E_DEXd3_count=0" cond="tf.E_DEXd3_count==1"]
[eval exp="tf.E_MNDd3_count = tf.E_MNDd3_count-1" cond="tf.E_MNDd3_count>1"][eval exp="tf.E_MNDd3=0 ,tf.E_MNDd3_count=0" cond="tf.E_MNDd3_count==1"]
[eval exp="tf.E_APPd3_count = tf.E_APPd3_count-1" cond="tf.E_APPd3_count>1"][eval exp="tf.E_APPd3=0 ,tf.E_APPd3_count=0" cond="tf.E_APPd3_count==1"]

[eval exp="tf.E_charm_count = tf.E_charm_count-1" cond="tf.E_charm_count>1"][eval exp="tf.E_charm_STR=1 ,tf.E_charm_DUR=1 ,tf.E_charm_count=0" cond="tf.E_charm_count==1"]

[endmacro]

[macro name="Reflesh_EN_buff"]
;敵のスキルによる効果(１ターン)
[eval exp="tf.P_STRd1=0 , tf.P_DURd1=0 , tf.P_AGId1=0 , tf.P_DEXd1=0 , tf.P_MNDd1=0 , tf.P_APPd1=0 , tf.P_LUKd1=0"]
[eval exp="tf.E_STRb1=0 , tf.E_DURb1=0 , tf.E_AGIb1=0 , tf.E_DEXb1=0 , tf.E_MNDb1=0 , tf.E_APPb1=0 , tf.E_LUKb1=0"]
;敵のスキルによる効果(３ターン)
[eval exp="tf.E_STRb3_count = tf.E_STRb3_count-1" cond="tf.E_STRb3_count>1"][eval exp="tf.E_STRb3=0 ,tf.E_STRb3_count=0" cond="tf.E_STRb3_count==1"]
[eval exp="tf.E_DURb3_count = tf.E_DURb3_count-1" cond="tf.E_DURb3_count>1"][eval exp="tf.E_DURb3=0 ,tf.E_DURb3_count=0" cond="tf.E_DURb3_count==1"]
[eval exp="tf.E_AGIb3_count = tf.E_AGIb3_count-1" cond="tf.E_AGIb3_count>1"][eval exp="tf.E_AGIb3=0 ,tf.E_AGIb3_count=0" cond="tf.E_AGIb3_count==1"]
[eval exp="tf.E_DEXb3_count = tf.E_DEXb3_count-1" cond="tf.E_DEXb3_count>1"][eval exp="tf.E_DEXb3=0 ,tf.E_DEXb3_count=0" cond="tf.E_DEXb3_count==1"]
[eval exp="tf.E_MNDb3_count = tf.E_MNDb3_count-1" cond="tf.E_MNDb3_count>1"][eval exp="tf.E_MNDb3=0 ,tf.E_MNDb3_count=0" cond="tf.E_MNDb3_count==1"]
[eval exp="tf.E_APPb3_count = tf.E_APPb3_count-1" cond="tf.E_APPb3_count>1"][eval exp="tf.E_APPb3=0 ,tf.E_APPb3_count=0" cond="tf.E_APPb3_count==1"]

[eval exp="tf.P_STRd3_count = tf.P_STRd3_count-1" cond="tf.P_STRd3_count>1"][eval exp="tf.P_STRd3=0 ,tf.P_STRd3_count=0" cond="tf.P_STRd3_count==1"]
[eval exp="tf.P_DURd3_count = tf.P_DURd3_count-1" cond="tf.P_DURd3_count>1"][eval exp="tf.P_DURd3=0 ,tf.P_DURd3_count=0" cond="tf.P_DURd3_count==1"]
[eval exp="tf.P_AGId3_count = tf.P_AGId3_count-1" cond="tf.P_AGId3_count>1"][eval exp="tf.P_AGId3=0 ,tf.P_AGId3_count=0" cond="tf.P_AGId3_count==1"]
[eval exp="tf.P_DEXd3_count = tf.P_DEXd3_count-1" cond="tf.P_DEXd3_count>1"][eval exp="tf.P_DEXd3=0 ,tf.P_DEXd3_count=0" cond="tf.P_DEXd3_count==1"]
[eval exp="tf.P_MNDd3_count = tf.P_MNDd3_count-1" cond="tf.P_MNDd3_count>1"][eval exp="tf.P_MNDd3=0 ,tf.P_MNDd3_count=0" cond="tf.P_MNDd3_count==1"]
[eval exp="tf.P_APPd3_count = tf.P_APPd3_count-1" cond="tf.P_APPd3_count>1"][eval exp="tf.P_APPd3=0 ,tf.P_APPd3_count=0" cond="tf.P_APPd3_count==1"]

[endmacro]

[macro name="Initialize_3Tbuff"]
[eval exp="tf.P_STRd3=0 , tf.P_DURd3=0 , tf.P_AGId3=0 , tf.P_DEXd3=0 , tf.P_LUKd3=0 , tf.P_MNDd3=0 , tf.P_APPd3=0"]
[eval exp="tf.P_STRd3_count=1 , tf.P_DURd3_count=1 , tf.P_AGId3_count=1 , tf.P_DEXd3_count=1 , tf.P_MNDd3_count=1 , tf.P_APPd3_count=1"]

[eval exp="tf.P_STRb3=0 , tf.P_DURb3=0 , tf.P_AGIb3=0 , tf.P_DEXb3=0 , tf.P_LUKb3=0 , tf.P_MNDb3=0 , tf.P_APPb3=0"]
[eval exp="tf.P_STRb3_count=1 , tf.P_DURb3_count=1 , tf.P_AGIb3_count=1 , tf.P_DEXb3_count=1 , tf.P_MNDb3_count=1 , tf.P_APPb3_count=1"]

[eval exp="tf.E_STRd3=0 , tf.E_DURd3=0 , tf.E_AGId3=0 , tf.E_DEXd3=0 , tf.E_LUKd3=0 , tf.E_MNDd3=0 , tf.E_APPd3=0"]
[eval exp="tf.E_STRd3_count=1 , tf.E_DURd3_count=1 , tf.E_AGId3_count=1 , tf.E_DEXd3_count=1 , tf.E_LUKd3_count=1 , tf.E_MNDd3_count=1 , tf.E_APPd3_count=1"]

[eval exp="tf.E_STRb3=0 , tf.E_DURb3=0 , tf.E_AGIb3=0 , tf.E_DEXb3=0 , tf.E_LUKb3=0 , tf.E_MNDb3=1 , tf.E_APPb3=0"]
[eval exp="tf.E_STRb3_count=1 , tf.E_DURb3_count=1 , tf.E_AGIb3_count=1 , tf.E_DEXb3_count=1 , tf.E_LUKb3_count=1 , tf.E_MNDb3_count=1 , tf.E_APPb3_count=1"]
;魅了のデバフ
[eval exp="tf.E_charm_STR=1 , tf.E_charm_DUR=1 , tf.E_charm_count=1"]
;怒り
[eval exp="tf.E_anger_count=1 "]
[endmacro]

;プレイヤーのステータス欄
[macro name="MiniStatus"]
[layopt layer="2" visible=true]
[iscript]
tf.Decktxt = '山札：' + f.Deck.length + '/' + f.Cards.length ;
tf.P_HPtxt = '体力：' + tf.P_HP ;
tf.P_MGPtxt = '気力：' + f.P_MGP , tf.P_AVDtxt = '回避：+' + tf.P_AVD ;
tf.P_EROtxt = '欲情：' + tf.P_ERO , tf.P_EXHtxt = '疲労：' + f.P_EXH;
[endscript]
[ptext text="なずな" layer="2" edge="0x000000" size=25 x=20 y=480 ]
[ptext name="P_HPtxt" text="&tf.P_HPtxt" layer="2" edge="0x000000" size=20 x=20 y=510 overwrite=true]
[ptext name="P_MGPtxt" text="&tf.P_MGPtxt" layer="2" edge="0x000000" size=20 x=140 y=510 overwrite=true]
[ptext name="Decktxt" text="&tf.Decktxt" layer="2" edge="0x000000" size=20 x=20 y=540 overwrite=true]
[ptext name="P_AVDtxt" text="&tf.P_AVDtxt" layer="2" edge="0x000000" size=20 x=140 y=540 overwrite=true]
[ptext name="P_EROtxt" text="&tf.P_EROtxt" layer="2" edge="0x000000" size=20 x=20 y=570 overwrite=true]
[ptext name="P_EXHtxt" text="&tf.P_EXHtxt" layer="2" edge="0x000000" size=20 x=20 y=600 overwrite=true]

[iscript]
tf.E_HPtxt = '体力：' + tf.E_HP ;
tf.E_MGPtxt = '気力：' + tf.E_MGP ;
tf.E_EROtxt = '欲情：' + tf.E_ERO ;
tf.E_MNTtxt = '拘束：' + tf.Mount ;
[endscript]
[ptext text="&tf.E_name" layer="2" edge="0x000000" size=20 x=620 y=5 ]
[ptext name="E_HPtxt" text="&tf.E_HPtxt" layer="2" edge="0x000000" size=20 x=620 y=30 overwrite=true]
[ptext name="E_MGPtxt" text="&tf.E_MGPtxt" layer="2" edge="0x000000" size=20 x=740 y=30 overwrite=true]
[ptext name="E_EROtxt" text="&tf.E_EROtxt" layer="2" edge="0x000000" size=20 x=840 y=30 overwrite=true]
[ptext name="E_MNTtxt" text="&tf.E_MNTtxt" layer="2" edge="0x000000" size=20 x=840 y=50 overwrite=true]

[CardDebug]
[endmacro]

;カード関係
[macro name="DeckRemake"]
;cardを増減したときなどにDeckの再構築を行う
[iscript]
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]
[endmacro]

[macro name="CardShuffle"]
[DeckRemake]
;Deckはシャッフルした山札（ただしカード自体ではなくカードの位置nの列。引き換え番号みたいなもの）
[iscript]
for(i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[endmacro]

[macro name="ShowCardList"]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x="450" y="500" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Answer=f.Cards[f.Hand[0]]['value']" cond="f.Cards[f.Hand[0]]['active']>0" target="&f.Cards[f.Hand[0]]['tag']" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="500" text="&f.Cards[f.Hand[1]]['txt']" exp="tf.Answer=f.Cards[f.Hand[1]]['value']" cond="f.Cards[f.Hand[1]]['active']>0" target="&f.Cards[f.Hand[1]]['tag']" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="500" text="&f.Cards[f.Hand[2]]['txt']" exp="tf.Answer=f.Cards[f.Hand[2]]['value']" cond="f.Cards[f.Hand[2]]['active']>0" target="&f.Cards[f.Hand[2]]['tag']" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="500" text="&f.Cards[f.Hand[3]]['txt']" exp="tf.Answer=f.Cards[f.Hand[3]]['value']" cond="f.Cards[f.Hand[3]]['active']>0" target="&f.Cards[f.Hand[3]]['tag']" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="500" text="&f.Cards[f.Hand[4]]['txt']" exp="tf.Answer=f.Cards[f.Hand[4]]['value']" cond="f.Cards[f.Hand[4]]['active']>0" target="&f.Cards[f.Hand[4]]['tag']" ]
[endmacro]

[macro name="Calc_Card"]
;各色の数値を計算
[iscript]
f.Red=0,f.Green=0,f.Blue=0,f.black=0;
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "red"){f.Red += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "green"){f.Green += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "blue"){f.Blue += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "black"){f.black += f.Cards[f.Hand[i]]['value'];}
}
[endscript]
[endmacro]

[macro name="DeActivate"]
;コスト消費
[iscript]
i=0;
while(tf.Cost>0){
if(f.Cards[f.Hand[i]]['color']==tf.Type && f.Cards[f.Hand[i]]['active']>0 ){f.Cards[f.Hand[i]]['active']=0 , tf.Cost--};
i++;
}
[endscript]
[endmacro]

[macro name="ReActivate"]
;カードのアクティベート
[iscript]
for(i=0; i<5 ;i++){f.Cards[f.Hand[i]]['active'] = 1 ;}
[endscript]
[endmacro]

[macro name="Ikigire"]
[MiniStatus]
[ReActivate]
;息切れ時の疲労カード削除
[iscript]
i = 0;
n = 0;
while(n < 3){
  if(f.Cards[i]['color']=="black"){
    f.Cards.splice([i],1);
    n++;
  }
  else{
    i++;
  }
}
f.P_EXH = f.P_EXH - 3;
[endscript]
[DeckRemake]
[endmacro]

[macro name="CardDebug"]
[layopt layer="4" visible=true]
[iscript]
tf.Cardtxt ="全札：";
i=0;
while(i < f.Cards.length){
  tf.Cardtxt = tf.Cardtxt + f.Cards[i].txt;
  i++;
}
[endscript]
[ptext name="Cards" text="&f.Cards.length" layer="4" edge="0x000000" size=10 x=0 y=0 overwrite=true]
[ptext name="Cardstxt" text="&tf.Cardtxt" layer="4" edge="0x000000" size=10 x=30 y=0 overwrite=true]
[ptext name="Deck" text="&f.Deck" layer="4" edge="0x000000" size=10 x=0 y=10 overwrite=true]
[ptext name="Hand" text="&f.Hand" layer="4" edge="0x000000" size=10 x=0 y=20 overwrite=true]
[endmacro]

[macro name="Calc_P_Hit"]
[eval exp="tf.HIT = Math.floor(tf.P_DEX - tf.E_AGI ) * 5 + 25 + tf.ACC"]
[eval exp="tf.AvoidRate = 100 - tf.HIT "][limit]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
(命中[emb exp="tf.HIT"]％)
[endmacro]

[macro name="Calc_P_Crt"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice]
[eval exp="tf.CRT = 1.3" cond="tf.dice <= (f.P_LUK + tf.P_LUKb1) * tf.CRTrate"]
[endmacro]

[macro name="Calc_P_Damage"]
[Calc_P_Crt]
;敵防御力
[eval exp="tf.DEF = Math.floor(tf.E_DUR * 2)"]
;乱数の発生
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[Calc_P_Hit]
[endmacro]

[macro name="Calc_E_Hit"]
[eval exp="tf.HIT = Math.floor(tf.E_DEX - tf.P_AGI ) * 5 + 25 + tf.ACC"]
[eval exp="tf.HIT = tf.HIT - (tf.P_AVD * 20)"]
[eval exp="tf.AvoidRate = 100 - tf.HIT "][limit]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
(命中率[emb exp="tf.HIT"]％)[r]
[endmacro]

[macro name="Calc_E_Crt"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice]
[eval exp="tf.CRT = 1.3" cond="tf.dice <= (1 + tf.E_LUKb1) * f.P_LUK * 3 * tf.CRTrate"]
[endmacro]

[macro name="Calc_E_Damage"]
[Calc_E_Crt]
[eval exp="tf.DEF = Math.floor(tf.P_DUR * 2)"]
;乱数の発生
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.E_STR * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[Calc_E_Hit]
[endmacro]

;勝敗判定
[macro name="Triage"]
[jump storage="battle-Triage.ks" target="*game_lose" cond="tf.P_HP <= 0"]
[jump storage="battle-Triage.ks" target="*game_lose" cond="f.P_EXH >= 100"]
[jump storage="battle-Triage.ks" target="*game_win" cond="tf.E_HP <= 0"]
[endmacro]

[macro name="GoSKB"]
[Calc_Status]
[eval exp="tf.GoSKB = 0"]
[eval exp="tf.GoSKB = 1" cond="tf.E_ERO >= 1000"]
[endmacro]

[macro name="SUKEBE"]
;快感＝行為の基礎倍率RATE×
;部位ごとの乗算は他のマクロで実行する
;絶頂判定=(敵の性技技能値SEX-P.MND)+50⇒耐えた/失敗⇒スタン&SAN減少
[eval exp="tf.Kaikan = Math.floor(tf.RATE * 10)"]
;命中判定=(敵の性技技能SEX-P.SEX)
[eval exp="tf.HIT = Math.floor(tf.E_SEX - tf.P_SEX) * 5 + 50"]
(成功率[emb exp="tf.HIT"]％)[r]
[endmacro]

[macro name="MAZO"]
[if exp="f.P_MAZO>0"]
[eval exp="tf.RATE=f.P_MAZO*2 "]
[eval exp="tf.Kaikan = Math.floor(tf.RATE * 10)"]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]なずなの欲情が[emb exp="tf.Yokujo"]上昇した[p]
[endif]
[endmacro]

;絶頂判定
[macro name="Orgasm"]
[if exp="tf.P_ERO >= 700 && tf.Arousal != 2"]
[eval exp="tf.Arousal = 2"]
なずなは欲情状態になった[p]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =2 , tf.ArousMNDd =1 , tf.ArousSEXd =2"]
[endif]

[if exp="tf.Kaikan > 999 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
なずなは絶頂した[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]

[elsif exp="tf.Kaikan > 999 && tf.Orga >= 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
なずなは[emb exp="tf.OrgaCount"]回目の絶頂を迎えた[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]
[endif]
[endmacro]

[macro name="SANcheck"]
;理性喪失判定
[eval exp="tf.Max=Math.floor(tf.Kaikan/100)+1 , tf.Min=1"][dice]
[if exp="tf.Orga == 4 && f.Insanity==0"]
絶頂によりなずなの理性が[emb exp="tf.dice"]減少[p]
[eval exp="tf.P_SAN = tf.P_SAN - tf.dice"]
[endif]
;発狂判定
[if exp="5 < f.P_SAN - tf.P_SAN"]
[eval exp="f.Insanity=1"]
[endif]
[eval exp="tf.Kaikan = 0 , tf.Yokujo = 0"]
[endmacro]

[macro name="SCALD"]
[if exp="tf.E_scald>0"]
[eval exp="tf.E_HP = tf.E_HP - 100"][limit]
火傷で[EnName]の体力が100減少[p]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[Triage]
[endif]
[endmacro]

[macro name="Dress"]
[if exp="tf.P_DRESS > 1"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
なずなは下着姿になった[p]なずなの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]
[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
なずなは一糸まとわぬ姿になった[p]なずなの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[endmacro]

[return]
