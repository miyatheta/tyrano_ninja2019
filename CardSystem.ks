
[iscript]
f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
f.Cards=[
{id:0,type:1,name:"忍術",suite:"水",comb:1,active:1,txt:"水・忍　術　"},
{id:1,type:1,name:"忍術",suite:"風",comb:1,active:1,txt:"風・忍　術　"},
{id:2,type:1,name:"忍術",suite:"炎",comb:1,active:1,txt:"炎・忍　術　"},
{id:3,type:2,name:"拳",suite:"水",comb:1,active:1,txt:"水・拳　　　"},
{id:4,type:2,name:"拳",suite:"風",comb:1,active:1,txt:"風・拳　　　"},
{id:5,type:2,name:"拳",suite:"炎",comb:1,active:1,txt:"岩・拳　　　"},
{id:6,type:3,name:"下段蹴り",suite:"水",comb:1,active:1,txt:"水・下段蹴り"},
{id:7,type:3,name:"下段蹴り",suite:"風",comb:1,active:1,txt:"風・下段蹴り"},
{id:8,type:3,name:"下段蹴り",suite:"炎",comb:1,active:1,txt:"炎・下段蹴り"},
{id:9,type:4,name:"上段蹴り",suite:"水",comb:1,active:1,txt:"水・上段蹴り"},
{id:10,type:4,name:"上段蹴り",suite:"風",comb:1,active:1,txt:"風・上段蹴り"},
{id:11,type:4,name:"上段蹴り",suite:"炎",comb:1,active:1,txt:"炎・上段蹴り"},

{id:12,type:5,name:"くない",suite:"水",comb:0,active:1,txt:"水・くない　"},
{id:13,type:5,name:"くない",suite:"風",comb:0,active:1,txt:"風・くない　"},
{id:14,type:5,name:"くない",suite:"炎",comb:0,active:1,txt:"炎・くない　"},
{id:15,type:6,name:"回し蹴り",suite:"水",comb:0,active:1,txt:"水・回し蹴り"},
{id:16,type:6,name:"回し蹴り",suite:"風",comb:0,active:1,txt:"風・回し蹴り"},
{id:17,type:6,name:"回し蹴り",suite:"炎",comb:0,active:1,txt:"炎・回し蹴り"},
{id:18,type:7,name:"飛び蹴り",suite:"水",comb:0,active:1,txt:"水・飛び蹴り"},
{id:19,type:7,name:"飛び蹴り",suite:"風",comb:0,active:1,txt:"風・飛び蹴り"},
{id:20,type:7,name:"飛び蹴り",suite:"炎",comb:0,active:1,txt:"炎・飛び蹴り"}
];
[endscript]

;*シャッフルスタート
[eval exp="tf.Set=0 , tf.P_ACTmax=7 , tf.P_ACT=7 , f.Selected=[] , f.Cemetery=[] "]
[iscript]
for(var i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]

*手札構築
[eval exp="tf.P_ACT = tf.P_ACTmax"]
;並び替えたデッキ（山札）から手札に補充
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5],f.Deck[6]]" cond="tf.P_ACTmax>=7"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4],f.Deck[5]]" cond="tf.P_ACTmax==6"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]" cond="tf.P_ACTmax==5"]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3]]" cond="tf.P_ACTmax==4"]

*手札選択
;今回の選択tf.Answerに選択した手札handのカードID（cardに紐づく絶対値）を登録、そのカードのactiveを０に
残呼吸：[emb exp="tf.P_ACT"]　選択済：[emb exp="f.Selected"][r]
[glink color="blue" size="20" x="260" width="150" y="100" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Answer=f.Cards[f.Hand[0]]['id'],f.Cards[f.Hand[0]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[0]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="170" text="&f.Cards[f.Hand[1]]['txt']" exp="tf.Answer=f.Cards[f.Hand[1]]['id'],f.Cards[f.Hand[1]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[1]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="240" text="&f.Cards[f.Hand[2]]['txt']" exp="tf.Answer=f.Cards[f.Hand[2]]['id'],f.Cards[f.Hand[2]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[2]]['active']==1"]
[glink color="blue" size="20" x="260" width="150" y="310" text="&f.Cards[f.Hand[3]]['txt']" exp="tf.Answer=f.Cards[f.Hand[3]]['id'],f.Cards[f.Hand[3]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[3]]['active']==1"]
[if exp="tf.P_ACTmax>=5"]
[glink color="blue" size="20" x="560" width="150" y="100" text="&f.Cards[f.Hand[4]]['txt']" exp="tf.Answer=f.Cards[f.Hand[4]]['id'],f.Cards[f.Hand[4]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[4]]['active']==1"][endif]
[if exp="tf.P_ACTmax>=6"]
[glink color="blue" size="20" x="560" width="150" y="170" text="&f.Cards[f.Hand[5]]['txt']" exp="tf.Answer=f.Cards[f.Hand[5]]['id'],f.Cards[f.Hand[5]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[5]]['active']==1"][endif]
[if exp="tf.P_ACTmax>=7"]
[glink color="blue" size="20" x="560" width="150" y="240" text="&f.Cards[f.Hand[6]]['txt']" exp="tf.Answer=f.Cards[f.Hand[6]]['id'],f.Cards[f.Hand[6]]['active']=0 , tf.P_ACT=tf.P_ACT-1" target="*場札追加" cond="tf.Answer=f.Cards[f.Hand[6]]['active']==1"][endif]
[glink color="blue" size="20" x="560" width="150" y="310" text="戻る" exp="" target="*リセット" ]
[s]

*リセット
;カードの選択済みステータスactiveをリセット,選択済みf.selectedを空に
[eval exp="tf.P_ACT = tf.P_ACTmax"][eval exp="tf.Set = 0"]
[iscript]
f.Cards[f.Hand[0]]['active']=1;
f.Cards[f.Hand[1]]['active']=1;
f.Cards[f.Hand[2]]['active']=1;
f.Cards[f.Hand[3]]['active']=1;
f.Cards[f.Hand[4]]['active']=1;
f.Cards[f.Hand[5]]['active']=1;
f.Cards[f.Hand[6]]['active']=1;
f.Selected=[];
[endscript]
[jump target="*手札選択"]
[s]

*場札追加
;今回の選択answerを選択済みに登録、継続フラグcomb=1なら再選択
[iscript]
f.Selected.push(tf.Answer);
tf.Suite1=1 , tf.Suite2=2;
if(tf.Set>0){
  tf.Suite1 = f.Cards[f.Selected[tf.Set]]['suite'];
  tf.Suite2 = f.Cards[f.Selected[tf.Set-1]]['suite'];
}
[endscript]
[if exp="tf.Suite1 == tf.Suite2"]
[emb exp="f.Cards[f.Selected[0]]['suite']"]ボーナス獲得[p]
[eval exp="tf.P_Cardb1 = tf.P_Cardb1 + 0.3"]
[endif]
[eval exp="tf.Set=tf.Set+1"]
[if exp="f.Cards[tf.Answer]['comb'] == 1"][jump target="*再選択"]
[else][jump target="*選択終了"][endif]
[s]

*再選択
[jump target="*手札選択"]
[s]

*選択終了
;墓地f.cemetaryに今回の手札を追加。山札からも今回の手札を削除。
;演出としては選ばれたカードのみ表面表示。それ以外は裏面表示（＝中身はこの時点でどうでも良くなる）
[iscript]
f.temp=[];
f.temp = f.Cemetery.concat(f.Hand);
f.Cemetery = f.temp;
f.Deck.splice(0,tf.P_ACTmax);
tf.length = f.Deck.length;
[endscript]
選択済：[emb exp="f.Selected"][r]
残山札：[emb exp="f.Deck"][r]
墓地：[emb exp="f.Cemetery"][p]
;アクティベートされたカード枚数でACTを算出
;実際には行動実行時に減算するので不要
[eval exp="tf.dice=3"]

*カードの実行
;選択したカードを1枚目から実行する
;それぞれのカードのtypeを元に攻撃のconfにjump
;カード実行後は戦闘のカードを削除してここに戻す
;選択済みカードが無くなったら攻撃終了
残呼吸：[emb exp="tf.P_ACT"]　選択済：[emb exp="f.Selected"][p]
[iscript]
tf.Len=f.Selected.length;
[endscript]
[jump target="*攻撃終了" cond="tf.Len==0"]
[jump target="*type1" cond="f.Cards[f.Selected[0]]['type']==1"]
[jump target="*type2" cond="f.Cards[f.Selected[0]]['type']==2"]
[jump target="*type3" cond="f.Cards[f.Selected[0]]['type']==3"]
[jump target="*type4" cond="f.Cards[f.Selected[0]]['type']==4"]
[jump target="*type5" cond="f.Cards[f.Selected[0]]['type']==5"]
[jump target="*type6" cond="f.Cards[f.Selected[0]]['type']==6"]
[jump target="*type7" cond="f.Cards[f.Selected[0]]['type']==7"]
[s]

*type1
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type2
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type3
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type4
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type5
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type6
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*type7
[emb exp="f.Cards[f.Selected[0]]['name']"]を実行[p]
[iscript]
f.Selected.splice(0,1)
[endscript]
[jump target="*カードの実行"][s]

*攻撃終了
攻撃終了[p]

*防御選択
[glink color="red" size="20" x="260" width="150" y="100" text="防御" target="*再判定" ]
[glink color="red" size="20" x="260" width="150" y="170" text="回避" exp="tf.P_ACT = tf.P_ACT-1" target="*再判定" cond="tf.P_ACT>0"]
[s]

*再判定
残呼吸：[emb exp="tf.P_ACT"]
[eval exp="tf.dice=tf.dice-1"]
[if exp="tf.dice>0"][jump target="*防御選択"][endif]

*再構築
[iscript]
tf.length = f.Deck.length;
[endscript]
[eval exp="f.Cards[f.Hand[0]]['active']=1"]
[eval exp="f.Cards[f.Hand[1]]['active']=1"]
[eval exp="f.Cards[f.Hand[2]]['active']=1"]
[eval exp="f.Cards[f.Hand[3]]['active']=1"]
[eval exp="f.Cards[f.Hand[4]]['active']=1" cond="tf.P_ACTmax>=5"]
[eval exp="f.Cards[f.Hand[5]]['active']=1" cond="tf.P_ACTmax>=6"]
[eval exp="f.Cards[f.Hand[6]]['active']=1" cond="tf.P_ACTmax>=7"]

[if exp="tf.length < tf.P_ACTmax"][jump target="*山札再構築"]
[elsif exp="tf.length < 1"][jump target="*山札再構築"]
[else][eval exp="f.Selected=[]"][jump target="*手札構築"][endif]
[s]

*山札再構築
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
[jump target="*手札構築"]
[s]
