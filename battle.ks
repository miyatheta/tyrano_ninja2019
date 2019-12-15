*start
[cm]
[clearfix]
[start_keyconfig]
@call storage="macros.ks" target="*マクロ"

[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=20 top=420 width=920 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=24 x=50 y=410]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
[chara_new  name="gouza"  storage="chara/gouza/pr_gouza.png" jname="豪座" ]

[chara_show  name="gouza" width=300 left=1000 top=50 wait="true"]
[anim name="gouza" opacity=0 time=1]
[anim name="gouza" left=750 top=50 time=1]
[anim name="gouza" opacity=255 left=550 top=50 time=300 anim="true" effect="jswing" ]
#
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
;永続バフ
[eval exp="f.P_SENboost=1"]
;サイズの設定
[eval exp="tf.Max=20 , tf.Min=0"][dice][eval exp="tf.E_SIZ = tf.dice"]
[eval exp="tf.Max=5 , tf.Min=1"][dice][eval exp="tf.E_LUK = tf.dice"]
[eval exp="tf.Max=5 , tf.Min=0"][dice][eval exp="tf.E_APP = tf.E_APP + tf.dice"]
[eval exp="tf.Max=8 , tf.Min=0"][dice][eval exp="tf.E_SEX = tf.E_SEX + tf.dice"]
[eval exp="tf.Max=8 , tf.Min=0"][dice][eval exp="tf.E_SAN = tf.E_SAN + tf.dice"]
;性格の設定
;暴力性の決定
;性的指向の設定
[Initialize_1Tbuff]
[Initialize_3Tbuff]
[Initialize_Cards]

*Initialize_BudStatus
;状態異常の初期値設定
[eval exp="tf.Orga = 0 , tf.OrgaStan = 0 , tf.OrgaCount=0 , tf.OrgaPOWb = 1 ,f.P_INRAN = 0 , tf.Kaikan = 0 , f.Insanity=0"]
[eval exp="tf.Arousal=0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb = 0 , tf.ArousPOWb = 0 , tf.ArousSEXd =1"]
[eval exp="tf.E_scald = 0 , tf.E_stan=0"]

;疲労の反映
[if exp="f.P_EXH >89"]疲労（重度）[p][eval exp="tf.P_AGI=tf.P_AGI-20 , tf.P_ACTmax=tf.P_ACTmax-2"]
[elsif exp="f.P_EXH >69"]疲労[p][eval exp="tf.P_AGI=tf.P_AGI-15 , tf.P_ACTmax=tf.P_ACTmax-1"]
[elsif exp="f.P_EXH >49"]疲労（軽度）[p][eval exp="tf.P_AGI=tf.P_AGI-10"]
[endif]
[eval exp="tf.P_ACT=tf.P_ACTmax"]
;欲情の反映
[if exp="tf.P_ERO >79"]
くぬぎは興奮している[p]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =0.8 , tf.ArousAGId =0.8 , tf.ArousDEXd =0.8 , tf.ArousAPPb =2 , tf.ArousPOWb =2 , tf.ArousSEXd =2"]
[endif]

*turn_start
;[show_status]
[WriteStatus]
;ターン開始
[eval exp="tf.Turn=tf.Turn+1"]
;状態異常のカウント・治癒
;絶頂
[eval exp="tf.Orga = tf.Orga - 1"]
[if exp="tf.Orga > 0"]
[eval exp="tf.P_ACT = tf.P_ACT - 1"][limit]
くぬぎは絶頂の余韻から抜け出せないでいる!(呼吸-1)[p]
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

*E_skill_select
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;コンボルート選定
[if exp="tf.dice >= 60"]
[jump storage="skilllist.ks" target="&tf.E_skill_A"]
[elsif exp="tf.dice >= 25"]
[jump storage="skilllist.ks" target="&tf.E_skill_B"]
[else]
[jump storage="skilllist.ks" target="&tf.E_skill_C"]
[endif]
[s]

*P_phase_start
;プレーヤーターンの開始
[eval exp="tf.P_AURtemp = f.P_AUR"]
;[jump target="*ikigire" cond="tf.P_ACT <= 0"]

*手札構築
[eval exp="tf.P_ACT = tf.P_ACTmax"]
;並び替えたデッキ（山札）から手札に補充
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5],f.Deck[6]]" cond="tf.P_ACTmax>=7"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5]]" cond="tf.P_ACTmax==6"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]" cond="tf.P_ACTmax==5"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3]]" cond="tf.P_ACTmax==4"]

*手札選択
;今回の選択tf.Answerに選択した手札handのカードID（cardに紐づく絶対値）を登録、そのカードのactiveを０に
;[show_status]
[jump target="*選択終了" cond="tf.P_ACT <= 0 "]
[wait time="10"]
[glink color="blue" size="20" x="260" width="150" y="100" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Answer=f.Cards[f.Hand[0]]['id'] , f.Cards[f.Hand[0]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[0]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="170" text="&f.Cards[f.Hand[1]]['txt']" exp="tf.Answer=f.Cards[f.Hand[1]]['id'] , f.Cards[f.Hand[1]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[1]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="240" text="&f.Cards[f.Hand[2]]['txt']" exp="tf.Answer=f.Cards[f.Hand[2]]['id'] , f.Cards[f.Hand[2]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[2]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="310" text="&f.Cards[f.Hand[3]]['txt']" exp="tf.Answer=f.Cards[f.Hand[3]]['id'] , f.Cards[f.Hand[3]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[3]]['active']==1"]
[if exp="tf.P_ACTmax>=5"]
[glink color="blue" size="20" x="560" width="150" y="100" text="&f.Cards[f.Hand[4]]['txt']" exp="tf.Answer=f.Cards[f.Hand[4]]['id'] , f.Cards[f.Hand[4]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[4]]['active']==1"][endif]
[if exp="tf.P_ACTmax>=6"]
[glink color="blue" size="20" x="560" width="150" y="170" text="&f.Cards[f.Hand[5]]['txt']" exp="tf.Answer=f.Cards[f.Hand[5]]['id'] , f.Cards[f.Hand[5]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[5]]['active']==1"][endif]
[if exp="tf.P_ACTmax>=7"]
[glink color="blue" size="20" x="560" width="150" y="240" text="&f.Cards[f.Hand[6]]['txt']" exp="tf.Answer=f.Cards[f.Hand[6]]['id'] , f.Cards[f.Hand[6]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*スキル選択" cond="tf.Answer=f.Cards[f.Hand[6]]['active']==1"][endif]
[glink color="blue" size="20" x="560" width="150" y="310" text="戻る" exp="" target="*リセット" ]
[s]

*リセット
;カードの選択済みステータスactiveをリセット,選択済みf.selectedを空に
[eval exp="tf.P_ACT = tf.P_ACTmax , f.P_AUR = tf.P_AURtemp ,tf.Set = 0"]
[eval exp="f.Cards[f.Hand[0]]['active']=1"]
[eval exp="f.Cards[f.Hand[1]]['active']=1"]
[eval exp="f.Cards[f.Hand[2]]['active']=1"]
[eval exp="f.Cards[f.Hand[3]]['active']=1"]
[eval exp="f.Cards[f.Hand[4]]['active']=1" cond="tf.P_ACTmax>=5"]
[eval exp="f.Cards[f.Hand[5]]['active']=1" cond="tf.P_ACTmax>=6"]
[eval exp="f.Cards[f.Hand[6]]['active']=1" cond="tf.P_ACTmax>=7"]
[eval exp="f.Selected=[] , f.SkillSet=[]"]
[jump target="*手札選択"]
[s]

*スキル選択
;忍術の場合利用する忍術を予約。リセット時は各種計算を開放
[WriteStatus]
[jump target="*P_Attack_option" cond="tf.Answer<3"]
[jump target="*場札追加" ]
[s]
*P_Attack_option
;プレイヤーのスキル選択
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="集気法"  target="*P_Attack_conf0"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="160"  text="火炎"  target="*P_Attack_conf1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="220"  text="空蝉"  target="*P_Attack_conf2" cond="tf.P_DRESS>0"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="220"  text="衣変"  target="*P_Attack_conf4" cond="tf.P_DRESS==0"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="280"  text="魅了"  target="*P_Attack_conf3"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="340"  text="螺旋功"  target="*P_Attack_conf5"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="400"  text="戻る"  exp="f.Cards[tf.Answer]['active']=1 , tf.P_ACT=tf.P_ACT+1" target="*手札選択"]
[s]
*使用スキル登録
;予約したスキルを配列に格納
[iscript]
f.SkillSet.push(tf.P_Attack_id);
[endscript]
;[emb exp="f.P_Attack[f.SkillSet[0]]['name']"]を予約[p]
*場札追加
;今回の選択answerを選択済みに登録、継続フラグcomb=1なら再選択
;[eval exp="tf.P_ACT = tf.P_ACT - 1"]
[iscript]
f.Selected.push(tf.Answer);
tf.Suite1=1 , tf.Suite2=2;
if(tf.Set>0){
  tf.Suite1 = f.Cards[f.Selected[tf.Set]]['suite'];
  tf.Suite2 = f.Cards[f.Selected[tf.Set-1]]['suite'];
}
[endscript]
[if exp="tf.Suite1 == tf.Suite2"]
[emb exp="f.Cards[f.Selected[tf.Set]]['suite']"]ボーナス獲得[cm]
[eval exp="tf.P_Cardb1 = tf.P_Cardb1 + 0.2"]
[endif]
[eval exp="tf.Set=tf.Set+1"]
[if exp="f.Cards[tf.Answer]['comb'] == 1"][jump target="*再選択"]
[else][jump target="*選択終了"][endif]
[s]

*再選択
[jump target="*手札選択"]
[s]

*選択終了
;墓地f.cemetaryに今回の手札を追加。山札からも今回の手札を削除。
;演出としては選ばれたカードのみ表面表示。それ以外は裏面表示（＝中身はこの時点でどうでも良くなる）
[iscript]
f.temp=[];
f.temp = f.Cemetery.concat(f.Hand);
f.Cemetery = f.temp;
f.Deck.splice(0,tf.P_ACTmax);
tf.length = f.Deck.length;
[endscript]
;選択済：[emb exp="f.Selected"][r]残山札：[emb exp="f.Deck"][r]墓地：[emb exp="f.Cemetery"][p]
;アクティベートされたカード枚数でACTを算出
;実際には行動実行時に減算するので不要
[eval exp="tf.atk=-1 , tf.Suite1=1 , tf.Suite2=2"]
[iscript]
tf.Len=f.Selected.length;
[endscript]

*カードの実行
;選択したカードを1枚目から実行する
;それぞれのカードのtypeを元に攻撃のconfにjump
;カード実行後は先頭のカードを削除してここに戻す
;選択済みカードが無くなったら攻撃終了
[eval exp="tf.atk= tf.atk+1"]
[jump target="*攻撃終了" cond="tf.atk >= tf.Len"]
[iscript]
tf.Suite1=1 , tf.Suite2=2;
if(tf.atk>0){
  tf.Suite1 = f.Cards[f.Selected[tf.atk]]['suite'];
  tf.Suite2 = f.Cards[f.Selected[tf.atk-1]]['suite'];
}
[endscript]
[if exp="tf.Suite1 == tf.Suite2"]
[emb exp="f.Cards[f.Selected[tf.atk]]['suite']"]ボーナス発生[r]
[eval exp="tf.P_Cardb1 = tf.P_Cardb1 + 0.2"]
[else]
[eval exp="tf.P_Cardb1 = 1"]
[endif]
[jump storage="SkillGame.ks" target="*start" cond="f.Cards[f.Selected[tf.atk]]['type']==1"]
[jump target="*P_attack_Type2" cond="f.Cards[f.Selected[tf.atk]]['type']==2"]
[jump target="*P_attack_Type3" cond="f.Cards[f.Selected[tf.atk]]['type']==3"]
[jump target="*P_attack_Type4" cond="f.Cards[f.Selected[tf.atk]]['type']==4"]
[jump target="*P_attack_Type5" cond="f.Cards[f.Selected[tf.atk]]['type']==5"]
[jump target="*P_attack_Type6" cond="f.Cards[f.Selected[tf.atk]]['type']==6"]
[jump target="*P_attack_Type7" cond="f.Cards[f.Selected[tf.atk]]['type']==7"]
[s]

*P_Attack_conf0
集気法:気力+10 [r]
気力0：印1[p]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_Attack_id = 0" target="*使用スキル登録" ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_Attack_option"  ]
[s]
*P_Attack_conf1
火炎:敵に必中で非物理ダメージ。火傷（100ダメージ）を３回付与[r]
気力60：印3[p]
[if exp="f.P_AUR < 60"]気力が足りない[p][jump target="*P_Attack_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_Attack_id = 1 , f.P_AUR = f.P_AUR - 60" target="*使用スキル登録"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_Attack_option"  ]
[s]
*P_Attack_conf2
空蝉：敵の攻撃被弾時に一度だけダメージを無効化する。代わりに衣服を失う。衣服を着ていないと使えない[r]
気力50：印3[p]
[if exp="f.P_AUR < 50"]気力が足りない[p][jump target="*P_Attack_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_Attack_id = 2 , f.P_AUR = f.P_AUR - 50" target="*使用スキル登録"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_Attack_option"  ]
[s]
*P_Attack_conf3
魅了：敵の攻撃力と防御を低下(３ターン)[r]
気力30：印2[p]
[if exp="f.P_AUR < 30"]気力が足りない[p][jump target="*P_Attack_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_Attack_id = 3 , f.P_AUR = f.P_AUR - 30" target="*使用スキル登録"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_Attack_option"  ]
[s]
*P_Attack_conf4
衣変：失った衣装を復元します。どこから服が出てくるかは謎[r]
気力20：印2[p]
[if exp="f.P_AUR < 20"]気力が足りない[p][jump target="*P_Attack_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_Attack_id = 4 , f.P_AUR = f.P_AUR - 20" target="*使用スキル登録"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_Attack_option"  ]
[s]
*P_Attack_conf5
[Calc_Status]
[eval exp="tf.ACC = 0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
螺旋功:防御力無視・装甲貫通の非物理ダメージ[r]
気力100：印4[p]
[if exp="f.P_AUR < 100"]気力が足りない[p][jump target="*P_Attack_option"][endif]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="決定"  exp="tf.P_Attack_id = 5 , f.P_AUR = f.P_AUR - 100" target="*使用スキル登録"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="戻る"  target="*P_Attack_option"  ]
[s]

*E_Def_select
[Calc_Status]
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.dice>tf.E_ACT-1"]
;防御
[eval exp="tf.E_AVD=0 , tf.E_GRD=1.5 , tf.E_ACT=tf.E_ACT-0"]
[enemyname]:防御[p]
[WriteStatus]
[else]
;回避
[eval exp="tf.E_AVD = Math.floor(tf.E_AGI * 3) , tf.E_GRD=0 , tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.AvoidRate = 100 - Math.floor(tf.HitRate/10 * (100 - tf.E_AVD)/10)"][limit]
[enemyname]回避：[emb exp="tf.AvoidRate"]％[p]
[WriteStatus]
[endif]
[return]

*P_Attack_surrender
[GoSKB]
[if exp="tf.GoSKB == 1"]
#敵
・・・よかろう[p]
[jump target="*bochu"]
[endif]
#敵
たわけ！！そんな見え透いた嘘に引っかかるか！！[p]
[jump target="P_phase_start"]
[s]
*P_attack_Type2
;拳
[Calc_Status]
[eval exp="tf.RATE = 6.0 , tf.ACC = 30 , tf.CRTrate = 1.2 , tf.comb=1"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
くぬぎの[emb exp="f.Cards[f.Selected[tf.atk]]['name']"][Calc_HitRate]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[Calc_Damage]
[eval exp="tf.E_DURd1 = tf.E_DURd1 - 0.25"][eval exp="tf.E_DURd1=0" cond="tf.E_DURd1 < 0"]
;[SelectedCardSplice]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[triage]
[enemyname]の防御力低下[p]
[jump target="*カードの実行"]
[s]

*P_attack_Type3
;下段蹴り
[Calc_Status]
[eval exp="tf.RATE = 6.0 , tf.ACC = 30 , tf.CRTrate = 1.0 , tf.comb=1"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
くぬぎの[emb exp="f.Cards[f.Selected[tf.atk]]['name']"][Calc_HitRate]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[Calc_Damage]
[eval exp="tf.E_AGId1 = tf.E_AGId1 - 0.25"][eval exp="tf.E_AGId1=0" cond="tf.E_AGId1 < 0"]
;[SelectedCardSplice]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[r]
[triage]
[enemyname]の回避が低下[p]
[jump target="*カードの実行"]
[s]

*P_attack_Type4
;くない
[Calc_Status]
[eval exp="tf.RATE = 5.0 , tf.ACC = 30 , tf.CRTrate = 1.0 , tf.comb=1"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
くぬぎの[emb exp="f.Cards[f.Selected[tf.atk]]['name']"][Calc_HitRate]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[Calc_Damage]
[eval exp="tf.E_DEXd1 = tf.E_DEXd1 - 0.25"][eval exp="tf.E_DEXd1=0" cond="tf.E_DEXd1 < 0"]
;[SelectedCardSplice]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[enemyname]の命中が低下[p]
[jump target="*カードの実行"]
[s]

*P_attack_Type5
;金的
[Calc_Status]
[eval exp="tf.RATE = 8.0 , tf.ACC = 15 , tf.CRTrate = 1.2 , tf.comb=0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
くぬぎの[emb exp="f.Cards[f.Selected[tf.atk]]['name']"][Calc_HitRate]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[Calc_Damage]
;[SelectedCardSplice]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>70"][eval exp="f.E_AUR = f.E_AUR - 10"][eval exp="f.E_AUR=0" cond="f.E_AUR < 0"]
敵の気力が減少した[p]
[endif]
[jump target="*カードの実行"]
[s]

*P_attack_Type6
;回し蹴り
[Calc_Status]
[eval exp="tf.RATE = 8.0 , tf.ACC = 15 , tf.CRTrate = 1.5 , tf.comb=0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
くぬぎの[emb exp="f.Cards[f.Selected[tf.atk]]['name']"][Calc_HitRate]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[Calc_Damage]
;[SelectedCardSplice]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[jump target="*カードの実行"]
[s]

*P_attack_Type7
;飛び蹴り
[Calc_Status]
[eval exp="tf.RATE = 8.0 , tf.ACC = 15 , tf.CRTrate = 1.0 , tf.comb=0"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.P_DEX * tf.ArousDEXd * 3 - tf.E_AGI)"]
くぬぎの[emb exp="f.Cards[f.Selected[tf.atk]]['name']"][Calc_HitRate]
[call target="*E_Def_select"]
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]
[Calc_Damage]
;[SelectedCardSplice]
[quake count=5 time=300 hmax=20]
[if exp="tf.CRT>1"]会心の一撃[r][endif]
[enemyname]に[emb exp="tf.Damage"]のダメージ[p]
[triage]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>80"][eval exp="tf.E_ACT = tf.E_ACT - 1"][eval exp="tf.E_ACT=0" cond="tf.E_ACT < 0"]
敵の呼吸が減少した[p]
[endif]
[jump target="*カードの実行"]
[s]

*P_attack_miss
スカ！[p]
くぬぎの攻撃は当たらなかった[p]
;[SelectedCardSplice]
[jump target="*カードの実行"]
[s]

*E_avoid_success
回避！[p]
[enemyname]は攻撃を回避した[p]
;[SelectedCardSplice]
[jump target="*カードの実行"]
[s]

*攻撃終了
攻撃終了[p]
;カードバフ解除
[eval exp="tf.P_Cardb1 = 1.0"]
;敵の行動回数
[eval exp="tf.loop = 0"]

*E_phase_start
;[show_status]
[WriteStatus]
;[jump target="*ikigire" cond="tf.P_ACT <= 0"]
[enemyname]の攻撃[p]

;敵の攻撃パターン(５つのパターンから抽選)
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;攻撃パターン選定
[if exp="tf.dice >= 80"]
[eval exp="tf.E_Attack_A=tf.E_Attack11 , tf.E_Attack_B=tf.E_Attack12 , tf.E_Attack_C=tf.E_Attack13 , tf.E_Attack_D=tf.E_Attack14 , tf.E_Attack_E=tf.E_Attack15"]
[elsif exp="tf.dice >= 60"]
[eval exp="tf.E_Attack_A=tf.E_Attack21 , tf.E_Attack_B=tf.E_Attack22 , tf.E_Attack_C=tf.E_Attack23 , tf.E_Attack_D=tf.E_Attack24 , tf.E_Attack_E=tf.E_Attack25"]
[elsif exp="tf.dice >= 40"]
[eval exp="tf.E_Attack_A=tf.E_Attack31 , tf.E_Attack_B=tf.E_Attack32 , tf.E_Attack_C=tf.E_Attack33 , tf.E_Attack_D=tf.E_Attack34 , tf.E_Attack_E=tf.E_Attack35"]
[elsif exp="tf.dice >= 20"]
[eval exp="tf.E_Attack_A=tf.E_Attack41 , tf.E_Attack_B=tf.E_Attack42 , tf.E_Attack_C=tf.E_Attack43 , tf.E_Attack_D=tf.E_Attack44 , tf.E_Attack_E=tf.E_Attack45"]
[else exp="tf.dice >= 0"]
[eval exp="tf.E_Attack_A=tf.E_Attack51 , tf.E_Attack_B=tf.E_Attack52 , tf.E_Attack_C=tf.E_Attack53 , tf.E_Attack_D=tf.E_Attack54 , tf.E_Attack_E=tf.E_Attack55"]
[endif]
[jump target="*E_Attack_select"]
[s]

*E_Attack_select
[WriteStatus]
;チャージ完了ならば必殺技を必ず使う
[if exp="f.E_AUR>=50 && tf.dice>0"]
[jump target="*E_必殺攻撃"]
[endif]

[eval exp="tf.loop = tf.loop + 1"]
[jump target="&tf.E_Attack_A" cond="tf.loop==1"]
[jump target="&tf.E_Attack_B" cond="tf.loop==2" ]
[jump target="&tf.E_Attack_C" cond="tf.loop==3" ]
[jump target="&tf.E_Attack_D" cond="tf.loop==4" ]
[jump target="&tf.E_Attack_E" cond="tf.loop==5" ]
[eval exp="tf.Max=4 , tf.Min=0"][dice]
[jump target="*E_Attack_select" cond="tf.loop=tf.dice" ]
[s]

*E_特殊攻撃1
[jump storage="skilllist.ks" target="&tf.E_特殊攻撃1"]
[s]

*E_特殊攻撃2
[jump storage="skilllist.ks" target="&tf.E_特殊攻撃2"]
[s]

*E_通常攻撃1
[eval exp="tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.RATE = tf.E_通常攻撃1_rate , tf.ACC = tf.E_通常攻撃1_acc , tf.CRT = tf.E_通常攻撃1_crt , tf.E_ATK = tf.E_通常攻撃1"]
[enemyname]の通常攻撃1[r]
[Calc_Status]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[s]

*E_通常攻撃2
[eval exp="tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.RATE = tf.E_通常攻撃2_rate , tf.ACC = tf.E_通常攻撃2_acc , tf.CRT = tf.E_通常攻撃2_crt , tf.E_ATK = tf.E_通常攻撃2"]
[enemyname]の通常攻撃2[r]
[Calc_Status]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[s]

*E_組付攻撃
[eval exp="tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.RATE = tf.E_組付攻撃_rate , tf.ACC = tf.E_組付攻撃_acc , tf.CRT = tf.E_組付攻撃_crt , tf.E_ATK = tf.E_組付攻撃"]
[enemyname]の組付[r]
[Calc_Status]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[s]

*E_必殺攻撃
[eval exp="tf.E_ACT=tf.E_ACT-1"]
[eval exp="tf.RATE = tf.E_必殺攻撃_rate , tf.ACC = tf.E_必殺攻撃_acc , tf.CRT = tf.E_必殺攻撃_crt , tf.E_ATK = tf.E_必殺攻撃"]
[enemyname]の必殺技[r]
[Calc_Status]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[s]

*P_Def_select
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="回避"  target="*P_DEF_conf1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="防御"  target="*P_DEF_conf2"  ]
[s]

*P_DEF_conf1
[Calc_Status]
[eval exp="tf.P_AVD=Math.floor(tf.P_AGI * tf.ArousAGId * 3) , tf.P_GRD=0"]
[eval exp="tf.AvoidRate = 100 - Math.floor(tf.HitRate/10 * (100 - tf.P_AVD)/10)"][limit]
回避率[emb exp="tf.AvoidRate"]%[p]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="回避"  target="*P_DEF_1" ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_Def_select"  ]
[s]

*P_DEF_conf2
[eval exp="tf.P_AVD=0 , tf.P_GRD=1.5"]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="170"  text="防御"  target="*P_DEF_2"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="160"  y="240"  text="戻る"  target="*P_Def_select"  ]
[s]

*P_DEF_1
;回避
[eval exp="tf.P_ACT=tf.P_ACT-1"]
[WriteStatus]
[jump storage="skilllist.ks" target="&tf.E_ATK"][s]

*P_DEF_2
;防御
[eval exp="tf.P_ACT=tf.P_ACT-0"]
[WriteStatus]
[jump storage="skilllist.ks" target="&tf.E_ATK"][s]

*E_attack_miss
スカ！[p]
[enemyname]の攻撃は当たらなかった[p]
[jump target="*E_phase_end"]
[s]

*P_avoid_success
回避![p]
くぬぎは攻撃を回避した[p]
[jump target="*E_phase_end"]
[s]

*P_Barrier
#くぬぎ
甘い！！空蝉の術！！[p]
#
くぬぎは服を身代わりにして攻撃を躱した[p]
[eval exp="tf.P_Barrier=0"]
[if exp="tf.P_DRESS > 1"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
くぬぎは下着姿になった[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]
[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
くぬぎは一糸まとわぬ姿になった[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[jump target="*E_phase_end"]
[s]

*ikigire
くぬぎは息切れした[p]
#敵
隙あり！[p]
#くぬぎ
しまった！[p]
[quake count=5 time=300 hmax=20]
くぬぎは[enemyname]に抑え込まれた[p]
[jump target="*mount_start"]
[s]

*mount_start
[Calc_Status]
[eval exp="tf.P_Cardb1 = 1"]
[eval exp="tf.mount_turn=0 , tf.Esc=0"][limit]
[eval exp="tf.Mount = 50 + Math.floor(tf.E_BND - tf.P_STR * tf.ArousSTRd) * 5"]

*P_mount_phase
[eval exp="tf.mount_turn = tf.mount_turn + 1"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
拘束[emb exp="tf.mount_turn"]ターン目[r]
[WriteStatus]
;拘束力[emb exp="tf.Mount"][p]

[if exp="tf.Orga==4 && tf.dice>49"]
くぬぎは絶頂の衝撃で動けない(行動不能)[p]
[eval exp="tf.OrgaStan = 1"]
[eval exp="tf.Orga = tf.Orga-1"]
[jump target="*E_mount_select"]

[elsif exp="tf.Orga>0"]
くぬぎは絶頂の余韻から抜け出せない(呼吸-1)[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.Orga = tf.Orga-1 , tf.P_ACT = tf.P_ACT-1"]
[WriteStatus]

[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaStan = 0"]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1 , tf.Arousal = 1"]
[endif]

[if exp="tf.Arousal == 1"]
くぬぎの興奮が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =0 , tf.ArousPOWb =0 ,tf.ArousSEXd =1"]
[endif]

;[show_status]
[WriteStatus]
[jump target="*P_mount_select"]
[s]

*P_mount_select
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="100"  text="暴れる　：拘束に腕力で抵抗します"  target="*P_mount_option1"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="170"  text="耐える　：呼吸を回復し、快感を軽減"  target="*P_mount_option2"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="240"  text="色仕掛け：拘束に色気で抵抗します"  target="*P_mount_option3"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="310"  text="空蝉の術：気力と衣装を消費して脱出"  target="*P_mount_option4"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="360"  width="400"  y="380"  text="降参する：敵の欲情次第で房中に移行"  target="*P_mount_option5"  ]
[s]

*P_mount_option1
[if exp="tf.P_ACT < 1"]
呼吸が足りない！[p]
[jump target="*P_mount_select"]
[endif]

くぬぎは暴れた[p]
[Calc_Status]
[quake count=5 time=300 hmax=20]
[eval exp="tf.Resist = Math.floor(tf.P_STR * tf.ArousSTRd)"]
[eval exp="tf.Max=tf.Resist , tf.Min=0"][dice]
[if exp="tf.Mount < tf.dice"]
くぬぎは拘束を振りほどいた[p]
[eval exp="tf.Esc=1"]
[jump target="*mount_end"]

[else]
しかし、拘束を振りほどくことはできなかった[p]
[eval exp="tf.Mount = tf.Mount - tf.Resist"]
[jump target="*E_mount_select"]
[endif]
[s]

*P_mount_option2
くぬぎは息を整えた[p]
このターンのくぬぎは快感への抵抗力が上昇[p]
[eval exp="tf.P_ACT = tf.P_ACT + 1 , tf.P_DefSKBb1 = 0.5"][limit]
[jump target="*E_mount_select"]
[s]

*P_mount_option3
[if exp="tf.P_ACT < 1"]
呼吸が足りない！[p]
[jump target="*P_mount_select"]
[endif]

くぬぎは自ら身体を[enemyname]に押し付けた[p]
[Calc_Status]
;感情は確定で上昇、上昇幅は抵抗値次第
[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP) * 3 * (100 - tf.E_SAN)/100 * (tf.E_ERO + 100)/100) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
[enemyname]の欲情が[emb exp="tf.HDamage"]上昇した[p]

;デバフは抵抗判定、魅力VS理性と感情
[eval exp="tf.TAG = tf.E_SAN - tf.E_ERO"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

[if exp="tf.TAG < tf.dice"]
柔らかな感触に[enemyname]は大きく動揺した[p]
[eval exp="tf.Mount = tf.Mount - (tf.P_APP + tf.ArousAPPb)"]
[else]
柔らかな感触に[enemyname]は動揺した[p]
[eval exp="tf.Mount = tf.Mount - (tf.P_APP + tf.ArousAPPb)/2"]
[endif]

[if exp="tf.Mount <= 0"]
#くぬぎ
隙あり！！[p]
くぬぎは[enemyname]の拘束から抜け出した[p]
[eval exp="tf.Esc=1"]
[jump target="*mount_end"]
[endif]

[jump target="*E_mount_select"]
[s]

*P_mount_option4
[if exp="tf.P_ACT < 1"]
呼吸が足りない！[p]
[jump target="*P_mount_select"]
[endif]
準備中です[p]
[jump target="*P_mount_phase"]
[s]

*P_mount_option5
[GoSKB]
[if exp="tf.GoSKB == 1"]
#敵
・・・よかろう[p]
[jump target="*bochu"]
[endif]
#敵
たわけ！！そんな見え透いた嘘に引っかかるか！！[p]
[jump target="P_phase_start"]
[s]

*E_mount_select
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice> 79"][jump target="*E_mount_option1"]
[elsif exp="tf.dice> 59"][jump target="*E_mount_option2"]
[endif]

[Calc_Status]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[eval exp="tf.SKB=(50 + tf.E_SAN) - Math.floor(tf.E_ERO + (tf.P_APP + tf.ArousAPPb - tf.E_APP)*5)"]
[if exp="tf.dice> tf.SKB"][jump target="*E_mount_option0"]
[endif]

[jump target="*E_mount_select"]
[s]

*E_mount_option0
;セクハラ
[Calc_Status]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice> 66 && tf.P_DRESS>0"][jump target="*E_mount_datui"]
[endif]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice> 49"][jump target="*E_mount_sukebe1"]
[else][jump target="*E_mount_sukebe2"]
[endif]

*E_mount_datui
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

[jump target="*mount_end"]
[s]

*E_mount_sukebe1
[enemyname]はくぬぎの胸を揉みしだいた[p]
[if exp="f.P_BOOB==1"]
#くぬぎ
いやあっ！！[p]
揉みしだかれたくぬぎの乳房から母乳が迸った[p]
#
[elsif exp="f.P_BOOB==2"]
#くぬぎ
いやあっ！！[p]
揉みしだかれたくぬぎの乳房から母乳が迸った[p]
#
[endif]
[eval exp="tf.RATE=2 + (f.P_BOOB*2) , tf.P_SEN = f.P_SEN_BB"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][WriteStatus][jump target="*Orga_end" cond="f.Insanity>0"]
[jump target="*mount_end"]
[s]

*E_mount_sukebe2
[enemyname]はくぬぎの秘処をまさぐった[p]
[eval exp="tf.RATE=3 , tf.P_SEN = f.P_SEN_VG"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][WriteStatus][jump target="*Orga_end" cond="f.Insanity>0"]
[jump target="*mount_end"]
[s]

*E_mount_option1
[enemyname]はくぬぎを締め上げた[p]
[quake count=3 time=300 hmax=30]
くぬぎの呼吸が１減少[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1"][limit]
[WriteStatus]
[if exp="tf.P_ACT == 0"][jump target="*Remount"][endif]
[jump target="*mount_end"]
[s]

*E_mount_option2
[enemyname]はくぬぎを締め上げた[p]
[quake count=5 time=300 hmax=20]
[Calc_Status]
[eval exp="tf.Damage=Math.floor(tf.E_STR * tf.E_charm_STR) * 3"]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit]
[triage]
[MAZO][Orgasm][SANcheck][WriteStatus][jump target="*Orga_end" cond="f.Insanity>0"]
[jump target="*mount_end"]
[s]

*Remount
くぬぎは息切れした[p]
#敵
苦しそうだなフハハハ[p]
#
敵はくぬぎを拘束し直した[p]
[Calc_Status]
[eval exp="tf.Mount = tf.Mount + tf.E_BND * tf.E_charm_STR"]
[jump target="*mount_end"]
[s]

*mount_continue
くぬぎは拘束されている！[p]
[jump target="*P_mount_phase"]
[s]

*mount_end
;疲労処理
[eval exp="tf.Damage = Math.floor(tf.mount_turn / 3) + 1 , f.P_EXH = f.P_EXH + 1"]
くぬぎの疲労度が1上昇した[p][triage]
;火傷ダメージ
[SCALD]
;セクハラ抵抗力をリセット
[eval exp="tf.P_DefSKBb1=1"]
;拘束継続
[WriteStatus]
[if exp="tf.Esc != 1"]
[jump target="*mount_continue"]
[endif]
[jump target="*E_phase_end"]
[s]

*E_phase_end
;火傷ダメージ
[SCALD]
[eval exp="tf.Max=9 , tf.Min=0"][dice]
[if exp="tf.E_ACT>1"]
;[jump target="*ikigire" cond="tf.P_ACT <= 0"]
[jump target="*E_Attack_select"]
[elsif exp="tf.E_ACT==1 && tf.dice>4"]
[eval exp="f.E_AUR = f.E_AUR + 10"]
[jump target="*turn_end"]
[else]
[jump target="*turn_end"]
[endif]
[s]

*turn_end
ターン終了
;[show_status]
[WriteStatus]
[if exp="f.P_PARASITE > 0"][eval exp="tf.damage = 3 * f.P_PARASITE"]
くぬぎの膣内で蟲が淫毒を吐いた[p]
「んっ！」[p]
この戦闘中のくぬぎの欲情度が[emb exp="tf.damage"]上昇[p]
[eval exp="tf.P_ERO = tf.P_ERO + tf.damage"]
[eval exp="f.P_PARASITE_count = f.P_PARASITE_count + 1"][limit]
[endif]

[eval exp="f.P_AUR = f.P_AUR + tf.P_ACT * 10"][eval exp="f.P_AUR=100" cond="f.P_AUR>100"]
[eval exp="f.E_AUR = f.E_AUR + 10"]
[eval exp="tf.P_ACT = tf.P_ACTmax , tf.E_ACT = f.E_ACT , tf.Set = 0"]
[Initialize_1Tbuff][Refresh_3Tbuff]
;デバフと状態異常の回復
[eval exp="tf.E_DURd1=1 , tf.E_AGId1=1 , tf.E_DEXd1=1"]
[eval exp="tf.P_DURd1=1 , tf.P_AGId1=1 , tf.P_DEXd1=1"]

*再構築
;ターン終了処理１（山札がある場合）
[iscript]
tf.length = f.Deck.length;
[endscript]
[eval exp="f.Cards[f.Hand[0]]['active']=1"]
[eval exp="f.Cards[f.Hand[1]]['active']=1"]
[eval exp="f.Cards[f.Hand[2]]['active']=1"]
[eval exp="f.Cards[f.Hand[3]]['active']=1"]
[eval exp="f.Cards[f.Hand[4]]['active']=1" cond="tf.P_ACTmax>=5"]
[eval exp="f.Cards[f.Hand[5]]['active']=1" cond="tf.P_ACTmax>=6"]
[eval exp="f.Cards[f.Hand[6]]['active']=1" cond="tf.P_ACTmax>=7"]
[eval exp="f.Selected=[] , f.SkillSet=[]"]
[if exp="tf.length < tf.P_ACTmax"][jump target="*山札再構築"]
[elsif exp="tf.length < 1"][jump target="*山札再構築"]
[else][jump target="*turn_start"][endif]
[s]

*山札再構築
;ターン終了処理２（山札がなくなった場合）リシャッフル
[iscript]
for(var i = f.Cemetery.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Cemetery[i];
    f.Cemetery[i] = f.Cemetery[r];
    f.Cemetery[r] = tmp;
}
f.temp=[];
f.temp = f.Deck.concat(f.Cemetery);
f.Deck = f.temp;
f.Cemetery=[];
[endscript]
;山札：[emb exp="f.Deck"][r]
[jump target="*turn_start"]
[s]


*game_lose
[WriteStatus]
[if exp="f.P_EXH >= 100"]
疲労のためにくぬぎは立ち上がれなくなった[p]
[endif]
くぬぎは敗北した。[p]
[GoSKB]
[if exp="tf.GoSKB == 1"]
#敵
ぐふふふふ！さぁて楽しませてもらおうか！！[p]
#くぬぎ
きゃあ！！[p]
#
[enemyname]は下卑た笑みを浮かべくぬぎに手を伸ばしてきた。[p]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump target="*bochu"]
[endif]
#敵
おらっ！！大人しくしな！！[p]
#くぬぎ
くふっ！！[p]
「金燎様が生け捕りにしろと言っていたのはこの女だよな」[p]
「仕方ねぇ、屋敷まで運ぶか・・・」[p]
意識を失ったくぬぎを敵は抱えあげるとその場から立ち去った[p]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump storage="prison.ks" target="*start"]
[s]

*game_win
[WriteStatus]
[chara_hide name="gouza"]
戦闘に勝利した。[p]
[if exp="tf.Orga>0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0"][eval exp="tf.Arousal = 1"]
[endif]
[if exp="tf.Arousal == 1"]
くぬぎの興奮が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =1 , tf.ArousAGId =1 , tf.ArousDEXd =1 , tf.ArousAPPb =0 , tf.ArousPOWb =0 , tf.ArousSEXd =1"]
[endif]
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO , f.P_SAN = tf.P_SAN"]
[eval exp="tf.Temp = tf.Turn * 3 , f.P_EXH = f.P_EXH + tf.Temp"][limit]
[eval exp="f.P_EXH = 99" cond="f.P_EXH >= 100"]
疲労度が[emb exp="tf.Temp"]上昇した[p]
[WriteStatus]
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
[WriteStatus]
[jump target="*bochu"]
[s]

*bochu
[eval exp="f.P_HP = tf.P_HP ,f.P_ERO = tf.P_ERO , f.P_SAN = tf.P_SAN"][limit]
[WriteStatus]
[chara_hide name="kunugi"][chara_hide name="gouza"]
[jump storage="bochu.ks" target="*start"]
[s]
