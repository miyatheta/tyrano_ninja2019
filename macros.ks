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

[macro name="dice99"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[endmacro]

[macro name="dice05"]
[eval exp="tf.Max=5 , tf.Min=0"][dice]
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
[eval exp="f.P_MGP = 10" cond="f.P_MGP > 10"]
[eval exp="f.P_MGP = 0" cond="f.P_MGP < 0"]
[eval exp="tf.P_ERO = 9999" cond="tf.P_ERO > 9999"]
[eval exp="tf.P_ERO = 0" cond="tf.P_ERO < 0"]
[eval exp="tf.E_ERO = 9999" cond="tf.E_ERO > 9999"]
[eval exp="tf.E_ERO = 0" cond="tf.E_ERO < 0"]
[eval exp="tf.HIT= 0" cond="tf.HIT < 0"]
[eval exp="tf.HIT = 100" cond="tf.HIT > 100"]
[eval exp="tf.AvoidRate = 0" cond="tf.AvoidRate < 0"]
[eval exp="tf.AvoidRate = 100" cond="tf.AvoidRate > 100"]
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
tf.P_MND = f.P_MND  - tf.P_MNDd3 - tf.P_MNDd1 + tf.P_MNDb3 + tf.P_MNDb1 - f.P_KOHUN;
tf.P_SEX = f.P_SEX  - tf.P_SEXd3 - tf.P_SEXd1 + tf.P_SEXb3 + tf.P_SEXb1 - f.P_HYPNO;

tf.E_STR = f.E_STR - tf.E_STRd3 - tf.E_STRd1 + tf.E_STRb3 + tf.E_STRb1 + tf.E_anger_STR - tf.E_charm_STR;
tf.E_DUR = f.E_DUR - tf.E_DURd3 - tf.E_DURd1 + tf.E_DURb3 + tf.E_DURb1 ;
tf.E_AGI = f.E_AGI - tf.E_AGId3 - tf.E_AGId1 + tf.E_AGIb3 + tf.E_AGIb1 ;
tf.E_DEX = f.E_DEX - tf.E_DEXd3 - tf.E_DEXd1 + tf.E_DEXb3 + tf.E_DEXb1 - tf.E_anger_DEX;
tf.E_LUK = f.E_LUK - tf.E_LUKd3 - tf.E_LUKd1 + tf.E_LUKb3 + tf.E_LUKb1 ;
tf.E_MND = f.E_MND - tf.E_MNDd3 - tf.E_MNDd1 + tf.E_MNDb3 + tf.E_MNDb1 - tf.E_Sukeb_MND - tf.E_charm_MND - (2 - tf.P_DRESS);
tf.E_SEX = f.E_SEX - tf.E_SEXd3 - tf.E_SEXd1 + tf.E_SEXb3 + tf.E_SEXb1 - tf.E_charm_SEX ;
[endscript]
[endmacro]

[macro name="Initialize"]
[eval exp="tf.Turn=0 , tf.Mount=0"]
[eval exp="tf.P_HP=f.P_HP , tf.P_STR=f.P_STR , tf.P_DUR=f.P_DUR , tf.P_AGI=f.P_AGI , tf.P_DEX=f.P_DEX , tf.P_LUK=f.P_LUK , tf.P_MND=f.P_MND, tf.P_SEX=f.P_SEX"]
[eval exp="tf.P_AVD=f.P_AVD , tf.P_ERO=f.P_ERO , tf.P_SAN=f.P_SAN , tf.P_DRESS=f.P_DRESS , tf.P_ARMOR=f.P_ARMOR , tf.P_Barrier=0"]
[eval exp="tf.E_HP=f.E_HP , tf.E_STR=f.E_STR , tf.E_DUR=f.E_DUR , tf.E_AGI=f.E_AGI , tf.E_DEX=f.E_DEX , tf.E_LUK=f.E_LUK , tf.E_MND=f.E_MND , tf.E_SEX=f.E_SEX"]
[eval exp="tf.E_AVD=f.E_AVD ,tf.E_ERO=f.E_ERO , tf.E_SAN=f.E_SAN , tf.E_BND=f.E_BND , tf.E_MGP=f.E_MGP"]
;PLに有益
[eval exp="tf.P_STRb1=0 , tf.P_DURb1=0 , tf.P_AGIb1=0 , tf.P_DEXb1=0 , tf.P_MNDb1=0 , tf.P_SEXb1=0 , tf.P_LUKb1=0"]
[eval exp="tf.E_STRd1=0 , tf.E_DURd1=0 , tf.E_AGId1=0 , tf.E_DEXd1=0 , tf.E_MNDd1=0 , tf.E_SEXd1=0 , tf.E_LUKd1=0"]
[eval exp="tf.P_STRb3=0 , tf.P_DURb3=0 , tf.P_AGIb3=0 , tf.P_DEXb3=0 , tf.P_MNDb3=0 , tf.P_SEXb3=0 , tf.P_LUKb3=0"]
[eval exp="tf.E_STRd3=0 , tf.E_DURd3=0 , tf.E_AGId3=0 , tf.E_DEXd3=0 , tf.E_MNDd3=0 , tf.E_SEXd3=0 , tf.E_LUKd3=0"]
;的に有益
[eval exp="tf.P_STRd1=0 , tf.P_DURd1=0 , tf.P_AGId1=0 , tf.P_DEXd1=0 , tf.P_MNDd1=0 , tf.P_SEXd1=0 , tf.P_LUKd1=0"]
[eval exp="tf.E_STRb1=0 , tf.E_DURb1=0 , tf.E_AGIb1=0 , tf.E_DEXb1=0 , tf.E_MNDb1=0 , tf.E_SEXb1=0 , tf.E_LUKb1=0"]
[eval exp="tf.P_STRd3=0 , tf.P_DURd3=0 , tf.P_AGId3=0 , tf.P_DEXd3=0 , tf.P_MNDd3=0 , tf.P_SEXd3=0 , tf.P_LUKd3=0"]
[eval exp="tf.E_STRb3=0 , tf.E_DURb3=0 , tf.E_AGIb3=0 , tf.E_DEXb3=0 , tf.E_MNDb3=0 , tf.E_SEXb3=0 , tf.E_LUKb3=0"]
[endmacro]

[macro name="Initialize_BadStatus"]
;状態異常の初期値設定
[eval exp="tf.P_Stan = 0 , tf.P_ORGA = 0 , tf.OrgaStan = 0 , tf.OrgaCount=0 , tf.OrgaSEX = 1 ,f.P_INRAN = 0 , tf.Kaikan = 0 , f.Insanity=0"]
[eval exp="tf.Arousal=0 , tf.ArousSTRd =0 , tf.ArousAGId =0 , tf.ArousDEXd =0 , tf.ArousMNDb =0 "]
[eval exp="tf.E_charm_STR=0 , tf.E_charm_count=0"]
[eval exp="tf.E_anger_STR=0 , tf.E_anger_DEX=0 ,tf.E_anger_count=0"]
[eval exp="tf.E_scald = 0 , tf.E_Stan=0"]
;永続デバフ
[eval exp="tf.E_Sukeb_MND=0 , tf.E_charm_MND=0 , tf.E_charm_SEX=0"]
[endmacro]

[macro name="Reflesh_PL_buff"]
;PLのスキルによる効果(1ターン)
[eval exp="tf.P_STRb1=0 , tf.P_DURb1=0 , tf.P_AGIb1=0 , tf.P_DEXb1=0 , tf.P_MNDb1=0 , tf.P_SEXb1=0 , tf.P_LUKb1=0"]
[eval exp="tf.E_STRd1=0 , tf.E_DURd1=0 , tf.E_AGId1=0 , tf.E_DEXd1=0 , tf.E_MNDd1=0 , tf.E_SEXd1=0 , tf.E_LUKd1=0"]
;PLのスキルによる効果(3ターン)
[eval exp="tf.P_STRb3_count = tf.P_STRb3_count-1" cond="tf.P_STRb3_count>1"][eval exp="tf.P_STRb3=0 ,tf.P_STRb3_count=0" cond="tf.P_STRb3_count==1"]
[eval exp="tf.P_DURb3_count = tf.P_DURb3_count-1" cond="tf.P_DURb3_count>1"][eval exp="tf.P_DURb3=0 ,tf.P_DURb3_count=0" cond="tf.P_DURb3_count==1"]
[eval exp="tf.P_AGIb3_count = tf.P_AGIb3_count-1" cond="tf.P_AGIb3_count>1"][eval exp="tf.P_AGIb3=0 ,tf.P_AGIb3_count=0" cond="tf.P_AGIb3_count==1"]
[eval exp="tf.P_DEXb3_count = tf.P_DEXb3_count-1" cond="tf.P_DEXb3_count>1"][eval exp="tf.P_DEXb3=0 ,tf.P_DEXb3_count=0" cond="tf.P_DEXb3_count==1"]
[eval exp="tf.P_MNDb3_count = tf.P_MNDb3_count-1" cond="tf.P_MNDb3_count>1"][eval exp="tf.P_MNDb3=0 ,tf.P_MNDb3_count=0" cond="tf.P_MNDb3_count==1"]
[eval exp="tf.P_SEXb3_count = tf.P_SEXb3_count-1" cond="tf.P_SEXb3_count>1"][eval exp="tf.P_SEXb3=0 ,tf.P_SEXb3_count=0" cond="tf.P_SEXb3_count==1"]

[eval exp="tf.E_STRd3_count = tf.E_STRd3_count-1" cond="tf.E_STRd3_count>1"][eval exp="tf.E_STRd3=0 ,tf.E_STRd3_count=0" cond="tf.E_STRd3_count==1"]
[eval exp="tf.E_DURd3_count = tf.E_DURd3_count-1" cond="tf.E_DURd3_count>1"][eval exp="tf.E_DURd3=0 ,tf.E_DURd3_count=0" cond="tf.E_DURd3_count==1"]
[eval exp="tf.E_AGId3_count = tf.E_AGId3_count-1" cond="tf.E_AGId3_count>1"][eval exp="tf.E_AGId3=0 ,tf.E_AGId3_count=0" cond="tf.E_AGId3_count==1"]
[eval exp="tf.E_DEXd3_count = tf.E_DEXd3_count-1" cond="tf.E_DEXd3_count>1"][eval exp="tf.E_DEXd3=0 ,tf.E_DEXd3_count=0" cond="tf.E_DEXd3_count==1"]
[eval exp="tf.E_MNDd3_count = tf.E_MNDd3_count-1" cond="tf.E_MNDd3_count>1"][eval exp="tf.E_MNDd3=0 ,tf.E_MNDd3_count=0" cond="tf.E_MNDd3_count==1"]
[eval exp="tf.E_SEXd3_count = tf.E_SEXd3_count-1" cond="tf.E_SEXd3_count>1"][eval exp="tf.E_SEXd3=0 ,tf.E_SEXd3_count=0" cond="tf.E_SEXd3_count==1"]

[eval exp="tf.E_charm_count = tf.E_charm_count-1" cond="tf.E_charm_count>1"][eval exp="tf.E_charm_STR=0 ,tf.E_charm_count=0" cond="tf.E_charm_count==1"]
[eval exp="tf.E_anger_count = tf.E_anger_count-1" cond="tf.E_anger_count>1"][eval exp="tf.E_anger_STR=0 , tf.E_anger_DEX=0 , tf.E_anger_count=0" cond="tf.E_anger_count==1"]
[eval exp="tf.P_Counter = tf.P_Counter - 1" cond="tf.P_Counter"]
[endmacro]

[macro name="Reflesh_EN_buff"]
;敵のスキルによる効果(１ターン)
[eval exp="tf.P_STRd1=0 , tf.P_DURd1=0 , tf.P_AGId1=0 , tf.P_DEXd1=0 , tf.P_MNDd1=0 , tf.P_SEXd1=0 , tf.P_LUKd1=0"]
[eval exp="tf.E_STRb1=0 , tf.E_DURb1=0 , tf.E_AGIb1=0 , tf.E_DEXb1=0 , tf.E_MNDb1=0 , tf.E_SEXb1=0 , tf.E_LUKb1=0"]
;敵のスキルによる効果(３ターン)
[eval exp="tf.E_STRb3_count = tf.E_STRb3_count-1" cond="tf.E_STRb3_count>1"][eval exp="tf.E_STRb3=0 ,tf.E_STRb3_count=0" cond="tf.E_STRb3_count==1"]
[eval exp="tf.E_DURb3_count = tf.E_DURb3_count-1" cond="tf.E_DURb3_count>1"][eval exp="tf.E_DURb3=0 ,tf.E_DURb3_count=0" cond="tf.E_DURb3_count==1"]
[eval exp="tf.E_AGIb3_count = tf.E_AGIb3_count-1" cond="tf.E_AGIb3_count>1"][eval exp="tf.E_AGIb3=0 ,tf.E_AGIb3_count=0" cond="tf.E_AGIb3_count==1"]
[eval exp="tf.E_DEXb3_count = tf.E_DEXb3_count-1" cond="tf.E_DEXb3_count>1"][eval exp="tf.E_DEXb3=0 ,tf.E_DEXb3_count=0" cond="tf.E_DEXb3_count==1"]
[eval exp="tf.E_MNDb3_count = tf.E_MNDb3_count-1" cond="tf.E_MNDb3_count>1"][eval exp="tf.E_MNDb3=0 ,tf.E_MNDb3_count=0" cond="tf.E_MNDb3_count==1"]
[eval exp="tf.E_SEXb3_count = tf.E_SEXb3_count-1" cond="tf.E_SEXb3_count>1"][eval exp="tf.E_SEXb3=0 ,tf.E_SEXb3_count=0" cond="tf.E_SEXb3_count==1"]

[eval exp="tf.P_STRd3_count = tf.P_STRd3_count-1" cond="tf.P_STRd3_count>1"][eval exp="tf.P_STRd3=0 ,tf.P_STRd3_count=0" cond="tf.P_STRd3_count==1"]
[eval exp="tf.P_DURd3_count = tf.P_DURd3_count-1" cond="tf.P_DURd3_count>1"][eval exp="tf.P_DURd3=0 ,tf.P_DURd3_count=0" cond="tf.P_DURd3_count==1"]
[eval exp="tf.P_AGId3_count = tf.P_AGId3_count-1" cond="tf.P_AGId3_count>1"][eval exp="tf.P_AGId3=0 ,tf.P_AGId3_count=0" cond="tf.P_AGId3_count==1"]
[eval exp="tf.P_DEXd3_count = tf.P_DEXd3_count-1" cond="tf.P_DEXd3_count>1"][eval exp="tf.P_DEXd3=0 ,tf.P_DEXd3_count=0" cond="tf.P_DEXd3_count==1"]
[eval exp="tf.P_MNDd3_count = tf.P_MNDd3_count-1" cond="tf.P_MNDd3_count>1"][eval exp="tf.P_MNDd3=0 ,tf.P_MNDd3_count=0" cond="tf.P_MNDd3_count==1"]
[eval exp="tf.P_SEXd3_count = tf.P_SEXd3_count-1" cond="tf.P_SEXd3_count>1"][eval exp="tf.P_SEXd3=0 ,tf.P_SEXd3_count=0" cond="tf.P_SEXd3_count==1"]

[endmacro]

[macro name="Initialize_3Tbuff"]
[eval exp="tf.P_STRd3=0 , tf.P_DURd3=0 , tf.P_AGId3=0 , tf.P_DEXd3=0 , tf.P_LUKd3=0 , tf.P_MNDd3=0 , tf.P_SEXd3=0"]
[eval exp="tf.P_STRd3_count=1 , tf.P_DURd3_count=1 , tf.P_AGId3_count=1 , tf.P_DEXd3_count=1 , tf.P_MNDd3_count=1 , tf.P_SEXd3_count=1"]

[eval exp="tf.P_STRb3=0 , tf.P_DURb3=0 , tf.P_AGIb3=0 , tf.P_DEXb3=0 , tf.P_LUKb3=0 , tf.P_MNDb3=0 , tf.P_SEXb3=0"]
[eval exp="tf.P_STRb3_count=1 , tf.P_DURb3_count=1 , tf.P_AGIb3_count=1 , tf.P_DEXb3_count=1 , tf.P_MNDb3_count=1 , tf.P_SEXb3_count=1"]

[eval exp="tf.E_STRd3=0 , tf.E_DURd3=0 , tf.E_AGId3=0 , tf.E_DEXd3=0 , tf.E_LUKd3=0 , tf.E_MNDd3=0 , tf.E_SEXd3=0"]
[eval exp="tf.E_STRd3_count=1 , tf.E_DURd3_count=1 , tf.E_AGId3_count=1 , tf.E_DEXd3_count=1 , tf.E_LUKd3_count=1 , tf.E_MNDd3_count=1 , tf.E_SEXd3_count=1"]

[eval exp="tf.E_STRb3=0 , tf.E_DURb3=0 , tf.E_AGIb3=0 , tf.E_DEXb3=0 , tf.E_LUKb3=0 , tf.E_MNDb3=1 , tf.E_SEXb3=0"]
[eval exp="tf.E_STRb3_count=1 , tf.E_DURb3_count=1 , tf.E_AGIb3_count=1 , tf.E_DEXb3_count=1 , tf.E_LUKb3_count=1 , tf.E_MNDb3_count=1 , tf.E_SEXb3_count=1"]
;魅了のデバフ
[eval exp="tf.E_charm_STR=0 , tf.E_charm_MND=0 , tf.E_charm_count=1"]
;怒り
[eval exp="tf.E_anger_STR=0 , tf.E_anger_DEX=0 , tf.E_anger_count=1"]
[endmacro]

;プレイヤーのステータス欄
[macro name="MiniStatus"]
[Calc_Status]
[layopt layer="2" visible=true]
[iscript]
tf.Decktxt = '山札：' + f.Deck.length + '/' + f.Cards.length ;
tf.P_HPtxt = '体力：' + tf.P_HP ;
tf.P_MGPtxt = '気力：' + f.P_MGP , tf.P_AVDtxt = '回避：+' + tf.P_AVD ;
tf.P_EROtxt = '欲情：' + tf.P_ERO , tf.P_EXHtxt = '疲労：' + f.P_EXH;
tf.BadStxt ='';
if(f.P_MAZO>0){tf.BadStxt += '[被虐]';}
if(f.P_HYPNO>0){tf.BadStxt += '[催淫]';}
if(f.P_KOHUN>0){tf.BadStxt += '[興奮]';}
if(f.P_CURSE>1){tf.BadStxt += '[淫紋]';}
if(f.P_BOOB>1){tf.BadStxt += '[噴乳]';}
if(f.P_ADDICT>1){tf.BadStxt += '[媚薬]';}
tf.Worstxt ='';
if(tf.Arousal>0){tf.Worstxt += '[欲情]';}
if(tf.P_ORGA>0){tf.Worstxt += '[絶頂]';}
[endscript]
[ptext text="なずな" layer="2" edge="0x000000" size=25 x=20 y=476 ]
[ptext name="Worstxt" text="&tf.Worstxt" layer="2" color="0xdc143c" edge="0x000000" size=15 x=100 y=476 overwrite=true]
[ptext name="BadStxt" text="&tf.BadStxt" layer="2" color="0xc71585" edge="0x000000" size=15 x=100 y=490 overwrite=true]
[ptext name="P_HPtxt" text="&tf.P_HPtxt" layer="2" edge="0x000000" size=20 x=20 y=510 overwrite=true]
[ptext name="P_MGPtxt" text="&tf.P_MGPtxt" layer="2" edge="0x000000" size=20 x=140 y=510 overwrite=true]
[ptext name="Decktxt" text="&tf.Decktxt" layer="2" edge="0x000000" size=20 x=20 y=540 overwrite=true]
[ptext name="P_AVDtxt" text="&tf.P_AVDtxt" layer="2" edge="0x000000" size=20 x=140 y=540 overwrite=true]
[ptext name="P_EROtxt" text="&tf.P_EROtxt" layer="2" edge="0x000000" size=20 x=20 y=570 overwrite=true]
[ptext name="P_EXHtxt" text="&tf.P_EXHtxt" layer="2" edge="0x000000" size=20 x=20 y=600 overwrite=true]

[iscript]
tf.TURNtxt = '手番' + tf.Turn ;
tf.E_HPtxt = '体力：' + tf.E_HP ;
tf.E_MGPtxt = '気力：' + tf.E_MGP ;
if(tf.Mount > 0){
  tf.E_MNTtxt = '拘束：' + tf.Mount ;
}else{
  tf.E_MNTtxt = '　';
}
if(tf.E_anger_count>0){
  tf.E_Mental = '怒り'
}else if(tf.E_charm_count>0){
  tf.E_Mental = '欲情'
}else{
  tf.E_Mental = '通常'
}
[endscript]
[ptext text="&tf.E_name" layer="2" edge="0x000000" size=24 x=620 y=0 ]
[ptext name="TURNtxt" text="&tf.TURNtxt" layer="2" edge="0x000000" size=20 x=740 y=5  overwrite=true]
[ptext name="E_HPtxt" text="&tf.E_HPtxt" layer="2" edge="0x000000" size=20 x=620 y=30 overwrite=true]
[ptext name="E_MGPtxt" text="&tf.E_MGPtxt" layer="2" edge="0x000000" size=20 x=740 y=30 overwrite=true]
[ptext name="E_Mental" text="&tf.E_Mental" layer="2" edge="0x000000" size=20 x=860 y=30 overwrite=true]
[ptext name="E_MNTtxt" text="&tf.E_MNTtxt" layer="2" edge="0x000000" size=20 x=620 y=50 overwrite=true]


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
f.Red=0,f.Green=0,f.Blue=0,f.Black=0;
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
  if(f.Cards[f.Hand[i]]['color'] == "black"){f.Black += f.Cards[f.Hand[i]]['value'];}
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
while(n < f.Black){
  if(f.Cards[i]['color']=="black"){
    f.Cards.splice([i],1);
    n++;
  }
  else{
    i++;
  }
}
f.P_EXH = f.P_EXH - f.Black;
[endscript]
[DeckRemake]
[endmacro]

[macro name="Hirou"]
[eval exp="f.P_EXH++"]
;Deckに要素を追加。カードの長さ＝追加するカードのナンバーになる。配列のナンバーは０から
[iscript]
f.Deck.push(f.Cards.length);
f.Cards.push({color:"black",value:1,active:1,txt:"疲労",tag:"*疲労"});
[endscript]
[endmacro]

[macro name="Calc_P_Hit"]
[eval exp="tf.HIT = Math.floor(tf.P_DEX - tf.E_AGI ) * 5 + 25 + tf.ACC"]
[eval exp="tf.AvoidRate = 100 - tf.HIT "][limit]
[dice99]
(命中[emb exp="tf.HIT"]％)
[endmacro]

[macro name="Calc_P_Crt"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice]
[eval exp="tf.CRT = 2" cond="tf.dice <= tf.P_LUK * tf.CRTrate"]
[endmacro]

[macro name="Calc_P_Damage"]
[Calc_P_Crt]
;敵防御力
[eval exp="tf.DEF = Math.floor(tf.E_DUR * 2)"][eval exp="tf.DEF = 0" cond="tf.CRT > 1"]
;乱数の発生
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[Calc_P_Hit]
[endmacro]

[macro name="Calc_P_DamageEx"]
;特殊攻撃用のクリティカル（防御貫通）なし用
[Calc_P_Crt]
;敵防御力
[eval exp="tf.DEF = Math.floor(tf.E_DUR * 2)"]
;乱数の発生
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[Calc_P_Hit]
[endmacro]

[macro name="Calc_E_Hit"]
[eval exp="tf.HIT = Math.floor(tf.E_DEX - tf.P_AGI ) * 5 + 25 + tf.ACC"]
[eval exp="tf.HIT = tf.HIT - (tf.P_AVD * 20)"]
[eval exp="tf.AvoidRate = 100 - tf.HIT "][limit]
[dice99]
(命中率[emb exp="tf.HIT"]％)[r]
[endmacro]

[macro name="Calc_E_Crt"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice]
[eval exp="tf.CRT = 2" cond="tf.dice <= tf.E_LUK * tf.CRTrate"]
[endmacro]

[macro name="Calc_E_Damage"]
[Calc_E_Crt]
[eval exp="tf.DEF = Math.floor(tf.P_DUR * 2)"][eval exp="tf.DEF = 0" cond="tf.CRT > 1"]
;乱数の発生
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[eval exp="tf.ATP = tf.E_STR * tf.RATE + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[Calc_E_Hit]
[endmacro]

;カウンター
[macro name="P_Counter"]
[call storage="btl-PL-Skill.ks" target="*PLカウンター発動" cond="tf.P_Counter > 1 "]
[endmacro]

;身代わり
[macro name="P_Barrier"]
[call storage="btl-PL-Magic.ks" target="*変わり身発動" cond="tf.P_Barrier > 1"]
[endmacro]

;勝敗判定
[macro name="Triage"]
[jump storage="btl-Triage.ks" target="*game_lose" cond="tf.P_HP <= 0"]
[jump storage="btl-Triage.ks" target="*game_lose" cond="f.P_EXH >= 100"]
[jump storage="btl-Triage.ks" target="*game_win" cond="tf.E_HP <= 0"]
[endmacro]

[macro name="GoSKB"]
[Calc_Status]
[eval exp="tf.GoSKB = 0"]
[eval exp="tf.GoSKB = 1" cond="tf.E_ERO >= 1000"]
[endmacro]

;快感値計算
[macro name="SUKEBE"]
;快感＝行為の基礎倍率RATE×
;部位ごとの乗算は他のマクロで実行する
[dice05]
[eval exp="tf.Bonus = Math.floor(tf.E_SEX - tf.P_SEX + f.P_MAZO)"]
[eval exp="tf.Bonus = 1" cond="tf.Bonus < 1"]
[eval exp="tf.Kaikan = Math.floor(tf.E_SEX * tf.RATE * f.P_ADDICT * f.P_CURSE * tf.OrgaSEX) + (tf.Bonus * 5) + tf.dice"]
;命中判定=P_MNDとE_SEXで対抗ロール。ダイスの最大値は快感の大きさに比例⇒結果でリアクションを変更
[eval exp="tf.Max = tf.Kaikan , tf.Min=0"][dice]
[eval exp="tf.Resist = Math.floor(tf.P_MND - tf.E_SEX) * 5 + 50"]
[eval exp="tf.Resist > tf.dice"]
(対抗ロール[emb exp="tf.Resist"]>[emb exp="tf.dice"])[r]
[endmacro]

;被虐
[macro name="MAZO"]
[if exp="f.P_MAZO>0"]
[eval exp="tf.RATE = f.P_MAZO"]
[dice05]
[eval exp="tf.Kaikan = Math.floor(4 * tf.RATE * tf.OrgaSEX) + tf.dice"]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Kaikan"][limit]
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]なずなの欲情が[emb exp="tf.Kaikan"]上昇した[p]
[endif]
[endmacro]

;欲情＆絶頂判定
[macro name="Orgasm"]
[call storage="btl-Orgasm.ks" target="*絶頂判定"]
[endmacro]

[macro name="SANcheck"]
;理性喪失量判定
[eval exp="tf.Damage = 1"][dice]
[if exp="tf.P_ORGA == 4 && f.Insanity==0"]
絶頂によりなずなの理性が[emb exp="tf.Damage"]減少した[p]
[eval exp="tf.P_SAN = tf.P_SAN - tf.Damage"]
[endif]
;発狂判定
[if exp="5 <= f.P_SAN - tf.P_SAN"]
[dice99]
[eval exp="f.Insanity = 1" cond="tf.dice > tf.P_SAN"]
なずなは法悦した[p]
[endif]
[endmacro]

[macro name="SCALD"]
[if exp="tf.E_scald>0"]
[eval exp="tf.E_HP = tf.E_HP - 100"][limit]
火傷で[EnName]の体力が100減少[p]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[Triage]
[endif]
[endmacro]

[macro name="CHARM"]
[eval exp="tf.E_charm_count = 3 "]
[eval exp="tf.E_charm_MND += 1 , tf.E_charm_SEX += 2"]
[eval exp="tf.E_charm_STR = 2 , tf.E_charm_AGI = 1 , tf.E_charm_DEX = 1 "]
[EnName]は欲情状態になった[r]
[EnName]の物理攻撃力、回避、命中が低下した(３ターン)[r]
[EnName]の精神力が減少した[r]
[EnName]の房中術が減少した[r]
[endmacro]

[macro name="Dress"]
[if exp="tf.P_DRESS > 1"]
[eval exp="tf.P_DRESS = 1"]
なずな は下着姿になった[r][EnName]の精神力が低下した[p]
[chara_mod name="kunugi" face="seminude"]
[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_DRESS = 0"]
なずな は一糸まとわぬ姿になった[r][EnName]の精神力が低下した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[endmacro]

[return]
