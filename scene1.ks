*start
[cm ]
[clearfix]
[start_keyconfig]
[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=20 top=400 width=920 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true
;このゲームで登場するキャラクターを宣言
[chara_new  name="kunugi" storage="chara/kunugi/battle_stand.png" jname="くぬぎ"  ]
;キャラクターの表情登録
[chara_face name="kunugi" face="seminude" storage="chara/kunugi/battle_stand_seminude.png"]
[chara_mod name="kunugi" face="default"]


[iscript]
f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
f.Cards=[
{id:0,name:"忍術",class:"水",comb:1,active:1,txt:"水・忍　術　"},
{id:1,name:"忍術",class:"風",comb:1,active:1,txt:"風・忍　術　"},
{id:2,name:"忍術",class:"炎",comb:1,active:1,txt:"炎・忍　術　"},
{id:3,name:"拳",class:"水",comb:1,active:1,txt:"水・拳　　　"},
{id:4,name:"拳",class:"風",comb:1,active:1,txt:"風・拳　　　"},
{id:5,name:"拳",class:"炎",comb:1,active:1,txt:"岩・拳　　　"},
{id:6,name:"下段蹴り",class:"水",comb:1,active:1,txt:"水・下段蹴り"},
{id:7,name:"下段蹴り",class:"風",comb:1,active:1,txt:"風・下段蹴り"},
{id:8,name:"下段蹴り",class:"炎",comb:1,active:1,txt:"炎・下段蹴り"},
{id:9,name:"上段蹴り",class:"水",comb:1,active:1,txt:"水・上段蹴り"},
{id:10,name:"上段蹴り",class:"風",comb:1,active:1,txt:"風・上段蹴り"},
{id:11,name:"上段蹴り",class:"炎",comb:1,active:1,txt:"炎・上段蹴り"},

{id:12,name:"くない",class:"水",comb:0,active:1,txt:"水・くない　"},
{id:13,name:"くない",class:"風",comb:0,active:1,txt:"風・くない　"},
{id:14,name:"くない",class:"炎",comb:0,active:1,txt:"炎・くない　"},
{id:15,name:"回し蹴り",class:"水",comb:0,active:1,txt:"水・回し蹴り"},
{id:16,name:"回し蹴り",class:"風",comb:0,active:1,txt:"風・回し蹴り"},
{id:17,name:"回し蹴り",class:"炎",comb:0,active:1,txt:"炎・回し蹴り"},
{id:18,name:"飛び蹴り",class:"水",comb:0,active:1,txt:"水・飛び蹴り"},
{id:19,name:"飛び蹴り",class:"風",comb:0,active:1,txt:"風・飛び蹴り"},
{id:20,name:"飛び蹴り",class:"炎",comb:0,active:1,txt:"炎・飛び蹴り"}
];
[endscript]

*シャッフルスタート
[eval exp="tf.set=0 , tf.P_ACTmax=6 , f.Selected=[] ,f.Cemetery=[]"]
[iscript]
for(var i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]

*手札構築
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5],f.Deck[6]]" cond="tf.P_ACTmax>=7"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5]]" cond="tf.P_ACTmax==6"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]" cond="tf.P_ACTmax==5"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3]]" cond="tf.P_ACTmax==4"]

*手札選択
[glink color="blue" size="20" x="260" width="150" y="100" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Answer=f.Cards[f.Hand[0]]['id'],f.Cards[f.Hand[0]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[0]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="170" text="&f.Cards[f.Hand[1]]['txt']" exp="tf.Answer=f.Cards[f.Hand[1]]['id'],f.Cards[f.Hand[1]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[1]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="240" text="&f.Cards[f.Hand[2]]['txt']" exp="tf.Answer=f.Cards[f.Hand[2]]['id'],f.Cards[f.Hand[2]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[2]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="310" text="&f.Cards[f.Hand[3]]['txt']" exp="tf.Answer=f.Cards[f.Hand[3]]['id'],f.Cards[f.Hand[3]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[3]]['active']==1"]
[if exp="tf.P_ACTmax>=5"]
[glink color="blue" size="20" x="560" width="150" y="100" text="&f.Cards[f.Hand[4]]['txt']" exp="tf.Answer=f.Cards[f.Hand[4]]['id'],f.Cards[f.Hand[4]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[4]]['active']==1"][endif]
[if exp="tf.P_ACTmax>=6"]
[glink color="blue" size="20" x="560" width="150" y="170" text="&f.Cards[f.Hand[5]]['txt']" exp="tf.Answer=f.Cards[f.Hand[5]]['id'],f.Cards[f.Hand[5]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[5]]['active']==1"][endif]
[if exp="tf.P_ACTmax>=7"]
[glink color="blue" size="20" x="560" width="150" y="240" text="&f.Cards[f.Hand[6]]['txt']" exp="tf.Answer=f.Cards[f.Hand[6]]['id'],f.Cards[f.Hand[6]]['active']=0" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[6]]['active']==1"][endif]
[glink color="blue" size="20" x="560" width="150" y="310" text="戻る" exp="" target="*リセット" ]
[s]

*リセット
[iscript]
f.Cards[f.Hand[0]]['active']=1;
f.Cards[f.Hand[1]]['active']=1;
f.Cards[f.Hand[2]]['active']=1;
f.Cards[f.Hand[3]]['active']=1;
f.Cards[f.Hand[4]]['active']=1;
f.Cards[f.Hand[5]]['active']=1;
f.Cards[f.Hand[6]]['active']=1;
[endscript]
[jump target="*手札選択"]
[s]

*場札追加
[iscript]
f.Selected.push(f.Cards[tf.Answer]['id']);
[endscript]
選択済：[emb exp="f.Selected"][r]
[if exp="f.Cards[tf.Answer]['comb'] == 1"][jump target="*再選択"]
[else][jump target="*選択終了"][endif]
[s]

*再選択
[jump target="*手札選択"]
[s]

*選択終了
[iscript]
f.temp=[];
f.temp = f.Cemetery.concat(f.Hand);
f.Cemetery = f.temp;
f.Deck.splice(0,tf.P_ACTmax);
tf.length = f.Deck.length;
[endscript]
残山札：[emb exp="f.Deck"][r]
墓地：[emb exp="f.Cemetery"][p]
[iscript]
tf.ACT = 0;
for(i=0 ; i<tf.P_ACTmax ; i++){
    tf.ACT = tf.ACT + f.Cards[f.Hand[i]]['active'];
}
[endscript]
残呼吸：[emb exp="tf.ACT"]
[eval exp="tf.dice=3"]

*防御選択
[glink color="red" size="20" x="260" width="150" y="100" text="防御" target="*再判定" ]
[glink color="red" size="20" x="260" width="150" y="170" text="回避" exp="tf.ACT = tf.ACT-1" target="*再判定" cond="tf.ACT>0"]
[s]

*再判定
残呼吸：[emb exp="tf.ACT"]
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
[eval exp="f.Cards[f.Hand[4]]['active']=1" cond="tf.P_ACTmax>=5"]
[eval exp="f.Cards[f.Hand[5]]['active']=1" cond="tf.P_ACTmax>=6"]
[eval exp="f.Cards[f.Hand[6]]['active']=1" cond="tf.P_ACTmax>=7"]

[if exp="tf.length < tf.P_ACTmax"][jump target="*山札再構築"]
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


*route_select
ルートを選びます[p]
[link target="*easy"]かんたん[endlink][r]
[link target="*normal"]ふつう[endlink][r]
[link target="*hard"]むずかしい[endlink][r]
[s]

*easy
[cm]
[link target="*easy-1"]1:遅延タイプ[endlink]　　
[link target="*easy-2"]2:削りタイプ[endlink]　　[r]
[link target="*easy-3"]3:特殊削りタイプ[endlink]　　
[link target="*easy-4"]４:拘束タイプ[endlink]　　[r]
[link target="*easy-5"]5:セクハラタイプ[endlink]　　
[link target="*easy-6"]6:一発屋タイプ[endlink]
[s]

*easy-1
[eval exp="tf.E_name='遅延魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]
@jump storage="battle.ks"

*easy-2
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]

@jump storage="battle.ks"

*easy-3
[eval exp="tf.E_name='特殊魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]

@jump storage="battle.ks"

*easy-4
[eval exp="tf.E_name='拘束魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 38"]

@jump storage="battle.ks"

*easy-5
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]

@jump storage="battle.ks"

*easy-6
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"


*normal
[cm]
[link target="*normal-1"]1:遅延タイプ[endlink]
[link target="*normal-2"]2:削りタイプ[endlink]
[link target="*normal-3"]3:特殊削りタイプ[endlink]
[link target="*normal-4"]４:拘束タイプ[endlink]
[link target="*normal-5"]5:セクハラタイプ[endlink]
[link target="*normal-6"]6:一発屋タイプ[endlink]
[s]

*normal-1
@jump storage="battle.ks"

*normal-2
@jump storage="battle.ks"

*normal-3
@jump storage="battle.ks"

*normal-4
@jump storage="battle.ks"

*normal-5
@jump storage="battle.ks"

*normal-6
@jump storage="battle.ks"



*hard
[cm]
[link target="*hard-1"]1:遅延タイプ[endlink]
[link target="*hard-2"]2:削りタイプ[endlink][r]
[link target="*hard-3"]3:特殊削りタイプ[endlink]
[link target="*hard-4"]４:拘束タイプ[endlink][r]
[link target="*hard-5"]5:セクハラタイプ[endlink]
[link target="*hard-6"]6:一発屋タイプ[endlink]
[link target="*hard-7"]7:無敵マン[endlink]
[s]

*hard-1
[eval exp="tf.E_name='遅延魔'"]
[eval exp="f.E_HP=2000 , f.E_STR=25 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
@jump storage="battle.ks"


*hard-2
@jump storage="battle.ks"

*hard-3
@jump storage="battle.ks"

*hard-4
@jump storage="battle.ks"

*hard-5
@jump storage="battle.ks"

*hard-6
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=3000 , f.E_STR=40 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"

*hard-7
[eval exp="tf.E_name='魔人'"]
[eval exp="f.E_HP=5000 , f.E_STR=40 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"
