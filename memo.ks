○雑魚敵のタイプ
1:遅延タイプ
ラウンド数を稼いで疲労させる役割
攻撃力は低いが、防御か回避、あるいは両方が高い
攻撃回数は少なく専守防衛する
こいつ自体が脅威にはならない
スキルは防御バフ、回避バフ、ガッツ、攻撃デバフ、命中デバフなど
⇒攻撃力が低いので無理に攻めずに気力を貯めて必中攻撃か防御無視攻撃で倒す

2:削りタイプ
体力を削る役割
攻撃力は低いが、命中は比較的高く攻撃回数が多い。
道中でプレイヤーの体力を削るのが目的の典型的雑魚。
スキルは命中バフ、攻撃バフ、クリティカルバフ、回避デバフ、防御デバフなど
⇒防御性能は低いので攻撃を重ねて一気に倒すか、敵の行動回数を奪っておく

3:特殊削りタイプ
物理攻撃でなく毒などで体力を削る役割
毒は呼吸を消費すればするほど体力が減る
毒を付与して専守防衛しながら体力を減らす。遅延行為も兼ねている厄介タイプ
スキルは防御バフ、回避バフ、毒、命中デバフなど
⇒毒は呼吸を消費するたびにダメージを負うので、防御に専念して術で倒す

４:拘束タイプ
拘束攻撃をしかけてくる。
ラウンド数を稼いで疲労させる役割
拘束後にセクハラではなく攻撃や拘束し直すタイプ
戦闘力自体は低いが拘束されている間は攻撃できないので戦闘が長引く
スキルは命中バフ、ガッツ、回避デバフなど
⇒拘束攻撃を避けることが重要。拘束中に気力を貯めてぶっぱで倒すのもアリ。

5:セクハラタイプ
拘束攻撃後にセクハラを行ってくるタイプ。
欲情度を高める役割
攻撃力はほぼない。防御性能はそこそこある。
スキルは回避デバフ、腕力デバフ
⇒拘束されたときは速やかに脱出すること

6:一発屋タイプ
高い攻撃力で事故を誘発する役割。
命中が高くない、もしくは防御性能が低い代わりに攻撃力が高い。
疲労しているか否かで脅威度が跳ね上がる。
スキルは攻撃バフ、クリティカルバフ
⇒とにかく一撃をもらわないように回避中心に立ち回ることが必要

○欲情とデバフについて
絶頂状態：絶頂後は呼吸が-1される(状態が解除されるまでターン開始時に−１)。POWに強力なバフが付与される
興奮状態Sexual arousal：欲情が80を超えた状態,STR・DEX・AGIに0デバフが付与、APP・POWにバフが付与される
興奮状態の解除：絶頂後、絶頂状態が解除されると同時に解除される
発情状態Estrus：
脱衣状態：APPにバフが付与される、セクハラ攻撃に対する耐性がダウンする

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

○マウント時の行動
;セクハラ行為に至る確率　+要因：PLのAPP,PLの着衣状態,敵欲情度, -要因：敵の理性,敵のAPP
[if exp="tf.dice> (50 + tf.E_SAN) - (tf.E_ERO/2 + (2 - f.P_DRESS)*10 + (tf.P_APP - tf.E_APP)*3)"]
敵の理性＋５０がベース　- (欲情度/2＋着衣状態*10＋魅力対抗＊３)


組付時に完全脱衣状態＋敵欲情一定値以上で判定スタート
判定に成功すると降参しなくても本番行為に入るOR戦闘状態のまま本番に入る

降参すると本番のバリエーションが増える

絶頂時に理性喪失判定が入る。

短時間に５以上の理性を喪失すると理性喪失。それ以上の理性は喪失しない。アンコントロール状態に。

短時間に１０連続絶頂すると気絶して敗北。