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


*シャッフルスタート
[eval exp="tf.set=0 , tf.P_ACT=7 , f.Cemetery=[]"]
[eval exp="f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]"]
[iscript]
for(var i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]
*セレクト
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5],f.Deck[6]]"]
手札:[emb exp="f.Hand"][r]
[iscript]
f.temp=[];
f.temp = f.Cemetery.concat(f.Hand);
f.Cemetery = f.temp;
f.Deck.splice(0,tf.P_ACT);
tf.length = f.Deck.length;
[endscript]
残山札：[emb exp="f.Deck"][r]
墓地：[emb exp="f.Cemetery"][p]
[if exp="tf.length < tf.P_ACT"][jump target="*リシャッフル"]
[else][jump target="*セレクト"][endif]
[s]
*リシャッフル
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
[jump target="*セレクト"]
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
