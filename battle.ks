*start
[cm][clearfix][start_keyconfig]
;マクロの読み込み
@call storage="macros.ks" target="*マクロ"
;背景の読み込み
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
;ステータスのインストール
*Initialize
[Initialize][Initialize_BadStatus]
[Reflesh_PL_buff][Reflesh_EN_buff][Initialize_3Tbuff]

*Initialize_Cards
;カードの情報を収めた連想(ハッシュ・辞書)配列(=オブジェクト)を収めた配列(多次元配列)を作成。
;Deck=カードのidを並べたもの。
[iscript]
f.Cards=[
{color:"red",value:1,active:1,txt:"力壱1"},
{color:"red",value:2,active:1,txt:"力弐2"},
{color:"red",value:3,active:1,txt:"力参3"},
{color:"red",value:2,active:1,txt:"力弐4"},
{color:"red",value:3,active:1,txt:"力参5"},
{color:"blue",value:1,active:1,txt:"心壱1"},
{color:"blue",value:2,active:1,txt:"心弐2"},
{color:"blue",value:3,active:1,txt:"心参3"},
{color:"blue",value:2,active:1,txt:"心弐4"},
{color:"blue",value:3,active:1,txt:"心参5"},
{color:"green",value:1,active:1,txt:"技壱1"},
{color:"green",value:2,active:1,txt:"技弐2"},
{color:"green",value:3,active:1,txt:"技参3"},
{color:"green",value:2,active:1,txt:"技弐4"},
{color:"green",value:3,active:1,txt:"技参5"},
];
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]

;デバッグ用の設定
@call storage="btl-ConfigTest.ks" target="*テストコンフィグ"
戦闘を開始します[p]
;------------------------------------------------------------------------------
*ラウンド開始
[Reflesh_PL_buff]
[eval exp="tf.Round +=1"]
[MiniStatus]

*手札構築
[CardShuffle]
[ShowCardList]
[MiniStatus]
[Calc_Card]

;------------------------------------------------------------------------------
;敵攻撃パターン選択
*敵攻撃パターン選択
;[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン選択怒り" cond="tf.E_anger_count>0"]
;[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン選択欲情" cond="tf.E_charm_count>0"]
;[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン選択"]

;------------------------------------------------------------------------------
*ターン開始
ターン開始[er]
[eval exp="tf.Turn +=1"]
;状態異常のカウント・治癒


;------------------------------------------------------------------------------
;PLの選択
*手札一覧
[er]
[ShowCardList]
[MiniStatus]
[glink text="スキル" size="18" height="30" x="310" y="500" color="gray" target="*技能" ]
[glink text="必殺技" size="18" height="30" x="310" y="560" color="gray" target="*忍術" ]
[s]

;------------------------------------------------------------------------------
;PLの行動選択
*技能
[er]
[if exp="f.Green>0"][link storage="btl-PL-Skill.ks" target="*スキル1"]必至(命中率上昇)　[endlink]　　　[endif]
[if exp="f.Green>0"][link storage="btl-PL-Skill.ks" target="*スキル2"]心眼(会心発生上昇)[endlink][endif][r]
[if exp="f.Green>0"][link storage="btl-PL-Skill.ks" target="*スキル3"]金剛(耐久力上昇)　[endlink]　　　[endif]
[if exp="f.Green>1"][link storage="btl-PL-Skill.ks" target="*スキル4"]瞑想(精神上昇)　　[endlink][endif][r]
[if exp="f.Green>1"][link storage="btl-PL-Skill.ks" target="*スキル5"]練気(カード追加)　[endlink]　　　[endif]
[if exp="f.Green>1"][link storage="btl-PL-Skill.ks" target="*スキル6"]反撃(カウンター攻撃)[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink][r]
[s]

*忍術
[er]
[jump target="*手札一覧" cond="f.Blue<1"]
[if exp="f.Blue>0"][link storage="btl-PL-Magic.ks" target="*忍術4"]早着替え(要気力 1)　　[endlink][endif]
[if exp="f.Blue>0"][link storage="btl-PL-Magic.ks" target="*忍術2"]変わり身(要気力 5)[endlink][endif][r]
[if exp="f.Blue>0"][link storage="btl-PL-Magic.ks" target="*忍術3"]魅了の術(要気力 5)　　[endlink][endif]
[if exp="f.Blue>1"][link storage="btl-PL-Magic.ks" target="*忍術1"]火遁の術(要気力10)[endlink][endif][r]
[link target="*手札一覧"]戻る[endlink][r]
[s]


;------------------------------------------------------------------------------
*敵攻撃選択
;[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン適用"]
;[s]

;------------------------------------------------------------------------------
*ターン終了
ターン終了[er]
;行動力減少
[eval exp="tf.P_ACT -=1"]
[if exp="tf.P_ACT <1"]
[jump target="*ターン開始"]
[else]
[jump target="*ラウンド終了"]
[endif]
[s]
;------------------------------------------------------------------------------
*ラウンド終了
[freeimage layer=3]
;バッドステータスのラウンド短縮
[eval exp="tf.P_Stan = 0"]
[jump target="*ラウンド開始"]
