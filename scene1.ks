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

＜印ゲーム１[p]
[eval exp="f.array=['欲','煩','懊','悩','悦','愉','快','色','情','乱','姦','淫','絶','雌','雄','痴']"]
[eval exp="tf.Max=15 , tf.Min=0"][dice]
[eval exp="tf.Sample=f.array[tf.dice]"]
[l]
[iscript]
for(var i = f.array.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.array[i];
    f.array[i] = f.array[r];
    f.array[r] = tmp;
}
[endscript]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="200"  y="100"  text="&f.array[0]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="200"  y="170"  text="f.array[1]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="200"  y="240"  text="f.array[2]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="200"  y="310"  text="f.array[3]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]

[glink  color="blue"  storage="battle.ks"  size="20"  x="460"  width="200"  y="100"  text="f.array[4]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="460"  width="200"  y="170"  text="f.array[5]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="460"  width="200"  y="240"  text="f.array[6]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="460"  width="200"  y="310"  text="f.array[7]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]

[glink  color="blue"  storage="battle.ks"  size="20"  x="660"  width="200"  y="100"  text="f.array[8]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="660"  width="200"  y="170"  text="f.array[9]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="660"  width="200"  y="240"  text="f.array[10]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="660"  width="200"  y="310"  text="f.array[11]"  exp="tf.Answer=f.array[0]" storage="SkillGame.ks" target="*Kotae"  ]
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
[eval exp="f.E_HP=1000 , f.E_STR=30 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]
@jump storage="battle.ks"

*easy-2
[eval exp="tf.E_name='削り魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]

@jump storage="battle.ks"

*easy-3
[eval exp="tf.E_name='特殊魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 28"]

@jump storage="battle.ks"

*easy-4
[eval exp="tf.E_name='拘束魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=30 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 38"]

@jump storage="battle.ks"

*easy-5
[eval exp="tf.E_name='痴漢魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=28 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=32 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=5 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=30 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]

@jump storage="battle.ks"

*easy-6
[eval exp="tf.E_name='大砲魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=35 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

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
[eval exp="tf.E_name='遅延魔'"]
[eval exp="f.E_HP=1000 , f.E_STR=25 , f.E_DUR=30 , f.E_AGI=18 , f.E_DEX=28 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 35"]
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
[eval exp="f.E_HP=1000 , f.E_STR=40 , f.E_DUR=25 , f.E_AGI=18 , f.E_DEX=24 , f.E_LUK=5 , f.E_POW=5 , f.E_APP=7 , f.E_ACT=4 , f.E_AUR=0 , f.E_EXH=0 , f.E_ERO=0 , f.E_SAN=30 , f.E_SEX=18 , f.E_BND = 30"]

@jump storage="battle.ks"
