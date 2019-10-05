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
[eval exp="f.E_HP=1000 , f.E_STR=25 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18"]
@jump storage="battle.ks"

*easy-2
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=22 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18"]

@jump storage="battle.ks"

*easy-3
[eval exp="tf.E_name='特殊魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=22 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18"]

@jump storage="battle.ks"

*easy-4
[eval exp="tf.E_name='拘束魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=22 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18"]

@jump storage="battle.ks"

*easy-5
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=22 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18"]

@jump storage="battle.ks"

*easy-6
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18"]

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
[link target="*hard-2"]2:削りタイプ[endlink]
[link target="*hard-3"]3:特殊削りタイプ[endlink]
[link target="*hard-4"]４:拘束タイプ[endlink]
[link target="*hard-5"]5:セクハラタイプ[endlink]
[link target="*hard-6"]6:一発屋タイプ[endlink]
[s]

*hard-1
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
@jump storage="battle.ks"
