*start
[cm]
[clearfix]
[start_keyconfig]
@call storage="macros.ks" target="*マクロ"

[bg storage="mori_yoru.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=340 top=480 width=610 height=150 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="10" marginl="10" marginr="10" marginb="0"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;このゲームで登場するキャラクターを宣言
[chara_new  name="gouza"  storage="chara/gouza/pr_gouza.png" jname="豪座" ]

[chara_show  name="gouza" layer=1 width=300 left=1000 top=50 wait="true"]
[anim name="gouza" opacity=0 time=1]
[anim name="gouza" left=750 top=50 time=1]
[anim name="gouza" opacity=255 left=600 top=50 time=300 anim="true" effect="jswing" ]

戦闘を開始します[p]

;ステータスのインストール
*Initialize
[Initialize]
[Reflesh_PL_buff][Reflesh_EN_buff][Initialize_3Tbuff]
*Initialize_BadStatus
;状態異常の初期値設定
[eval exp="tf.P_Stan = 0 , tf.Orga = 0 , tf.OrgaStan = 0 , tf.OrgaCount=0 , tf.OrgaPOWb = 0 ,f.P_INRAN = 0 , tf.Kaikan = 0 , f.Insanity=0"]
[eval exp="tf.Arousal=0 , tf.ArousSTRd =1 , tf.ArousAGId =0 , tf.ArousDEXd =0 , tf.ArousAPPb =0 , tf.ArousMNDb =0 , tf.ArousSEXd =1"]
[eval exp="tf.E_scald = 0 , tf.E_stan=0"]

*Initialize_Cards
;カードの情報を収めた連想(ハッシュ・辞書)配列(=オブジェクト)を収めた配列(多次元配列)を作成。
;Deck=カードのidを並べたもの。
[iscript]
f.Cards=[
{color:"red",value:1,active:1,txt:"攻撃1",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃2",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃3",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃4",tag:"*攻撃"},
{color:"blue",value:1,active:1,txt:"忍術5",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術6",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術7",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術8",tag:"*忍術"},
{color:"green",value:1,active:1,txt:"技能9",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能⑩",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能⑪",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能⑫",tag:"*技能"},
];
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]

*ターン開始
[Reflesh_PL_buff]
;ターン開始
[eval exp="tf.Turn=tf.Turn+1"]
;状態異常のカウント・治癒
;絶頂
[eval exp="tf.Orga = tf.Orga - 1"]
[if exp="tf.Orga > 0"]
くぬぎは絶頂の余韻から抜け出せないでいる![p]
[elsif exp="tf.Orga == 0 && tf.Arousal > 0"]
くぬぎは絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0, tf.OrgaPOWb = 1"]
[eval exp="tf.Arousal = 1"]
[endif]
;欲情
[if exp="tf.Arousal == 1"]
くぬぎの欲情が収まった[p]
[eval exp="tf.P_ERO =0 , tf.Arousal =0 , tf.ArousSTRd =0 , tf.ArousAGId =0 , tf.ArousDEXd =0 , tf.ArousAPPb =0 , tf.ArousSEXd =0"]
[endif]
;スタン
[if exp="tf.E_stan>0"][eval exp="tf.E_stan=0"][EnName]が自由に動けるようになった[p][endif]

*敵攻撃パターン選択
[jump storage="battle-Testenemy.ks" target="*敵攻撃パターン選択"]

*手番開始
[MiniStatus]
[glink text="手番開始" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札構築" ]
[s]

*手札構築
[CardShuffle]
[ShowCardList]
[MiniStatus]
[Calc_Card]

*手札一覧
[er]
[ShowCardList]
[MiniStatus]
[if exp="f.black>=3"][wt7][jump target="*息切れ"][endif]
[glink text="手番継続" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札一覧" cond="f.Red>0"]
[glink text="手番終了" size="18" width="15" height="100" x="350" y="500" color="gray" target="*攻守交代" cond="f.Red<=0"]
[s]

*攻撃
[er]
[if exp="f.Red<1"][jump storage="battle.ks" target="*手札一覧"][endif]
[if exp="f.Red>0"][link storage="battle-PL-Attack.ks" target="*攻撃１"]拳/弱攻撃[eval exp="tf.ACC = 50"][Calc_P_Hit][endlink]　　[endif]
[if exp="f.Red>1"][link storage="battle-PL-Attack.ks" target="*攻撃２"]蹴り/中攻撃[eval exp="tf.ACC = 30"][Calc_P_Hit][endlink][endif][r]
[if exp="f.Red>1"][link storage="battle-PL-Attack.ks" target="*攻撃４"]手裏剣/特殊１[eval exp="tf.ACC = 30"][Calc_P_Hit][endlink]　　[endif]
[if exp="f.Red>2"][link storage="battle-PL-Attack.ks" target="*攻撃５"]撒き菱/特殊２[eval exp="tf.ACC = 40"][Calc_P_Hit][endlink][endif][r]
[if exp="f.Red>2"][link storage="battle-PL-Attack.ks" target="*攻撃３"]回し蹴り/強攻撃[eval exp="tf.ACC = 10"][Calc_P_Hit][endlink]　　[endif]
[link target="*手札一覧"]戻る[endlink]
[s]

*技能
[er]
[if exp="f.Green<1"][jump storage="battle.ks" target="*手札一覧"][endif]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル１"]スキル１命中　[endlink][endif]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル２"]スキル２会心　[endlink][endif][r]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル３"]スキル３防御　[endlink][endif]
[if exp="f.Green>0"][link storage="battle-PL-Skill.ks" target="*スキル４"]スキル４忍耐　[endlink][endif][r]
[if exp="f.Green>1"][link storage="battle-PL-Skill.ks" target="*スキル５"]スキル５修繕　[endlink][endif]
[if exp="f.Green>1"][link storage="battle-PL-Skill.ks" target="*スキル６"]スキル６反撃　[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink][r]
[s]

*忍術
[er]
[if exp="f.Blue<1"][jump storage="battle.ks" target="*手札一覧"][endif]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術１"]忍術１火遁（気力10）[endlink][endif]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術２"]忍術２変わり身（気力5）[endlink][endif][r]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術３"]忍術３魅了（気力5）[endlink][endif]
[if exp="f.Blue>0"][link storage="battle-PL-Magic.ks" target="*忍術４"]忍術４衣替え（気力3）[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink][r]
[s]

*疲労
[er]
疲労カードにコマンド、ボーナスはありません。[r]手札に疲労カードが３枚集まると息切れ(スタン)します。[r]
息切れ発生時、疲労カードが３枚消えます[l][er]
[jump target="*手札一覧"]
[s]

*息切れ
[cm]
なずな は息切れをした！[r]
この手番は行動ができない！[p]
[Ikigire]
[eval exp="tf.P_Stan = 1"]
[MiniStatus]
;くみつき判定

*攻守交代
[cm]
[eval exp="f.P_MGP = f.P_MGP + f.Blue"]
[eval exp="tf.P_AVD= (f.Red + f.Blue + f.Green)"]
[Reflesh_EN_buff]
[if exp="tf.P_Stan!=1"][ReActivate][endif]
[MiniStatus]
[jump storage="battle-Testenemy.ks" target="*敵攻撃パターン適用"]
[s]

*ターン終了
[freeimage layer=3]
[eval exp="tf.P_AVD=0"]
[eval exp="f.P_EXH++"]
;Deckに要素を追加。カードの長さ＝追加するカードのナンバーになる。配列のナンバーは０から
;疲労カードの追加
[if exp="tf.P_Stan < 1"]
[iscript]
f.Deck.push(f.Cards.length);
f.Cards.push({color:"black",value:1,active:1,txt:"疲労",tag:"*疲労"});
[endscript]
[endif]
;バッドステータスのターン短縮
[eval exp="tf.P_Stan = 0"]
[jump target="*ターン開始"]
