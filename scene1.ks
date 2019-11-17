*start
[cm ]
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

[chara_config pos_mode="false"]

;このゲームで登場するキャラクターを宣言
[chara_new  name="kunugi" storage="chara/kunugi/battle_stand.png" jname="くぬぎ"  ]
;キャラクターの表情登録
[chara_face name="kunugi" face="seminude" storage="chara/kunugi/battle_stand_seminude.png"]
[chara_face name="kunugi" face="nude" storage="chara/kunugi/battle_stand_nude.png"]
[chara_mod name="kunugi" face="default"]




[iscript]
f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
f.Cards=[
{id:0,type:1,name:"忍術",suite:"水",comb:1,active:1,txt:"水・忍　術　"},
{id:1,type:1,name:"忍術",suite:"風",comb:1,active:1,txt:"風・忍　術　"},
{id:2,type:1,name:"忍術",suite:"炎",comb:1,active:1,txt:"炎・忍　術　"},
{id:3,type:2,name:"拳",suite:"水",comb:1,active:1,txt:"水・拳　　　"},
{id:4,type:2,name:"拳",suite:"風",comb:1,active:1,txt:"風・拳　　　"},
{id:5,type:2,name:"拳",suite:"炎",comb:1,active:1,txt:"岩・拳　　　"},
{id:6,type:3,name:"下段蹴り",suite:"水",comb:1,active:1,txt:"水・下段蹴り"},
{id:7,type:3,name:"下段蹴り",suite:"風",comb:1,active:1,txt:"風・下段蹴り"},
{id:8,type:3,name:"下段蹴り",suite:"炎",comb:1,active:1,txt:"炎・下段蹴り"},
{id:9,type:4,name:"上段蹴り",suite:"水",comb:1,active:1,txt:"水・上段蹴り"},
{id:10,type:4,name:"上段蹴り",suite:"風",comb:1,active:1,txt:"風・上段蹴り"},
{id:11,type:4,name:"上段蹴り",suite:"炎",comb:1,active:1,txt:"炎・上段蹴り"},

{id:12,type:5,name:"くない",suite:"水",comb:0,active:1,txt:"水・くない　"},
{id:13,type:5,name:"くない",suite:"風",comb:0,active:1,txt:"風・くない　"},
{id:14,type:5,name:"くない",suite:"炎",comb:0,active:1,txt:"炎・くない　"},
{id:15,type:6,name:"回し蹴り",suite:"水",comb:0,active:1,txt:"水・回し蹴り"},
{id:16,type:6,name:"回し蹴り",suite:"風",comb:0,active:1,txt:"風・回し蹴り"},
{id:17,type:6,name:"回し蹴り",suite:"炎",comb:0,active:1,txt:"炎・回し蹴り"},
{id:18,type:7,name:"飛び蹴り",suite:"水",comb:0,active:1,txt:"水・飛び蹴り"},
{id:19,type:7,name:"飛び蹴り",suite:"風",comb:0,active:1,txt:"風・飛び蹴り"},
{id:20,type:7,name:"飛び蹴り",suite:"炎",comb:0,active:1,txt:"炎・飛び蹴り"}
];
[endscript]

*シャッフルスタート
[eval exp="tf.set=0 , f.P_ACTmax=7 , tf.P_ACT=7 , f.Selected=[] ,f.Cemetery=[]"]
[iscript]
for(var i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]

*手札構築
[eval exp="tf.P_ACT = f.P_ACTmax"]
;並び替えたデッキ（山札）から手札に補充
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5],f.Deck[6]]" cond="f.P_ACTmax>=7"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5]]" cond="f.P_ACTmax==6"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]" cond="f.P_ACTmax==5"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3]]" cond="f.P_ACTmax==4"]

*手札選択
;今回の選択tf.Answerに選択した手札handのカードID（cardに紐づく絶対値）を登録、そのカードのactiveを０に
残呼吸：[emb exp="tf.P_ACT"]　選択済：[emb exp="f.Selected"][r]
[glink color="blue" size="20" x="260" width="150" y="100" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Answer=f.Cards[f.Hand[0]]['id'],f.Cards[f.Hand[0]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[0]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="170" text="&f.Cards[f.Hand[1]]['txt']" exp="tf.Answer=f.Cards[f.Hand[1]]['id'],f.Cards[f.Hand[1]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[1]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="240" text="&f.Cards[f.Hand[2]]['txt']" exp="tf.Answer=f.Cards[f.Hand[2]]['id'],f.Cards[f.Hand[2]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[2]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="310" text="&f.Cards[f.Hand[3]]['txt']" exp="tf.Answer=f.Cards[f.Hand[3]]['id'],f.Cards[f.Hand[3]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[3]]['active']==1"]
[if exp="f.P_ACTmax>=5"]
[glink color="blue" size="20" x="560" width="150" y="100" text="&f.Cards[f.Hand[4]]['txt']" exp="tf.Answer=f.Cards[f.Hand[4]]['id'],f.Cards[f.Hand[4]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[4]]['active']==1"][endif]
[if exp="f.P_ACTmax>=6"]
[glink color="blue" size="20" x="560" width="150" y="170" text="&f.Cards[f.Hand[5]]['txt']" exp="tf.Answer=f.Cards[f.Hand[5]]['id'],f.Cards[f.Hand[5]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[5]]['active']==1"][endif]
[if exp="f.P_ACTmax>=7"]
[glink color="blue" size="20" x="560" width="150" y="240" text="&f.Cards[f.Hand[6]]['txt']" exp="tf.Answer=f.Cards[f.Hand[6]]['id'],f.Cards[f.Hand[6]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[6]]['active']==1"][endif]
[glink color="blue" size="20" x="560" width="150" y="310" text="戻る" exp="" target="*リセット" ]
[s]

*リセット
;カードの選択済みステータスactiveをリセット,選択済みf.selectedを空に
[eval exp="tf.P_ACT = f.P_ACTmax"]
[iscript]
f.Cards[f.Hand[0]]['active']=1;
f.Cards[f.Hand[1]]['active']=1;
f.Cards[f.Hand[2]]['active']=1;
f.Cards[f.Hand[3]]['active']=1;
f.Cards[f.Hand[4]]['active']=1;
f.Cards[f.Hand[5]]['active']=1;
f.Cards[f.Hand[6]]['active']=1;
f.Selected=[];
[endscript]
[jump target="*手札選択"]
[s]

*場札追加
;今回の選択answerを選択済みに登録、継続フラグcomb=1なら再選択
[iscript]
f.Selected.push(tf.Answer);
[endscript]
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
f.Deck.splice(0,f.P_ACTmax);
tf.length = f.Deck.length;
[endscript]
選択済：[emb exp="f.Selected"][r]
残山札：[emb exp="f.Deck"][r]
墓地：[emb exp="f.Cemetery"][p]
;アクティベートされたカード枚数でACTを算出
;実際には行動実行時に減算するので不要
[eval exp="tf.dice=3"]

*カードの実行
;選択したカードを1枚目から実行する
;それぞれのカードのtypeを元に攻撃のconfにjump
;カード実行後は戦闘のカードを削除してここに戻す
;選択済みカードが無くなったら攻撃終了
残呼吸：[emb exp="tf.P_ACT"]　選択済：[emb exp="f.Selected"][p]
[iscript]
tf.Len=f.Selected.length;
[endscript]
[jump target="*攻撃終了" cond="tf.Len==0"]
[jump target="*type1" cond="f.Cards[f.Selected[0]]['type']==1"]
[jump target="*type2" cond="f.Cards[f.Selected[0]]['type']==2"]
[jump target="*type3" cond="f.Cards[f.Selected[0]]['type']==3"]
[jump target="*type4" cond="f.Cards[f.Selected[0]]['type']==4"]
[jump target="*type5" cond="f.Cards[f.Selected[0]]['type']==5"]
[jump target="*type6" cond="f.Cards[f.Selected[0]]['type']==6"]
[jump target="*type7" cond="f.Cards[f.Selected[0]]['type']==7"]
[s]

*type1
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type2
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type3
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type4
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type5
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type6
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type7
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*攻撃終了
攻撃終了[p]

*防御選択
[glink color="red" size="20" x="260" width="150" y="100" text="防御" target="*再判定" ]
[glink color="red" size="20" x="260" width="150" y="170" text="回避" exp="tf.P_ACT = tf.P_ACT-1" target="*再判定" cond="tf.P_ACT>0"]
[s]

*再判定
残呼吸：[emb exp="tf.P_ACT"]
[eval exp="tf.dice=tf.dice-1"]
[if exp="tf.dice>0"][jump target="*防御選択"][endif]

*再構築
[iscript]
tf.length = f.Deck.length;
[endscript]
[eval exp="f.Cards[f.Hand[0]]['active']=1"]
[eval exp="f.Cards[f.Hand[1]]['active']=1"]
[eval exp="f.Cards[f.Hand[2]]['active']=1"]
[eval exp="f.Cards[f.Hand[3]]['active']=1"]
[eval exp="f.Cards[f.Hand[4]]['active']=1" cond="f.P_ACTmax>=5"]
[eval exp="f.Cards[f.Hand[5]]['active']=1" cond="f.P_ACTmax>=6"]
[eval exp="f.Cards[f.Hand[6]]['active']=1" cond="f.P_ACTmax>=7"]

[if exp="tf.length < f.P_ACTmax"][jump target="*山札再構築"]
[elsif exp="tf.length < 1"][jump target="*山札再構築"]
[else][eval exp="f.Selected=[]"][jump target="*手札構築"][endif]
[s]

*山札再構築
リシャッフル[p]
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
山札：[emb exp="f.Deck"][r]
[jump target="*手札構築"]
[s]










*incubation
;蟲の孵化イベント
[if exp="f.P_PARASITE_count > 19"]
[chara_hide name="kunugi"][wt7]
[jump storage="incubation.ks" target="*start" cond="f.P_PARASITE_count == 20"]
[endif]

*route_select
ルートを選びます[p]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="かんたん"  target="*easy"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="ふつう"  target="*normal"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="むずかしい"  target="*hard"  ]
[s]

*easy
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:一撃タイプ"  target="*easy-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*easy-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:長期戦タイプ"  target="*easy-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:痴漢タイプ"  target="*easy-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="戻る"  target="*start"  ]
[s]

*easy-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30+5 , f.E_DUR=30-5 , f.E_AGI=23-5 , f.E_DEX=32-10 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28-5"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*捨て身'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*捨て身' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*捨て身'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付B' , tf.E_skill62='*気迫' , tf.E_skill63='*轟爆斧'"]
;攻撃
[eval exp="tf.E_attack_1='薙ぎ払い' , tf.E_ATK1_rate = 5.0 , tf.E_ATK1_acc = 30 , tf.E_ATK1_crt = 1 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.E_attack_2='大根斬り' , tf.E_ATK2_rate = 8.5 , tf.E_ATK2_acc = 0 , tf.E_ATK2_crt = 1 , tf.E_ATK='*E_attack_2'"]
@jump storage="battle.ks"

*easy-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30-5 , f.E_DUR=30-10 , f.E_AGI=23 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25-5"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*見切り'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付B' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
;攻撃
[eval exp="tf.E_attack_1='打ち払い' , tf.E_ATK1_rate = 5.0 , tf.E_ATK1_acc = 30 , tf.E_ATK1_crt = 1 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.E_attack_2='乱れ突き' , tf.E_ATK2_rate = 8.5 , tf.E_ATK2_acc = 0 , tf.E_ATK2_crt = 1 , tf.E_ATK='*E_attack_2'"]
@jump storage="battle.ks"

*easy-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='時間稼'"]
[eval exp="f.E_HP=2000 , f.E_STR=30-10 , f.E_DUR=30-5 , f.E_AGI=23-5 , f.E_DEX=32-8 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28-5"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*組付' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付B' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
[eval exp="tf.E_attack_1='正拳' , tf.E_ATK1_rate = 5.0 , tf.E_ATK1_acc = 30 , tf.E_ATK1_crt = 1 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.E_attack_2='飛び蹴り' , tf.E_ATK2_rate = 8.5 , tf.E_ATK2_acc = 0 , tf.E_ATK2_crt = 1 , tf.E_ATK='*E_attack_2'"]
@jump storage="battle.ks"

*easy-4
;セクハラ攻撃主体。筒子
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25+5 , f.E_AGI=24 , f.E_DEX=32-5 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35-5"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*視姦'"]
[eval exp="tf.E_skill21='*視姦' , tf.E_skill22='*挑発' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*挑発' , tf.E_skill32='*視姦' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*視姦' , tf.E_skill42='*組付' , tf.E_skill43='*挑発'"]
[eval exp="tf.E_skill51='*挑発' , tf.E_skill52='*視姦' , tf.E_skill53='*視姦'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*怪奇剣'"]
;攻撃
[eval exp="tf.E_attack_1='切りつけ' , tf.E_ATK1_rate = 5.0 , tf.E_ATK1_acc = 30 , tf.E_ATK1_crt = 1 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.E_attack_2='めった切り' , tf.E_ATK2_rate = 8.5 , tf.E_ATK2_acc = 0 , tf.E_ATK2_crt = 1 , tf.E_ATK='*E_attack_2'"]
@jump storage="battle.ks"

*normal
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:一撃タイプ"  target="*normal-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*normal-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:長期戦タイプ"  target="*normal-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:セクハラタイプ"  target="*normal-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:特殊タイプ"  target="*normal-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="戻る"  target="*start"  ]
[s]

*normal-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*捨て身'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*捨て身' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*捨て身'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*轟爆斧'"]
@jump storage="battle.ks"

*normal-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*見切り'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
@jump storage="battle.ks"

*normal-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='時間稼 2'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 32"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*組付' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
@jump storage="battle.ks"

*normal-4
;セクハラ。筒子
[eval exp="tf.E_name='痴漢魔2'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*視姦'"]
[eval exp="tf.E_skill21='*視姦' , tf.E_skill22='*奇声' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*奇声' , tf.E_skill32='*視姦' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*視姦' , tf.E_skill42='*組付' , tf.E_skill43='*奇声'"]
[eval exp="tf.E_skill51='*奇声' , tf.E_skill52='*視姦' , tf.E_skill53='*視姦'"]
;スキル2
[eval exp="tf.E_skill61='*強化組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*怪奇剣'"]
@jump storage="battle.ks"

*normal-5
;特殊。三元牌
[eval exp="tf.E_name='呪術者2'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*吸収' , tf.E_skill12='*煙幕' , tf.E_skill13='*毒霧'"]
[eval exp="tf.E_skill21='*挑発' , tf.E_skill22='*毒霧' , tf.E_skill23='*煙幕'"]
[eval exp="tf.E_skill31='*吸収' , tf.E_skill32='*挑発' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*挑発' , tf.E_skill42='*組付' , tf.E_skill43='*毒霧'"]
[eval exp="tf.E_skill51='*毒霧' , tf.E_skill52='*挑発' , tf.E_skill53='*毒霧'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*波動A'"]
@jump storage="battle.ks"

*hard
[cm]
[glink  color="blue"  size="20"  x="360"  width="400"  y="100"  text="1:遅延タイプ"  target="*hard-1"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="170"  text="2:削りタイプ"  target="*hard-2"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="240"  text="3:特殊削りタイプ"  target="*hard-3"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="310"  text="４:長期戦タイプ"  target="*hard-4"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="380"  text="5:セクハラタイプ"  target="*hard-5"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="450"  text="6:一発屋タイプ"  target="*hard-6"  ]
[glink  color="blue"  size="20"  x="360"  width="400"  y="520"  text="戻る"  target="*start"  ]
[s]

*hard-1
;高火力。一発。萬子
[eval exp="tf.E_name='大砲魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*捨て身'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*全力' , tf.E_skill32='*捨て身' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*捨て身'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*轟爆斧'"]
@jump storage="battle.ks"

*hard-2
;高命中。HPを削るのが役割。索子
[eval exp="tf.E_name='削り魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=22 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 25"]
;スキル1
[eval exp="tf.E_skill11='*集中' , tf.E_skill12='*集中' , tf.E_skill13='*見切り'"]
[eval exp="tf.E_skill21='*全力' , tf.E_skill22='*集中' , tf.E_skill23='*全力'"]
[eval exp="tf.E_skill31='*気合' , tf.E_skill32='*見切り' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*集中' , tf.E_skill42='*組付' , tf.E_skill43='*見切り'"]
[eval exp="tf.E_skill51='*全力' , tf.E_skill52='*集中' , tf.E_skill53='*気合'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*旋風棍'"]
@jump storage="battle.ks"

*hard-3
;高耐久。ターン数を稼ぐのが役割。風牌
[eval exp="tf.E_name='時間稼 3'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 32"]
;スキル1
[eval exp="tf.E_skill11='*剛体' , tf.E_skill12='*集中' , tf.E_skill13='*全力'"]
[eval exp="tf.E_skill21='*気合' , tf.E_skill22='*全力' , tf.E_skill23='*剛体'"]
[eval exp="tf.E_skill31='*剛体' , tf.E_skill32='*気合' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*剛体' , tf.E_skill42='*組付' , tf.E_skill43='*気合'"]
[eval exp="tf.E_skill51='*剛体' , tf.E_skill52='*集中' , tf.E_skill53='*全力'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*気迫' , tf.E_skill63='*青龍拳'"]
@jump storage="battle.ks"

*hard-4
;セクハラ。筒子
[eval exp="tf.E_name='痴漢魔3'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*気合' , tf.E_skill12='組付' , tf.E_skill13='*視姦'"]
[eval exp="tf.E_skill21='*視姦' , tf.E_skill22='*奇声' , tf.E_skill23='*気合'"]
[eval exp="tf.E_skill31='*奇声' , tf.E_skill32='*視姦' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*視姦' , tf.E_skill42='*組付' , tf.E_skill43='*奇声'"]
[eval exp="tf.E_skill51='*奇声' , tf.E_skill52='*視姦' , tf.E_skill53='*視姦'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*怪奇剣'"]
@jump storage="battle.ks"

*hard-5
;特殊。三元牌
[eval exp="tf.E_name='呪術者3'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
;スキル1
[eval exp="tf.E_skill11='*吸収' , tf.E_skill12='*煙幕' , tf.E_skill13='*毒霧'"]
[eval exp="tf.E_skill21='*挑発' , tf.E_skill22='*毒霧' , tf.E_skill23='*煙幕'"]
[eval exp="tf.E_skill31='*吸収' , tf.E_skill32='*挑発' , tf.E_skill33='*組付'"]
[eval exp="tf.E_skill41='*挑発' , tf.E_skill42='*組付' , tf.E_skill43='*毒霧'"]
[eval exp="tf.E_skill51='*毒霧' , tf.E_skill52='*挑発' , tf.E_skill53='*毒霧'"]
;スキル2
[eval exp="tf.E_skill61='*組付' , tf.E_skill62='*剥ぎ取り' , tf.E_skill63='*波動A'"]
@jump storage="battle.ks"
@jump storage="battle.ks"
