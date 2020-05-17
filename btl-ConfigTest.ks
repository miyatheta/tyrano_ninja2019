*テストコンフィグ
[er]
[Calc_Status]
[MiniStatus]
[link target="*状態異常"]▶状態設定[endlink][r]
[link target="*ステータス"]▶ステータス変更[endlink][r]
[link target="*戻る"]▶コンフィグ終了[endlink]
[s]

*状態異常
[er]
[Initialize_BadStatus]
[MiniStatus]
被虐：　　　　　　　　　　　　　催眠：[r]
媚薬：　　　　　　　　　　　　　興奮：[r]
膨乳：　　　　　　　　　　　　　淫紋：
[glink target="*状態異常" exp="f.P_MAZO=5" text="有効" size="15" width="30" height="13" x="420" y="500"]
[glink target="*状態異常" exp="f.P_MAZO=0" text="無効" size="15" width="30" height="13" x="520" y="500"]
[glink target="*状態異常" exp="f.P_HYPNO=10" text="有効" size="15" width="30" height="13" x="700" y="500"]
[glink target="*状態異常" exp="f.P_HYPNO=0" text="無効" size="15" width="30" height="13" x="800" y="500"]

[glink target="*状態異常" exp="f.P_ADDICT=3" text="有効" size="15" width="30" height="13" x="420" y="530"]
[glink target="*状態異常" exp="f.P_ADDICT=0" text="無効" size="15" width="30" height="13" x="520" y="530"]
[glink target="*状態異常" exp="f.P_KOHUN=5" text="有効" size="15" width="30" height="13" x="700" y="530"]
[glink target="*状態異常" exp="f.P_KOHUN=0" text="無効" size="15" width="30" height="13" x="800" y="530"]

[glink target="*状態異常" exp="f.P_BOOB=3" text="有効" size="15" width="30" height="13" x="420" y="560"]
[glink target="*状態異常" exp="f.P_BOOB=0" text="無効" size="15" width="30" height="13" x="520" y="560"]
[glink target="*状態異常" exp="f.P_CURSE=5" text="有効" size="15" width="30" height="13" x="700" y="560"]
[glink target="*状態異常" exp="f.P_CURSE=0" text="無効" size="15" width="30" height="13" x="800" y="560"]
[glink target="*テストコンフィグ" text="戻る" size="15" width="30" height="13" x="840" y="590"]
[s]

*ステータス
[er]
[Initialize]
[MiniStatus]
疲労度：[r]
快感度：
[glink target="*ステータス" exp="f.P_EXH=0" text="0" size="15" width="30" height="13" x="450" y="500"]
[glink target="*ステータス" exp="f.P_EXH=6" text="6" size="15" width="30" height="13" x="550" y="500"]
[glink target="*ステータス" exp="f.P_EXH=12" text="12" size="15" width="30" height="13" x="650" y="500"]

[glink target="*ステータス" exp="f.P_ERO=0" text="0" size="15" width="30" height="13" x="450" y="530"]
[glink target="*ステータス" exp="f.P_ERO=300" text="300" size="15" width="30" height="13" x="550" y="530"]
[glink target="*ステータス" exp="f.P_ERO=600" text="600" size="15" width="30" height="13" x="650" y="530"]

[glink target="*テストコンフィグ" text="戻る" size="15" width="30" height="13" x="840" y="590"]
[s]

*戻る
;疲労度の反映
[iscript]
n = f.P_EXH;
for( i=0 ; i<n ; i++){
  f.Deck.push(f.Cards.length);
  f.Cards.push({color:"black",value:1,active:1,txt:"疲労",tag:"*疲労"});
}
[endscript]
[er][return][s]
