*手札配布
[er]
[DeckShuffle]
[layopt layer="4" visible=true]
[iscript]
tf.Cardtxt ="全札：";
i=0;
while(i < f.Cards.length){
  tf.Cardtxt = tf.Cardtxt + f.Cards[i].txt;
  i++;
}
[endscript]
[ptext name="Cards" text="&f.Cards.length" layer="4" edge="0x000000" size=10 x=0 y=0 overwrite=true]
[ptext name="Cardstxt" text="&tf.Cardtxt" layer="4" edge="0x000000" size=10 x=30 y=0 overwrite=true]
[ptext name="Deck" text="&f.Deck" layer="4" edge="0x000000" size=10 x=0 y=10 overwrite=true]
[ptext name="Hand" text="&f.Hand" layer="4" edge="0x000000" size=10 x=0 y=20 overwrite=true]
[endmacro]
[MiniStatus]
[Calc_Card]
[return]

*start
「ん・・・う・・・」
川のせせらぎの音が聞こえる。
まどろみから意識を浮かび上がらせた

「兄様！！」[er]
なずなは目を覚ますと同時に叫んだ
いったい、どれほどの間気を失っていたのか？
兄はどうなったのか？
周囲を確認しようとしたなずなは、
しかし、すぐに自分が身動きできないことに気がついた。
なずなの身体は後ろ手に縛られた上で木にくくりつけられていた。
「な！？」
「お目覚めになりましたか。なずな殿」
声の方を見やれば河原の岩に一人男が腰掛けていた。
「お前は・・・」
「又三郎！！追風又三郎ではないか！？」
男は昂賀の忍びの一人追風又三郎であった。
「これはどういうことだ！？それに兄様は！！」
「落ち着きください。なずな殿」
激高するなずなとは逆に痩せぎすな男は穏やかに語りかけた。
「なずな殿は上流で爆発に巻き込まれた後、ここまで川を流されてきたのです」
「御存知の通り私はこの耳だけが自慢ですので、
いち早く事態に気が付きこうして馳せ参じた次第です」
悠然と語りながら又三郎はなずなの方へと歩み寄ってきた
「いやあ、威賀者たちより先に見つけることができて幸いでしたよ」
にやあ、と嗤う又三郎になずなのうなじに寒気が走った。
「又三郎、お前・・・」
先ほどの不意打ち。
敵の動きを把握して動いていたなずなたちが裏を掛かれたのは
威賀者がそれだけの技量を持っていたのだと思っていた。
だが、違う。
敵の中には鷹山の瞳術対策をした者まで居た。
明らかに誰が来るのか分かっていた上で罠にかけたのだ。
偽りの敵の配置を伝えることで誘導した
「お前！威賀に寝返ったのか！！」

又三郎はなずなの装束の襟を掴むと乱暴にはだけさせた。
[l]

房中を開始します[call target="*手札配布"][p]
「や、やめろ！！」
「おお！！これが夢にまで見たなずな殿の乳！！」
又三郎は露わになったなずなの乳房を掴むと揉みしだいた

;------------------------------------------------------------------------------
*快感判定1
[eval exp="tf.RATE= f.P_BOOB"][SUKEBE]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Kaikan , tf.E_Sukeb_MND += 1"][limit]

[EnName]はなずな の胸を揉みしだいた[p]
[if exp="f.P_BOOB==2"]
揉みしだかれたなずな の乳房から母乳が迸った[p]
[call storage="voice-PL.ks" target="*vc-aeg"]

[elsif exp="tf.P_ERO>500"]
[call storage="voice-PL.ks" target="*vc-aeg"]

[else]
[call storage="voice-PL.ks" target="*vc-iya"]
[endif]

[emb exp="tf.Kaikan"]の快感[r]なずな の欲情が[emb exp="tf.Kaikan"]上昇した[r]
[EnName]の精神力が低下した[p]
;絶頂判定＆正気度判定
[Orgasm][SANcheck][MiniStatus]
[jump storage="btl-bound.ks" target="*敵拘束行動終了"]
[s]
;------------------------------------------------------------------------------

[s]
