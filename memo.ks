○雑魚敵のタイプ
1:一発屋タイプ
高い攻撃力で事故を誘発する役割。
命中が高くない、もしくは防御性能が低い代わりに攻撃力が高い。
疲労しているか否かで脅威度が跳ね上がる。
スキルは攻撃バフ、クリティカルバフ
⇒とにかく一撃をもらわないように回避中心に立ち回ることが必要

2:削りタイプ
体力を削る役割
攻撃力は低いが、命中は比較的高く攻撃回数が多い。
道中でプレイヤーの体力を削るのが目的の典型的雑魚。
スキルは命中バフ、攻撃バフ、クリティカルバフ、回避デバフ、防御デバフなど
⇒防御性能は低いので攻撃を重ねて一気に倒すか、敵の行動回数を奪っておく

3:遅延タイプ
ラウンド数を稼いで疲労させる役割
攻撃力は低いが、防御か回避、あるいは両方が高い
攻撃回数は少なく専守防衛する
こいつ自体が脅威にはならない
スキルは防御バフ、回避バフ、ガッツ、攻撃デバフ、命中デバフなど
⇒攻撃力が低いので無理に攻めずに気力を貯めて必中攻撃か防御無視攻撃で倒す

４:拘束セクハラタイ
頻繁に拘束を行いセクハラを行うタイプ。
ラウンド数を稼いで疲労させる役割
欲情度を高める役割
攻撃力はほぼない。防御性能はそこそこある。
欲情度が開幕から高め。
戦闘力自体は低いが拘束されている間は攻撃できないので戦闘が長引く
スキルは命中バフ、ガッツ、回避デバフなど、回避デバフ、腕力デバフ
⇒拘束されたときは速やかに脱出すること
⇒拘束攻撃を避けることが重要。拘束中に気力を貯めてぶっぱで倒すのもアリ。

3:特殊タイプ
物理攻撃でなく毒などで体力を削る役割
毒は呼吸を消費すればするほど体力が減る
毒を付与して専守防衛しながら体力を減らす。遅延行為も兼ねている厄介タイプ
スキルは防御バフ、回避バフ、毒、命中デバフなど
⇒毒は呼吸を消費するたびにダメージを負うので、防御に専念して術で倒す


○欲情とデバフについて
欲情度と別に快感を設定。一度に100以上の快感を得ると絶頂。欲情度が高いほど快感は強くなる。
絶頂＝1度に100以上の快感を得ると絶頂する
絶頂状態：絶頂後は呼吸が-1される(状態が解除されるまでターン開始時に−１)。POWに強力なバフが付与される
興奮状態Sexual arousal：欲情が700を超えた状態,STR・DEX・AGIに0デバフが付与、APP・POWにバフが付与される
興奮状態の解除：絶頂後、絶頂状態が解除されると同時に解除される
発情状態Estrus：
脱衣状態：APPにバフが付与される、セクハラ攻撃に対する耐性がダウンする

○攻撃
火炎:絶対命中＋スリップダメージ（300固定）＝敵AGI-
螺旋:防御無視＝敵DEF-
空蝉：完全回避＝敵DEX-
魅了：敵STR- AGI-

拳：敵DEF-
下段蹴：敵AGI-
上段蹴り：敵ACT-（ACTがあるなら必ず回避選択）

くない：敵DEX-
回し蹴り：攻撃大
飛び蹴り：攻撃極大＋クリティカル＋

○カード
同じ数字＝付属効果UP（コンボ可能技のみ）
同じマーク＝威力上昇
1.忍術　続・終（カード選択後に術選択で継続か終了を決める）

2.拳　攻撃＋防御ダウン　続
3.下段　攻撃＋回避ダウン　続
4.上段蹴り　攻撃大　続

5.くない　攻撃＋自回避UP　終
6.回し蹴り　攻撃力大　終
7.飛び蹴り　クリティカル率大　終

各3マーク　２1枚
a

○カードとチェイン
同じマークのカードを続けて出すと攻撃力がアップ


○ダメージ算出方法
[call target="*E_Def_select"]；敵の行動選択
[eval exp="tf.P_ACT = tf.P_ACT - 1"]；呼吸を消費
[eval exp="tf.Max=99 , tf.Min=0"][dice][jump target="*P_attack_miss" cond="tf.HIT < tf.dice"]；攻撃自体が命中するか判定
[if exp="tf.E_AVD>0"][eval exp="tf.Max=99 , tf.Min=1"][dice][jump target="*E_avoid_success" cond="tf.E_AVD > tf.dice"][endif]；敵が回避していた場合に回避が成功するか判定
[eval exp="tf.DEF = (tf.E_DUR * tf.E_GRD * 2) * tf.E_DEFd1"]；敵の防御力算出
[eval exp="tf.ATP = tf.P_STR * tf.RATE"]；攻撃力の算出
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"]；乱数の算出
[dice][eval exp="tf.Damage1 = tf.ATP - tf.DEF + tf.dice"]；ダメージの算出
[eval exp="tf.Damage = 0" cond="tf.Damage1<0"]；ダメージがマイナスにならないように調整
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]；ダメージをHPから引いて、HPがマイナスにならないように調整

○状態異常について
状態異常は毎ターン-1が行われる。
状態異常にかかった際に固定値３などが追加される
０ジャストになった時点で解除アナウンスを出し、各種倍率をデフォルトに戻す

tf.Mount:拘束状態
tf.Arousal:興奮状態
tf.Orga:絶頂状態


○マウント時の行動
;セクハラ行為に至る確率　+要因：PLのAPP,PLの着衣状態,敵欲情度, -要因：敵の理性,敵のAPP
[if exp="tf.dice> (50 + tf.E_SAN) - (tf.E_ERO/2 + (2 - f.P_DRESS)*10 + (tf.P_APP - tf.E_APP)*3)"]
敵の理性＋５０がベース　- (欲情度/2＋着衣状態*10＋魅力対抗＊３)

組付中のターン経過は独自のmount_turnとしてカウント,
経過カウント数/5切り上げで疲労度が加算

組付時に完全脱衣状態＋敵欲情一定値以上で判定スタート
判定に成功すると降参しなくても本番行為に入るOR戦闘状態のまま本番に入る

降参すると本番のバリエーションが増える

絶頂時に理性喪失判定が入る。

短時間（＝１回の戦闘）に５以上の理性を喪失すると理性喪失。それ以上の理性は喪失しない。アンコントロール状態に。【理性喪失状態】

短時間に１０連続絶頂すると気絶して敗北。

理性が一定値を下回ると【淫乱】状態になる。
魅了術等の効果上昇。色気上昇。
忍術シークエンスでの絶頂によるデメリットを無効化。
房中術でのセリフが専用に
立ち絵が【淫乱】専用に

○欲情と快感
欲情は理性（SAN）で減衰できる
快感は理性では減衰できない＝身体が心を裏切る状態
さらに部位ごとに感度が設定されている
感度は拷問によって上昇する

○性技の上達
戦闘における成長は一切ないが、房中術を重ねると膣・尻・口・胸と部位ごとに経験値が獲得できる。
獲得した経験値分だけ忍術シークエンスの制限時間が伸びる

○逸物のサイズ
雑魚はランダムで決定
0〜20の値を取る
18<=唖然
13<=巨根
8<=大きい
3<=普通
3>粗末

○暴力性
暴力判定で暴力行為を働くか
5〜20の値をランダムに取る

○性格
台詞回しが変わる
チンピラ1-5
強者6-8
慇懃9-10
気弱11-12
老人13
変態14-15
無口16-17
人外18

○性的嗜好
好みの部位。体位の分岐を決定。


○色仕掛けの計算
[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP)*20 * (100 - f.E_SAN)/100 * (tf.E_ERO + 500)500) , tf.E_ERO = tf.E_ERO + tf.HDamage"][limit]
魅力対抗の値＊４0＊敵の抵抗力（＝理性の喪失度＊欲情度）

○セクハラ
[eval exp="tf.HDamage = Math.floor((tf.E_SEX * 20 * tf.ArousAPPb * (100 - f.P_SAN)/100 * (tf.P_ERO + 1000)/1000) , tf.P_ERO = tf.P_ERO + tf.HDamage"][limit]
実際はこれに部位ごとの補正値が入る

○房中について
敵の興奮度ゲージを上昇させて絶頂したタイミングで術発動のシークエンスを実行する
忍術：

膣：
尻：
口：うわばみ
PLの状況により難易度が上下する
勝ちを狙うならPLのコンディションがなるべく良い状態で敵を絶頂に導く必要がある

房中のシナリオ
雑魚敵の場合、個別に設定された性向ごとに異なるシナリオが設定されている
性向ごとに台詞回しが微妙に変化

共通⇒組み敷きバック
⇒暴力的⇒バック尻叩き：被虐持ちで、相手を挑発した場合
⇒通常性向⇒マングリ返し
　⇒搾乳：状態異常時：口で吸い付く
　⇒絶頂時：噴乳
⇒変態性向⇒バックアナル
　⇒アナル開発済み
　⇒絶頂時：噴乳
⇒猟奇性向⇒首絞め
　⇒絶頂時：噴乳

それに従いシーン描写
快感が生じるテキストに併せて欲情が上昇
快感が１００を超えた場合絶頂
状態に合わせて内心を表示
もっとレスバトル感を出す⇒ザコ敵相手の通常時はそこまで？

シナリオ途中で発動する術によって展開が変わる
誘引香撫子⇒フェラ
誘引香乱菊⇒アナル
誘引香蓮華⇒女陰
誘引香夕顔⇒興奮度大アップ暴力性アップ

シナリオ途中で気を練る⇒最終フェイズで術発動
気を練るのに失敗すると分岐ポイント

バッドステータスによる分特殊演出
暴力的⇒マゾ、搾乳⇒胸、催眠⇒口、

ネームドエネミーは専用シナリオ
第１ダンジョンのボス：木：獣人　後背位ドッグスタイル
第２ダンジョンのボス：水：魚人　抱えあげ駅弁スタイル
第３ダンジョンのボス：土：巨人　オナホ扱いスタイル
追跡者：分身りんかん
第４ダンジョンのラスボス：火：触手

それ以外のシーン
町の地侍：騎乗位
エロ土下座

拷問シーン
拷問吏：金燎：
【被虐調教】
薬物投与＆鞭打ち：被虐性癖 +1SP
薬物投与＆張型木馬＆鞭打ち：被虐性癖 +2SP
【乳房改造】
薬物投与＆乳に針＆噴乳アクメ：爆乳体質 +1SP
薬物投与＆搾乳＆パイズリ：爆乳体質 +2SP
【尻穴開発】
薬物投与＆張り型：尻穴性器 +1SP
薬物投与＆尻穴輪姦：尻穴性器 +2SP
【膣内寄生】
蟲は卵を膣内で孵化させる。膣内で催淫作用のある体液を分泌する
戦闘を一定回数こなすと産卵イベントが始まる
蟲を膣内に入れる＆蟲を興奮させる薬：膣内寄生 +1SP
蟲を興奮させる薬＆出産：膣内寄生 +2SP
【催淫呪術】
上記までの拷問をいくつかこなすと開放。
催淫稿香呪術による意識操作⇒意識は拒絶⇒肉体への呪術＝精液を摂取しないと絶頂できない
絶頂お預け女同士での絡み合い（連れてきた女も逝かせれば絶頂させてやるとけしかけ）⇒ぶっかけ：催淫状態 5SP以上
絶頂お預け女同士でのディルド⇒おねだり⇒アナル2P+2P：催淫状態 10SP以上
絶頂お預け女同士での３P⇒エロ土下座⇒4P：催淫状態 15SP以上
【隷属依代】７日の前にゲームオーバー
SANが０になると発生
輪姦されるくぬぎ⇒金燎に主を告白
精神崩壊したくぬぎを依り代に神格を召喚⇒融合塗壁異種姦
バックドアから飯生が呪術に介入しリスタートへ
この場合、魔力+1した上で新しい術を覚えられる。

５種類の拷問
第１段階と以降の繰り返し用の第２段階

被虐性癖・・・被ダメージ時に快感発生
爆乳体質・・・乳房に干渉されたときに乳を吹いて快感発生
尻穴性器・・・房中で３Pが発生するようになる。２穴刺し
蟲憑き・・・・毎ターン膣内で催淫効果のある体液を吐く。感度が上がる


淫乱状態
絶頂：欲情度
連続絶頂

SANを５以上喪失すると敗北、房中に移る。
淫紋がトリガーで負けるのも考えたが、精神的に堕ちていくほうが良い。
SANを５以上喪失すると、それ以上は喪失しないが一方的に陵辱される。

[eval exp="tf.HDamage = Math.floor((tf.P_APP + tf.ArousAPPb - tf.E_APP) * (tf.VP + 1) * (100-tf.E_SAN) / 100 * (tf.E_ERO + 50)/100)"]
((14+0-7)*(5+1)*(100-30)/100*(121+50)/100)=7*6*70/100*171/100=

戦闘時立ち絵
①通常
②被ダメージ時
③負傷（左腕が下がる）
③全裸（右腕で胸を隠す）
④敗北
⑤拘束
⑥淫乱（崩れた服。口元に指）

服装差分
A着衣
B下着
C脱衣

表情
a.ノーマル
【衣装】
b.羞恥（下着）頬染め＋眉下げ
c.羞恥（脱衣）頬染め＋眉下げ＋半目
【残HP】
d.中負傷　片目を瞑る
e.大負傷　片目を瞑る＋口が開く
【欲情】
f.中欲情　顔上気＋涙目
g.大欲情　全身上気＋涙目＋かすみ目＋口が開く＋舌が見える
h.絶頂　目閉じ＋口開け
i.余韻　レイプ目＋口開け
【理性】
j.理性喪失　歓喜の表情＋レイプ目
k.淫乱　歓喜の表情＋瞳にハートマーク

特殊立ち絵：⑤拘束
セクハラされた場合は画面にアップ
それぞれの行為に応じたグラフィックを用意
１ー胸
２ー陰部
３ー尻

特殊立ち絵
☆魅了の術
カットインで乳、尻、太股、顔（小悪魔的表情ウインク⇒蠱惑的表情舌なめずり【痴女化時】）

○パズルの難易度操作について
制限時間を短く・・・興奮度を示す
候補の数を多く・・・敵の強さに応じて実施
似た字形にする・・・敵によって実施
文字を回転させる・・・混乱具合を示す
エフェクトで見づらくする・・・状態異常とか？

○セーブについて
メニューを表示させなければセーブはできない

○敵陣営
火霊聖人：蘇生者。生きる地獄。神格の召喚と世の破滅を目指す人ではなくなった者。

翠庵：狂信者。魔導書の回収を命じられこの地にやってきたが火霊の力に魅入られその大願成就に尽力する。
　　　敵陣の統率者。

隕慧：翠庵と共にやってきた僧侶？の一人。黒蓮衆の拷問吏。
　　　男女の交合により魔力を生成することを研究している

NEXT:
息切れ要らなくない？：行動回数の多さが強みに反映できていない。カード式になったので狙って息切れができない。【要検討】
スタンの実装
追跡者：房中を避けて撤退を繰り返していると遭遇率が上昇
残りHPでスキル変化：激怒、生殖本能
敵スキル１をランダム実行に
攻撃を複数パターン化

*E_skill_select
;敵のスキル(３の倍数+1のターンのみ実行)
[if exp="tf.sho = tf.Turn % 3 , tf.sho!=1"]
[jump target="*E_skill_play"]
[endif]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
;コンボルート選定
[if exp="tf.dice >= 60"]
[eval exp="tf.E_skill_A=tf.E_skill11 , tf.E_skill_B=tf.E_skill12 , tf.E_skill_C=tf.E_skill13"]
[elsif exp="tf.dice >= 30"]
[eval exp="tf.E_skill_A=tf.E_skill21 , tf.E_skill_B=tf.E_skill22 , tf.E_skill_C=tf.E_skill23"]
[else exp="tf.dice >= 0"]
[eval exp="tf.E_skill_A=tf.E_skill51 , tf.E_skill_B=tf.E_skill52 , tf.E_skill_C=tf.E_skill53"]
[endif]
[jump target="*E_skill_play"]
[s]

*E_skill_play
[if exp="tf.sho = tf.Turn % 3 , tf.sho!=1"]
[jump storage="skilllist.ks" target="&tf.E_skill_A"]
[elsif exp="tf.sho = tf.Turn % 3 , tf.sho!=2"]
[jump storage="skilllist.ks" target="&tf.E_skill_B"]
[else]
[jump storage="skilllist.ks" target="&tf.E_skill_C"]
[endif]
[s]


*E_attack_select
;特殊
[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="f.E_AUR>=10 && tf.dice>6"]
[jump storage="skilllist.ks" target="&tf.E_skill62"]
[endif]
;チャージ完了で技をかならず使う
[if exp="f.E_AUR>=50 && tf.dice>0"]
[enemyname]の[enemy_attack_ex][p]
[Calc_Status]
[eval exp="f.E_AUR = f.E_AUR - 50 , tf.E_ACT = tf.E_ACT - 1"]
[eval exp="tf.RATE = tf.E_ATKex_rate , tf.ACC = tf.E_ATKex_acc , tf.CRTrate = tf.E_ATKex_crt , tf.E_ATK='*E_attack_ex'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[endif]

;組付（敵によって発生率が異なる）
[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="f.E_AUR>0 && tf.dice>tf.E_ATKmt_rate"]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.ACC = tf.E_ATKmt_acc , tf.CRTrate = tf.E_ATKmt_crt , tf.E_ATK='*E_attack_mt'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[endif]

[eval exp="tf.max=9 , tf.Min=0"][dice]
[if exp="tf.dice>4"]
[enemyname]の[enemy_attack_1][p]
[Calc_Status]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = tf.E_ATK1_rate , tf.ACC = tf.E_ATK1_acc , tf.CRTrate = tf.E_ATK1_crt , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]

[else]
[enemyname]の[enemy_attack_2][p]
[Calc_Status]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = tf.E_ATK2_rate , tf.ACC = tf.E_ATK2_acc , tf.CRTrate = tf.E_ATK2_crt , tf.E_ATK='*E_attack_2'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
[jump target="*P_Def_select"]
[endif]
[s]
