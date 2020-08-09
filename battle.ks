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
{color:"red",value:1,active:1,txt:"攻撃1",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃2",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃3",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃4",tag:"*攻撃"},
{color:"red",value:1,active:1,txt:"攻撃5",tag:"*攻撃"},
{color:"blue",value:1,active:1,txt:"忍術1",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術2",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術3",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術4",tag:"*忍術"},
{color:"blue",value:1,active:1,txt:"忍術5",tag:"*忍術"},
{color:"green",value:1,active:1,txt:"技能1",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能2",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能3",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能4",tag:"*技能"},
{color:"green",value:1,active:1,txt:"技能5",tag:"*技能"},
];
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]
;疲労度の反映
[iscript]
n = f.P_EXH;
for( i=0 ; i<n ; i++){
  f.Deck.push(f.Cards.length);
  f.Cards.push({color:"black",value:1,active:1,txt:"疲労",tag:"*疲労"});
}
[endscript]

;デバッグ用の設定
@call storage="btl-ConfigTest.ks" target="*テストコンフィグ"
戦闘を開始します[p]
;------------------------------------------------------------------------------

*ターン開始
[Reflesh_PL_buff]
;ターン開始
[eval exp="tf.Turn +=1"]
;状態異常のカウント・治癒
;絶頂
[eval exp="tf.P_ORGA = tf.P_ORGA - 1"]
[if exp="tf.P_ORGA > 0"]
なずなは絶頂の余韻から抜け出せないでいる![p]
[elsif exp="tf.P_ORGA == 0 && tf.Arousal > 0"]
なずなは絶頂から抜け出した[p]
[eval exp="tf.OrgaCount = 0, tf.OrgaSEX = 1"]
[eval exp="tf.Arousal = 1"]
[endif]
;欲情
[if exp="tf.Arousal == 1"]
なずなの欲情が収まった[p]
[eval exp="tf.P_ERO=0 , tf.Arousal=0 , tf.ArousSTRd=0 , tf.ArousAGId=0 , tf.ArousDEXd=0"]
[endif]
;スタン
[if exp="tf.E_Stan>0"][eval exp="tf.E_Stan=0"][EnName]が自由に動けるようになった[p][endif]

;------------------------------------------------------------------------------
;敵攻撃パターン選択
*敵攻撃パターン選択
[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン選択怒り" cond="tf.E_anger_count>0"]
[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン選択欲情" cond="tf.E_charm_count>0"]
[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン選択"]

;------------------------------------------------------------------------------
;PLの手番
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
[if exp="f.Black>=3"]
[glink text="息切れ" size="18" width="15" height="100" x="350" y="500" color="gray" target="*息切れ"]
[else]
[glink text="手番継続" size="18" width="15" height="100" x="350" y="500" color="gray" target="*手札一覧" cond="f.Red>0"]
[glink text="手番終了" size="18" width="15" height="100" x="350" y="500" color="gray" target="*攻守交代" cond="f.Red<=0"]
[endif]
[s]

;------------------------------------------------------------------------------
;PLの行動選択
*攻撃
[er]
[if exp="f.Black>=3"]
なずなは息切れしている[p]
[jump target="*手札一覧"]
[endif]

[jump target="*手札一覧" cond="f.Red<1"]
[if exp="f.Red>0"][link storage="btl-PL-Attack.ks" target="*攻撃1"]拳　/弱攻撃ーー[eval exp="tf.ACC = 50"][Calc_P_Hit][endlink]　　[endif]
[if exp="f.Red>1"][link storage="btl-PL-Attack.ks" target="*攻撃2"]蹴り/中攻撃ーー[eval exp="tf.ACC = 30"][Calc_P_Hit][endlink][endif][r]
[if exp="f.Red>1"][link storage="btl-PL-Attack.ks" target="*攻撃4"]手裏剣/命中低下[eval exp="tf.ACC = 30"][Calc_P_Hit][endlink]　　[endif]
[if exp="f.Red>1"][link storage="btl-PL-Attack.ks" target="*攻撃5"]撒き菱/攻撃低下[eval exp="tf.ACC = 40"][Calc_P_Hit][endlink][endif][r]
[if exp="f.Red>2"][link storage="btl-PL-Attack.ks" target="*攻撃3"]回し蹴り/強攻撃[eval exp="tf.ACC = 10"][Calc_P_Hit][endlink]　　[endif]
[link target="*手札一覧"]戻る[endlink]
[s]

*技能
[er]
[jump target="*手札一覧" cond="f.Green<1"]
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

*疲労
[er]
[if exp="f.Black>=3"]
なずなは息切れしている[p]
[jump target="*手札一覧"]
[endif]

疲労札にコマンド、ボーナスはありません。[r]手札に疲労札が３枚以上あると「息切れ」になります。[r]
息切れ発生時は攻撃を行えません。[r]息切れ後は手札の疲労札が消えます[l][er]
[jump target="*手札一覧"]
[s]

;------------------------------------------------------------------------------
;PLの行動終了
*息切れ
[cm]
なずな は息切れをした！[r]
この手番は行動ができない！[p]
[eval exp="tf.P_Stan = 1"]
[MiniStatus]
;くみつき判定

*攻守交代
[cm]
[Ikigire]
[eval exp="f.P_MGP = f.P_MGP + f.Blue"][limit]
[eval exp="tf.P_AVD= (f.Red + f.Blue + f.Green)"]
[Reflesh_EN_buff]
[if exp="tf.P_Stan!=1"][ReActivate][endif]
[MiniStatus]

[if exp="tf.E_Stan>0"]
敵は行動不能になっている[p]
[jump target="*ターン終了"][s]
[endif]

;------------------------------------------------------------------------------
;敵の手番
*敵手番開始
[jump storage="btl-Testenemy.ks" target="*敵攻撃パターン適用"]
[s]

;------------------------------------------------------------------------------
;ターン終了
*ターン終了
[freeimage layer=3]
[eval exp="tf.P_AVD=0"]
;疲労カードの追加スタン時は除外
[if exp="tf.P_Stan < 1"]
[Hirou]
[endif]
;バッドステータスのターン短縮
[eval exp="tf.P_Stan = 0"]
[jump target="*ターン開始"]
