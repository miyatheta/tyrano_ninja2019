*マクロ
;文法関係
[macro name="lr"]
[l][r]
[endmacro]

[macro name="lrcm"]
[l][r][cm]
[endmacro]

[macro name="wt7"]
[wait time=800][cm]
[endmacro]

[macro name="wt5"]
[wait time=600][cm]
[endmacro]

[macro name="EnName"]
[emb exp="tf.E_HandlName"]
[endmacro]

;レイヤー関係
[macro name="ShowMsg"]
[position layer=message0 visible=true]
[endmacro]

[macro name="HideMsg"]
[position layer=message0 visible=false]
[endmacro]

;数値関係
[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

;ステータス関係
[macro name="Digit"]
[iscript]
x = "UI/number/white/x.png"
function calcStatus(Digit,Point){
  str = "x" + Point;
  len = str.length;
  for(i=len; i<5; i++){str = "x" + str;}
  for(i=4; i>0; i--){
    num = str.substr(i,1);
    Digit[i]="UI/number/white/" + num + ".png";
  }
  return Digit;
}
f.TURNdigit=[];
calcStatus(f.TURNdigit,tf.Turn);

f.P_HPdigit=[];
calcStatus(f.P_HPdigit,tf.P_HP);
f.E_HPdigit=[];
calcStatus(f.E_HPdigit,tf.E_HP);

f.P_EROdigit=[];
calcStatus(f.P_EROdigit,tf.P_ERO);
f.E_EROdigit=[];
calcStatus(f.E_EROdigit,tf.E_ERO);

f.P_MGPdigit=[];
calcStatus(f.P_MGPdigit,f.P_MGP);
f.E_MGPdigit=[];
calcStatus(f.E_MGPdigit,f.E_MGP);

f.P_ACTdigit=[];
calcStatus(f.P_ACTdigit,tf.P_ACT);
f.E_ACTdigit=[];
calcStatus(f.E_ACTdigit,tf.E_ACT);

f.P_EXHdigit=[];
calcStatus(f.P_EXHdigit,f.P_EXH);
f.P_APPdigit=[];
calcStatus(f.P_APPdigit,tf.P_APP);
[endscript]
[endmacro]

[macro name="showStatus---"]
;◆↓パラメーターバーの枠などを描画するサブルーチンを呼び出しますdraw_para_bar_base
;◆↓パラメーターバー枠と枠内側の黒っぽい部分の横幅を設定
[eval exp ="f.para_bar_waku_width = f.para_bar_width + 4"]
[eval exp ="f.para_bar_empty_width = f.para_bar_width + 2"]
[eval exp ="f.para_bar_waku_width_En = f.para_bar_width_En + 4"]
[eval exp ="f.para_bar_empty_width_En = f.para_bar_width_En + 2"]
;◆↓パラメーターバー描画に使うレイヤーをアクティブに
[layopt layer=8 visible=true]
[layopt layer=9 visible=true]
;◆↓図形部分の描画
[image layer=8 x=180 y=15 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=15 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=180 y=30 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=30 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]

[image layer=8 x=630 y=15 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=15 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=630 y=30 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=30 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
;◆↓テキスト部分の描画

;◆◆↓パラメーターのHPバー、HP数値表示など可変部分をレイヤー9に描画しますdraw_para_bar
;◆↓可変部分の描画を一旦消します
[freeimage layer = 9]
;◆↓HP値によりHPバーの長さを計算
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.P_HP / f.BaseHP)"]
[eval exp="f.para_bar_EnHP_now_width = parseInt(f.para_bar_width_En * f.EnHP / f.BaseEnHP)"]
;◆↓HP最大値の3割以下にHP値が減ると赤いバーで描画、それよりHP値が高ければ緑色のバーで描画
[if exp="f.P_HP <= parseInt(f.BaseHP * 0.3)"]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_FP_now_width = parseInt(f.para_bar_width * f.FP / 100)"]
[image layer=9 x=182 y=30 width=&f.para_bar_FP_now_width height=10 storage="UI/parameter/bar_blue.png"]
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.P_HP / f.BaseHP)"]

[if exp="f.EnHP <= parseInt(f.BaseEnHP * 0.3)"]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_EnFP_now_width = parseInt(f.para_bar_width * f.EnFP / 100)"]
[image layer=9 x=632 y=30 width=&f.para_bar_EnFP_now_width height=10 storage="UI/parameter/bar_blue.png"]

;↓テキスト部分の描画
[Digit]
[freeimage layer=1]
[image layer=1 storage="&f.TURNdigit[3]" width="40" top="10" left="420" visible="true"]
[image layer=1 storage="&f.TURNdigit[4]" width="40" top="10" left="450" visible="true"]

[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="30" visible="true"]
[image layer=1 storage="&f.P_HPdigit[1]" width="20" top="10" left="95" visible="true"]
[image layer=1 storage="&f.P_HPdigit[2]" width="20" top="10" left="115" visible="true"]
[image layer=1 storage="&f.P_HPdigit[3]" width="20" top="10" left="135" visible="true"]
[image layer=1 storage="&f.P_HPdigit[4]" width="20" top="10" left="155" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="30" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[1]" width="20" top="30" left="95" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[2]" width="20" top="30" left="110" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[3]" width="20" top="30" left="135" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[4]" width="20" top="30" left="155" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="290" visible="true"]
[image layer=1 storage="&f.P_ACTdigit[2]" width="20" top="30" left="350" visible="true"]
[image layer=1 storage="&f.P_ACTdigit[3]" width="20" top="30" left="375" visible="true"]
[image layer=1 storage="&f.P_ACTdigit[4]" width="20" top="30" left="395" visible="true"]

[image layer=1 storage="UI/number/疲労.png" width="75" top="460" left="0" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[1]" width="20" top="460" left="50" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[2]" width="20" top="460" left="70" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[3]" width="20" top="460" left="90" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[4]" width="20" top="460" left="110" visible="true"]

[image layer=1 storage="UI/number/淫らさ.png" width="75" top="480" left="0" visible="true"]
[image layer=1 storage="&f.P_EROdigit[1]" width="20" top="480" left="50" visible="true"]
[image layer=1 storage="&f.P_EROdigit[2]" width="20" top="480" left="70" visible="true"]
[image layer=1 storage="&f.P_EROdigit[3]" width="20" top="480" left="90" visible="true"]
[image layer=1 storage="&f.P_EROdigit[4]" width="20" top="480" left="110" visible="true"]

[image layer=1 storage="UI/number/色気.png" width="75" top="500" left="0" visible="true"]
[image layer=1 storage="&f.P_APPdigit[1]" width="20" top="500" left="50" visible="true"]
[image layer=1 storage="&f.P_APPdigit[2]" width="20" top="500" left="70" visible="true"]
[image layer=1 storage="&f.P_APPdigit[3]" width="20" top="500" left="90" visible="true"]
[image layer=1 storage="&f.P_APPdigit[4]" width="20" top="500" left="110" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="540" left="0" visible="true"]
[image layer=1 storage="&f.P_EROdigit[1]" width="20" top="540" left="50" visible="true"]
[image layer=1 storage="&f.P_EROdigit[2]" width="20" top="540" left="70" visible="true"]
[image layer=1 storage="&f.P_EROdigit[3]" width="20" top="540" left="90" visible="true"]
[image layer=1 storage="&f.P_EROdigit[4]" width="20" top="540" left="110" visible="true"]

[image layer=1 storage="UI/number/敵名.png" width="75" top="480" left="890" visible="true"]

[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="850" visible="true"]
[image layer=1 storage="&f.E_HPdigit[1]" width="20" top="10" left="755" visible="true"]
[image layer=1 storage="&f.E_HPdigit[2]" width="20" top="10" left="780" visible="true"]
[image layer=1 storage="&f.E_HPdigit[3]" width="20" top="10" left="805" visible="true"]
[image layer=1 storage="&f.E_HPdigit[4]" width="20" top="10" left="830" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="850" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[1]" width="20" top="30" left="755" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[2]" width="20" top="30" left="780" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[3]" width="20" top="30" left="805" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[4]" width="20" top="30" left="830" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="550" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[1]" width="20" top="30" left="455" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[2]" width="20" top="30" left="480" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[3]" width="20" top="30" left="505" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[4]" width="20" top="30" left="530" visible="true"]

[image layer=1 storage="UI/number/興奮.png" width="75" top="520" left="890" visible="true"]
[image layer=1 storage="&f.E_EROdigit[1]" width="20" top="520" left="795" visible="true"]
[image layer=1 storage="&f.E_EROdigit[2]" width="20" top="520" left="820" visible="true"]
[image layer=1 storage="&f.E_EROdigit[3]" width="20" top="520" left="845" visible="true"]
[image layer=1 storage="&f.E_EROdigit[4]" width="20" top="520" left="870" visible="true"]

[endmacro]

[macro name="showStatus_H"]
/*
;◆↓パラメーターバーの枠などを描画するサブルーチンを呼び出しますdraw_para_bar_base
;◆↓パラメーターバー枠と枠内側の黒っぽい部分の横幅を設定
[eval exp ="f.para_bar_waku_width = f.para_bar_width + 4"]
[eval exp ="f.para_bar_empty_width = f.para_bar_width + 2"]
[eval exp ="f.para_bar_waku_width_En = f.para_bar_width_En + 4"]
[eval exp ="f.para_bar_empty_width_En = f.para_bar_width_En + 2"]
;◆↓パラメーターバー描画に使うレイヤーをアクティブに
[layopt layer=8 visible=true]
[layopt layer=9 visible=true]
;◆↓図形部分の描画
[image layer=8 x=180 y=15 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=15 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=180 y=30 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=30 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]

[image layer=8 x=630 y=15 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=15 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=630 y=30 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=30 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
;◆↓テキスト部分の描画

;◆◆↓パラメーターのHPバー、HP数値表示など可変部分をレイヤー9に描画しますdraw_para_bar
;◆↓可変部分の描画を一旦消します
[freeimage layer = 9]
;◆↓HP値によりHPバーの長さを計算
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.P_HP / f.BaseHP)"]
[eval exp="f.para_bar_EnHP_now_width = parseInt(f.para_bar_width_En * f.EnHP / f.BaseEnHP)"]
;◆↓HP最大値の3割以下にHP値が減ると赤いバーで描画、それよりHP値が高ければ緑色のバーで描画
[if exp="f.P_HP <= parseInt(f.BaseHP * 0.3)"]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_FP_now_width = parseInt(f.para_bar_width * f.FP / 100)"]
[image layer=9 x=182 y=30 width=&f.para_bar_FP_now_width height=10 storage="UI/parameter/bar_blue.png"]
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.P_HP / f.BaseHP)"]

[if exp="f.EnHP <= parseInt(f.BaseEnHP * 0.3)"]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_EnFP_now_width = parseInt(f.para_bar_width * f.EnFP / 100)"]
[image layer=9 x=632 y=30 width=&f.para_bar_EnFP_now_width height=10 storage="UI/parameter/bar_blue.png"]
 */
;↓テキスト部分の描画
[freeimage layer = 1]
/*
[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="30" visible="true"]
[image layer=1 storage="&f.P_HPdigit[1]" width="20" top="10" left="95" visible="true"]
[image layer=1 storage="&f.P_HPdigit[2]" width="20" top="10" left="115" visible="true"]
[image layer=1 storage="&f.P_HPdigit[3]" width="20" top="10" left="135" visible="true"]
[image layer=1 storage="&f.P_HPdigit[4]" width="20" top="10" left="155" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="30" visible="true"]
[image layer=1 storage="&f.FPdigit[1]" width="20" top="30" left="95" visible="true"]
[image layer=1 storage="&f.FPdigit[2]" width="20" top="30" left="110" visible="true"]
[image layer=1 storage="&f.FPdigit[3]" width="20" top="30" left="135" visible="true"]
[image layer=1 storage="&f.FPdigit[4]" width="20" top="30" left="155" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="290" visible="true"]
[image layer=1 storage="&f.SPDdigit[2]" width="20" top="30" left="350" visible="true"]
[image layer=1 storage="&f.SPDdigit[3]" width="20" top="30" left="375" visible="true"]
[image layer=1 storage="&f.SPDdigit[4]" width="20" top="30" left="395" visible="true"]
 */
[image layer=1 storage="UI/number/疲労.png" width="75" top="460" left="0" visible="true"]
[image layer=1 storage="&f.TIRdigit[1]" width="20" top="460" left="50" visible="true"]
[image layer=1 storage="&f.TIRdigit[2]" width="20" top="460" left="70" visible="true"]
[image layer=1 storage="&f.TIRdigit[3]" width="20" top="460" left="90" visible="true"]
[image layer=1 storage="&f.TIRdigit[4]" width="20" top="460" left="110" visible="true"]

[image layer=1 storage="UI/number/淫らさ.png" width="75" top="480" left="0" visible="true"]
[image layer=1 storage="&f.ARSdigit[1]" width="20" top="480" left="50" visible="true"]
[image layer=1 storage="&f.ARSdigit[2]" width="20" top="480" left="70" visible="true"]
[image layer=1 storage="&f.ARSdigit[3]" width="20" top="480" left="90" visible="true"]
[image layer=1 storage="&f.ARSdigit[4]" width="20" top="480" left="110" visible="true"]

[image layer=1 storage="UI/number/色気.png" width="75" top="500" left="0" visible="true"]
[image layer=1 storage="&f.APPdigit[1]" width="20" top="500" left="50" visible="true"]
[image layer=1 storage="&f.APPdigit[2]" width="20" top="500" left="70" visible="true"]
[image layer=1 storage="&f.APPdigit[3]" width="20" top="500" left="90" visible="true"]
[image layer=1 storage="&f.APPdigit[4]" width="20" top="500" left="110" visible="true"]

[image layer=1 storage="UI/number/感度.png" width="75" top="520" left="0" visible="true"]
[image layer=1 storage="&f.SENdigit[1]" width="20" top="520" left="50" visible="true"]
[image layer=1 storage="&f.SENdigit[2]" width="20" top="520" left="70" visible="true"]
[image layer=1 storage="&f.SENdigit[3]" width="20" top="520" left="90" visible="true"]
[image layer=1 storage="&f.SENdigit[4]" width="20" top="520" left="110" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="540" left="0" visible="true"]
[image layer=1 storage="&f.EROdigit[1]" width="20" top="540" left="50" visible="true"]
[image layer=1 storage="&f.EROdigit[2]" width="20" top="540" left="70" visible="true"]
[image layer=1 storage="&f.EROdigit[3]" width="20" top="540" left="90" visible="true"]
[image layer=1 storage="&f.EROdigit[4]" width="20" top="540" left="110" visible="true"]

[image layer=1 storage="UI/number/理性.png" width="75" top="560" left="0" visible="true"]
[image layer=1 storage="&f.MNDdigit[1]" width="20" top="560" left="50" visible="true"]
[image layer=1 storage="&f.MNDdigit[2]" width="20" top="560" left="70" visible="true"]
[image layer=1 storage="&f.MNDdigit[3]" width="20" top="560" left="90" visible="true"]
[image layer=1 storage="&f.MNDdigit[4]" width="20" top="560" left="110" visible="true"]

[image layer=1 storage="UI/number/戦意.png" width="75" top="580" left="0" visible="true"]
[image layer=1 storage="&f.POWdigit[1]" width="20" top="580" left="50" visible="true"]
[image layer=1 storage="&f.POWdigit[2]" width="20" top="580" left="70" visible="true"]
[image layer=1 storage="&f.POWdigit[3]" width="20" top="580" left="90" visible="true"]
[image layer=1 storage="&f.POWdigit[4]" width="20" top="580" left="110" visible="true"]

[image layer=1 storage="UI/number/敵名.png" width="75" top="480" left="850" visible="true"]
/*
[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="850" visible="true"]
[image layer=1 storage="&f.EnHPdigit[1]" width="20" top="10" left="755" visible="true"]
[image layer=1 storage="&f.EnHPdigit[2]" width="20" top="10" left="780" visible="true"]
[image layer=1 storage="&f.EnHPdigit[3]" width="20" top="10" left="805" visible="true"]
[image layer=1 storage="&f.EnHPdigit[4]" width="20" top="10" left="830" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="850" visible="true"]
[image layer=1 storage="&f.EnFPdigit[1]" width="20" top="30" left="755" visible="true"]
[image layer=1 storage="&f.EnFPdigit[2]" width="20" top="30" left="780" visible="true"]
[image layer=1 storage="&f.EnFPdigit[3]" width="20" top="30" left="805" visible="true"]
[image layer=1 storage="&f.EnFPdigit[4]" width="20" top="30" left="830" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="550" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[1]" width="20" top="30" left="455" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[2]" width="20" top="30" left="480" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[3]" width="20" top="30" left="505" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[4]" width="20" top="30" left="530" visible="true"]
 */
[image layer=1 storage="UI/number/興奮.png" width="75" top="520" left="890" visible="true"]
[image layer=1 storage="&f.EnEROdigit[1]" width="20" top="520" left="795" visible="true"]
[image layer=1 storage="&f.EnEROdigit[2]" width="20" top="520" left="820" visible="true"]
[image layer=1 storage="&f.EnEROdigit[3]" width="20" top="520" left="845" visible="true"]
[image layer=1 storage="&f.EnEROdigit[4]" width="20" top="520" left="870" visible="true"]

[image layer=1 storage="UI/number/理性.png" width="75" top="540" left="890" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[1]" width="20" top="540" left="795" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[2]" width="20" top="540" left="820" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[3]" width="20" top="540" left="845" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[4]" width="20" top="540" left="870" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="560" left="890" visible="true"]
[image layer=1 storage="&f.EnErectdigit[1]" width="20" top="560" left="795" visible="true"]
[image layer=1 storage="&f.EnErectdigit[2]" width="20" top="560" left="820" visible="true"]
[image layer=1 storage="&f.EnErectdigit[3]" width="20" top="560" left="845" visible="true"]
[image layer=1 storage="&f.EnErectdigit[4]" width="20" top="560" left="870" visible="true"]

[endmacro]


[macro name="WriteStatus"]
;↓テキスト部分の描画
[Digit]
[freeimage layer=1]
[image layer=1 storage="&f.TURNdigit[3]" width="40" top="10" left="420" visible="true"]
[image layer=1 storage="&f.TURNdigit[4]" width="40" top="10" left="450" visible="true"]

[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="30" visible="true"]
[image layer=1 storage="&f.P_HPdigit[1]" width="20" top="10" left="95" visible="true"]
[image layer=1 storage="&f.P_HPdigit[2]" width="20" top="10" left="115" visible="true"]
[image layer=1 storage="&f.P_HPdigit[3]" width="20" top="10" left="135" visible="true"]
[image layer=1 storage="&f.P_HPdigit[4]" width="20" top="10" left="155" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="30" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[1]" width="20" top="30" left="95" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[2]" width="20" top="30" left="110" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[3]" width="20" top="30" left="135" visible="true"]
[image layer=1 storage="&f.P_MGPdigit[4]" width="20" top="30" left="155" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="290" visible="true"]
[image layer=1 storage="&f.P_ACTdigit[2]" width="20" top="30" left="350" visible="true"]
[image layer=1 storage="&f.P_ACTdigit[3]" width="20" top="30" left="375" visible="true"]
[image layer=1 storage="&f.P_ACTdigit[4]" width="20" top="30" left="395" visible="true"]

[image layer=1 storage="UI/number/疲労.png" width="75" top="50" left="0" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[1]" width="20" top="50" left="50" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[2]" width="20" top="50" left="70" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[3]" width="20" top="50" left="90" visible="true"]
[image layer=1 storage="&f.P_EXHdigit[4]" width="20" top="50" left="110" visible="true"]

[image layer=1 storage="UI/number/色気.png" width="75" top="70" left="0" visible="true"]
[image layer=1 storage="&f.P_APPdigit[1]" width="20" top="70" left="50" visible="true"]
[image layer=1 storage="&f.P_APPdigit[2]" width="20" top="70" left="70" visible="true"]
[image layer=1 storage="&f.P_APPdigit[3]" width="20" top="70" left="90" visible="true"]
[image layer=1 storage="&f.P_APPdigit[4]" width="20" top="70" left="110" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="90" left="0" visible="true"]
[image layer=1 storage="&f.P_EROdigit[1]" width="20" top="90" left="50" visible="true"]
[image layer=1 storage="&f.P_EROdigit[2]" width="20" top="90" left="70" visible="true"]
[image layer=1 storage="&f.P_EROdigit[3]" width="20" top="90" left="90" visible="true"]
[image layer=1 storage="&f.P_EROdigit[4]" width="20" top="90" left="110" visible="true"]

[image layer=1 storage="UI/number/敵名.png" width="75" top="50" left="890" visible="true"]

[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="850" visible="true"]
[image layer=1 storage="&f.E_HPdigit[1]" width="20" top="10" left="755" visible="true"]
[image layer=1 storage="&f.E_HPdigit[2]" width="20" top="10" left="780" visible="true"]
[image layer=1 storage="&f.E_HPdigit[3]" width="20" top="10" left="805" visible="true"]
[image layer=1 storage="&f.E_HPdigit[4]" width="20" top="10" left="830" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="850" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[1]" width="20" top="30" left="755" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[2]" width="20" top="30" left="780" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[3]" width="20" top="30" left="805" visible="true"]
[image layer=1 storage="&f.E_MGPdigit[4]" width="20" top="30" left="830" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="550" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[1]" width="20" top="30" left="455" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[2]" width="20" top="30" left="70" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[3]" width="20" top="30" left="505" visible="true"]
[image layer=1 storage="&f.E_ACTdigit[4]" width="20" top="30" left="530" visible="true"]

[image layer=1 storage="UI/number/興奮.png" width="75" top="90" left="890" visible="true"]
[image layer=1 storage="&f.E_EROdigit[1]" width="20" top="90" left="795" visible="true"]
[image layer=1 storage="&f.E_EROdigit[2]" width="20" top="90" left="820" visible="true"]
[image layer=1 storage="&f.E_EROdigit[3]" width="20" top="90" left="845" visible="true"]
[image layer=1 storage="&f.E_EROdigit[4]" width="20" top="90" left="870" visible="true"]
[endmacro]

[macro name="hideStatus"]
[freeimage layer=1]
[freeimage layer=2]
[freeimage layer=3]
[freeimage layer=4]
[freeimage layer=5]
[freeimage layer=8]
[freeimage layer=9]
[endmacro]

;戦闘関連
[macro name="Masochism"]
[iscript]
tf.Damage = Math.floor(3 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Estrus"]
[iscript]
tf.Damage = Math.floor(3 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Parasite"]
[iscript]
tf.Damage = Math.floor(5 * f.SEN / 100);
[endscript]
[endmacro]

;新規追加部分
[macro name="enemyname"]
[emb exp="tf.E_name"]
[endmacro]

[macro name="enemy_attack_mt"]
[emb exp="tf.E_attack_mt"]
[endmacro]

[macro name="enemy_attack_1"]
[emb exp="tf.E_attack_1"]
[endmacro]

[macro name="enemy_attack_2"]
[emb exp="tf.E_attack_2"]
[endmacro]

[macro name="enemy_attack_ex"]
[emb exp="tf.E_attack_ex"]
[endmacro]

[macro name="GoSKB"]
[Calc_Status]
[eval exp="tf.GoSKB = 0"]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[eval exp="tf.SKB=(50 + tf.E_SAN) - Math.floor(tf.E_ERO/2 + (tf.P_APP + tf.ArousAPPb - tf.E_APP)*5)"]
[eval exp="tf.GoSKB = 1" cond="tf.E_ERO >= 50 && tf.dice> tf.SKB"]
[endmacro]

[macro name="SUKEBE"]
;欲情＝敵の性技技能値×行為の基礎倍率×欲情状態のデバフ×セクハラへの防御状態×理性による減衰
[eval exp="tf.Yokujo = Math.floor(tf.E_SEX * tf.RATE * tf.ArousSEXd * (1 - tf.P_DefSKBb1) * (100 - tf.P_SAN)/100)"]
;快感＝敵の性技技能値×行為の基礎倍率×欲情状態のデバフ×セクハラへの防御状態×欲情度による倍率
[eval exp="tf.Kaikan = Math.floor(tf.E_SEX * tf.RATE * tf.ArousSEXd * (1 - tf.P_DefSKBb1) * (tf.P_SEN * f.P_SENboost ) / 100 * (tf.P_ERO + 50)/100)"]
[endmacro]

[macro name="limit"]
[eval exp="tf.P_HP = 0" cond="tf.P_HP < 0"]
[eval exp="tf.E_HP = 0" cond="tf.E_HP < 0"]
[eval exp="f.P_EXH = 100" cond="f.P_EXH > 100"]
[eval exp="f.P_MGP = 100" cond="f.P_MGP > 100"]
[eval exp="f.E_MGP = 100" cond="f.E_MGP > 100"]
[eval exp="f.P_MGP = 0" cond="f.P_MGP < 0"]
[eval exp="f.P_LUK = 5" cond="f.P_LUK > 5"]
[eval exp="f.P_LUK = 0" cond="f.P_LUK < 0"]
[eval exp="tf.P_ERO = 999" cond="tf.P_ERO > 999"]
[eval exp="tf.P_ERO = 0" cond="tf.P_ERO < 0"]
[eval exp="tf.E_ERO = 999" cond="tf.E_ERO > 999"]
[eval exp="tf.E_ERO = 0" cond="tf.E_ERO < 0"]
[eval exp="tf.P_ACT = 0" cond="tf.P_ACT < 0"]
[eval exp="tf.E_ACT = 0" cond="tf.E_ACT < 0"]
[eval exp="tf.AvoidRate = 0" cond="tf.AvoidRate < 0"]
[eval exp="tf.AvoidRate = 100" cond="tf.AvoidRate > 100"]
[eval exp="tf.E_ACT = f.E_ACT" cond="tf.E_ACT > f.E_ACT"]
[eval exp="tf.P_ACT = tf.P_ACTmax" cond="tf.P_ACT > tf.P_ACTmax"]
[eval exp="tf.P_ARMOR = 0" cond="tf.P_ARMOR < 0"]
[endmacro]

[macro name="Calc_Status"]
;evalだと括弧を計算順序が考慮しない
[iscript]
tf.P_STR = f.P_STR * ( 1 - tf.P_STRd3 - tf.P_STRd1 + tf.P_STRb3 + tf.P_STRb1 ) * tf.ArousSTRd;
tf.P_DUR = f.P_DUR * ( 1 - tf.P_DURd3 - tf.P_DURd1 + tf.P_DURb3 + tf.P_DURb1 );
tf.P_AGI = f.P_AGI * ( 1 - tf.P_AGId3 - tf.P_AGId1 + tf.P_AGIb3 + tf.P_AGIb1 ) * tf.ArousAGId;
tf.P_DEX = f.P_DEX * ( 1 - tf.P_DEXd3 - tf.P_DEXd1 + tf.P_DEXb3 + tf.P_DEXb1 ) * tf.ArousDEXd;
tf.P_POW = f.P_POW * ( 1 - tf.P_POWd3 - tf.P_POWd1 + tf.P_POWb3 + tf.P_POWb1 );
tf.P_MND = f.P_MND * ( 1 - tf.P_MNDd3 - tf.P_MNDd1 + tf.P_MNDb3 + tf.P_MNDb1 );
tf.P_APP = f.P_APP * ( 1 - tf.P_APPd3 - tf.P_APPd1 + tf.P_APPb3 + tf.P_APPb1 + (2 - tf.P_DRESS) );

tf.E_STR = f.E_STR * ( 1  - tf.E_STRd3 - tf.E_STRd1 + tf.E_STRb3 + tf.E_STRb1 );
tf.E_DUR = f.E_DUR * ( 1  - tf.E_DURd3 - tf.E_DURd1 + tf.E_DURb3 + tf.E_DURb1 );
tf.E_AGI = f.E_AGI * ( 1  - tf.E_AGId3 - tf.E_AGId1 + tf.E_AGIb3 + tf.E_AGIb1 );
tf.E_DEX = f.E_DEX * ( 1  - tf.E_DEXd3 - tf.E_DEXd1 + tf.E_DEXb3 + tf.E_DEXb1 );
tf.E_POW = f.E_POW * ( 1  - tf.E_POWd3 - tf.E_POWd1 + tf.E_POWb3 + tf.E_POWb1 );
tf.E_MND = f.E_MND * ( 1 - tf.E_MNDd3 - tf.E_MNDd1 + tf.E_MNDb3 + tf.E_MNDb1 );
tf.E_APP = f.E_APP * ( 1  - tf.E_APPd3 - tf.E_APPd1 + tf.E_APPb3 + tf.E_APPb1 );
[endscript]
[endmacro]

[macro name="Initialize_PL_1Tbuff"]
;PLのスキルによる効果
[eval exp="tf.P_STRb1=0 , tf.P_DURb1=0 , tf.P_AGIb1=0 , tf.P_DEXb1=0 , tf.P_POWb1=0 , tf.P_MNDb1=0 , tf.P_APPb1=0 , tf.P_LUKb1=0 , tf.P_DefSKBb1=0"]
[eval exp="tf.E_STRd1=0 , tf.E_DURd1=0 , tf.E_AGId1=0 , tf.E_DEXd1=0 , tf.E_POWd1=0 , tf.E_MNDd1=0 , tf.E_APPd1=0 , tf.E_LUKd1=0"]
[endmacro]

[macro name="Initialize_EN_1Tbuff"]
;敵のスキルによる効果
[eval exp="tf.P_STRd1=0 , tf.P_DURd1=0 , tf.P_AGId1=0 , tf.P_DEXd1=0 , tf.P_POWd1=0 , tf.P_MNDd1=0 , tf.P_APPd1=0 , tf.P_LUKd1=0"]
[eval exp="tf.E_STRb1=0 , tf.E_DURb1=0 , tf.E_AGIb1=0 , tf.E_DEXb1=0 , tf.E_POWb1=0 , tf.E_MNDb1=0 , tf.E_APPb1=0 , tf.E_LUKb1=0"]
[endmacro]

[macro name="Initialize_3Tbuff"]
[eval exp="tf.P_STRd3=0 , tf.P_DURd3=0 , tf.P_AGId3=0 , tf.P_DEXd3=0 , tf.P_POWd3=0 , tf.P_MNDd3=0 , tf.P_APPd3=0"]
[eval exp="tf.P_STRd3_count=1 , tf.P_DURd3_count=1 , tf.P_AGId3_count=1 , tf.P_DEXd3_count=1 , tf.P_POWd3_count=1 , tf.P_MNDd3_count=1 , tf.P_APPd3_count=1"]

[eval exp="tf.P_STRb3=0 , tf.P_DURb3=0 , tf.P_AGIb3=0 , tf.P_DEXb3=0 , tf.P_POWb3=0 , tf.P_MNDb3=0 , tf.P_APPb3=0"]
[eval exp="tf.P_STRb3_count=1 , tf.P_DURb3_count=1 , tf.P_AGIb3_count=1 , tf.P_DEXb3_count=1 , tf.P_POWb3_count=1 , tf.P_MNDb3_count=1 , tf.P_APPb3_count=1"]

[eval exp="tf.E_STRd3=0 , tf.E_DURd3=0 , tf.E_AGId3=0 , tf.E_DEXd3=0 , tf.E_POWd3=0 , tf.E_MNDd3=0 , tf.E_APPd3=0"]
[eval exp="tf.E_STRd3_count=1 , tf.E_DURd3_count=1 , tf.E_AGId3_count=1 , tf.E_DEXd3_count=1 , tf.E_POWd3_count=1 , tf.E_MNDd3_count=1 , tf.E_APPd3_count=1"]

[eval exp="tf.E_STRb3=0 , tf.E_DURb3=0 , tf.E_AGIb3=0 , tf.E_DEXb3=0 , tf.E_POWb3=0 , tf.E_MNDb3=1 , tf.E_APPb3=0"]
[eval exp="tf.E_STRb3_count=1 , tf.E_DURb3_count=1 , tf.E_AGIb3_count=1 , tf.E_DEXb3_count=1 , tf.E_POWb3_count=1 , tf.E_MNDb3_count=1 , tf.E_APPb3_count=1"]
;魅了のデバフ
[eval exp="tf.E_charm_STR=1 , tf.E_charm_DUR=1 , tf.E_charm_count=1"]
;怒り
[eval exp="tf.E_anger_count=1 "]
[endmacro]

[macro name="Refresh_3Tbuff"]
[eval exp="tf.P_STRd3_count = tf.P_STRd3_count-1" cond="tf.P_STRd3_count>1"][eval exp="tf.P_STRd3=0 ,tf.P_STRd3_count=0" cond="tf.P_STRd3_count==1"]
[eval exp="tf.P_DURd3_count = tf.P_DURd3_count-1" cond="tf.P_DURd3_count>1"][eval exp="tf.P_DURd3=0 ,tf.P_DURd3_count=0" cond="tf.P_DURd3_count==1"]
[eval exp="tf.P_AGId3_count = tf.P_AGId3_count-1" cond="tf.P_AGId3_count>1"][eval exp="tf.P_AGId3=0 ,tf.P_AGId3_count=0" cond="tf.P_AGId3_count==1"]
[eval exp="tf.P_DEXd3_count = tf.P_DEXd3_count-1" cond="tf.P_DEXd3_count>1"][eval exp="tf.P_DEXd3=0 ,tf.P_DEXd3_count=0" cond="tf.P_DEXd3_count==1"]
[eval exp="tf.P_POWd3_count = tf.P_POWd3_count-1" cond="tf.P_POWd3_count>1"][eval exp="tf.P_POWd3=0 ,tf.P_POWd3_count=0" cond="tf.P_POWd3_count==1"]
[eval exp="tf.P_MNDd3_count = tf.P_MNDd3_count-1" cond="tf.P_MNDd3_count>1"][eval exp="tf.P_MNDd3=0 ,tf.P_MNDd3_count=0" cond="tf.P_MNDd3_count==1"]
[eval exp="tf.P_APPd3_count = tf.P_APPd3_count-1" cond="tf.P_APPd3_count>1"][eval exp="tf.P_APPd3=0 ,tf.P_APPd3_count=0" cond="tf.P_APPd3_count==1"]
[eval exp="tf.P_STRb3_count = tf.P_STRb3_count-1" cond="tf.P_STRb3_count>1"][eval exp="tf.P_STRb3=0 ,tf.P_STRb3_count=0" cond="tf.P_STRb3_count==1"]
[eval exp="tf.P_DURb3_count = tf.P_DURb3_count-1" cond="tf.P_DURb3_count>1"][eval exp="tf.P_DURb3=0 ,tf.P_DURb3_count=0" cond="tf.P_DURb3_count==1"]
[eval exp="tf.P_AGIb3_count = tf.P_AGIb3_count-1" cond="tf.P_AGIb3_count>1"][eval exp="tf.P_AGIb3=0 ,tf.P_AGIb3_count=0" cond="tf.P_AGIb3_count==1"]
[eval exp="tf.P_DEXb3_count = tf.P_DEXb3_count-1" cond="tf.P_DEXb3_count>1"][eval exp="tf.P_DEXb3=0 ,tf.P_DEXb3_count=0" cond="tf.P_DEXb3_count==1"]
[eval exp="tf.P_POWb3_count = tf.P_POWb3_count-1" cond="tf.P_POWb3_count>1"][eval exp="tf.P_POWb3=0 ,tf.P_POWb3_count=0" cond="tf.P_POWb3_count==1"]
[eval exp="tf.P_MNDb3_count = tf.P_MNDb3_count-1" cond="tf.P_MNDb3_count>1"][eval exp="tf.P_MNDb3=0 ,tf.P_MNDb3_count=0" cond="tf.P_MNDb3_count==1"]
[eval exp="tf.P_APPb3_count = tf.P_APPb3_count-1" cond="tf.P_APPb3_count>1"][eval exp="tf.P_APPb3=0 ,tf.P_APPb3_count=0" cond="tf.P_APPb3_count==1"]

[eval exp="tf.E_STRd3_count = tf.E_STRd3_count-1" cond="tf.E_STRd3_count>1"][eval exp="tf.E_STRd3=0 ,tf.E_STRd3_count=0" cond="tf.E_STRd3_count==1"]
[eval exp="tf.E_DURd3_count = tf.E_DURd3_count-1" cond="tf.E_DURd3_count>1"][eval exp="tf.E_DURd3=0 ,tf.E_DURd3_count=0" cond="tf.E_DURd3_count==1"]
[eval exp="tf.E_AGId3_count = tf.E_AGId3_count-1" cond="tf.E_AGId3_count>1"][eval exp="tf.E_AGId3=0 ,tf.E_AGId3_count=0" cond="tf.E_AGId3_count==1"]
[eval exp="tf.E_DEXd3_count = tf.E_DEXd3_count-1" cond="tf.E_DEXd3_count>1"][eval exp="tf.E_DEXd3=0 ,tf.E_DEXd3_count=0" cond="tf.E_DEXd3_count==1"]
[eval exp="tf.E_POWd3_count = tf.E_POWd3_count-1" cond="tf.E_POWd3_count>1"][eval exp="tf.E_POWd3=0 ,tf.E_POWd3_count=0" cond="tf.E_POWd3_count==1"]
[eval exp="tf.E_MNDd3_count = tf.E_MNDd3_count-1" cond="tf.E_MNDd3_count>1"][eval exp="tf.E_MNDd3=0 ,tf.E_MNDd3_count=0" cond="tf.E_MNDd3_count==1"]
[eval exp="tf.E_APPd3_count = tf.E_APPd3_count-1" cond="tf.E_APPd3_count>1"][eval exp="tf.E_APPd3=0 ,tf.E_APPd3_count=0" cond="tf.E_APPd3_count==1"]
[eval exp="tf.E_STRb3_count = tf.E_STRb3_count-1" cond="tf.E_STRb3_count>1"][eval exp="tf.E_STRb3=0 ,tf.E_STRb3_count=0" cond="tf.E_STRb3_count==1"]
[eval exp="tf.E_DURb3_count = tf.E_DURb3_count-1" cond="tf.E_DURb3_count>1"][eval exp="tf.E_DURb3=0 ,tf.E_DURb3_count=0" cond="tf.E_DURb3_count==1"]
[eval exp="tf.E_AGIb3_count = tf.E_AGIb3_count-1" cond="tf.E_AGIb3_count>1"][eval exp="tf.E_AGIb3=0 ,tf.E_AGIb3_count=0" cond="tf.E_AGIb3_count==1"]
[eval exp="tf.E_DEXb3_count = tf.E_DEXb3_count-1" cond="tf.E_DEXb3_count>1"][eval exp="tf.E_DEXb3=0 ,tf.E_DEXb3_count=0" cond="tf.E_DEXb3_count==1"]
[eval exp="tf.E_POWb3_count = tf.E_POWb3_count-1" cond="tf.E_POWb3_count>1"][eval exp="tf.E_POWb3=0 ,tf.E_POWb3_count=0" cond="tf.E_POWb3_count==1"]
[eval exp="tf.E_MNDb3_count = tf.E_MNDb3_count-1" cond="tf.E_MNDb3_count>1"][eval exp="tf.E_MNDb3=0 ,tf.E_MNDb3_count=0" cond="tf.E_MNDb3_count==1"]
[eval exp="tf.E_APPb3_count = tf.E_APPb3_count-1" cond="tf.E_APPb3_count>1"][eval exp="tf.E_APPb3=0 ,tf.E_APPb3_count=0" cond="tf.E_APPb3_count==1"]

[eval exp="tf.E_charm_count = tf.E_charm_count-1" cond="tf.E_charm_count>1"][eval exp="tf.E_charm_STR=1 ,tf.E_charm_DUR=1 ,tf.E_charm_count=0" cond="tf.E_charm_count==1"]
[endmacro]

;プレイヤーのステータス欄
[macro name="MiniStatus"]
[layopt layer="2" visible=true]
[iscript]
tf.Decktxt = '山札：' + f.Deck.length + '/' + f.Cards.length ;
tf.P_HPtxt = '体力：' + tf.P_HP ;
tf.P_MGPtxt = '気力：' + f.P_MGP , tf.P_AVDtxt = '回避：+' + tf.P_AVD ;
tf.P_EROtxt = '欲情：' + tf.P_ERO , tf.P_EXHtxt = '疲労：' + f.P_EXH;
[endscript]
[ptext text="なずな" layer="2" edge="0x000000" size=25 x=20 y=480 ]
[ptext name="P_HPtxt" text="&tf.P_HPtxt" layer="2" edge="0x000000" size=20 x=20 y=510 overwrite=true]
[ptext name="P_MGPtxt" text="&tf.P_MGPtxt" layer="2" edge="0x000000" size=20 x=140 y=510 overwrite=true]
[ptext name="Decktxt" text="&tf.Decktxt" layer="2" edge="0x000000" size=20 x=20 y=540 overwrite=true]
[ptext name="P_AVDtxt" text="&tf.P_AVDtxt" layer="2" edge="0x000000" size=20 x=140 y=540 overwrite=true]
[ptext name="P_EROtxt" text="&tf.P_EROtxt" layer="2" edge="0x000000" size=20 x=20 y=570 overwrite=true]
[ptext name="P_EXHtxt" text="&tf.P_EXHtxt" layer="2" edge="0x000000" size=20 x=20 y=600 overwrite=true]

[iscript]
tf.E_HPtxt = '体力：' + tf.E_HP ;
tf.E_MGPtxt = '気力：' + tf.E_MGP ;
tf.E_EROtxt = '欲情：' + tf.E_ERO ;
tf.E_MNTtxt = '拘束：' + tf.Mount ;
[endscript]
[ptext text="&tf.E_name" layer="2" edge="0x000000" size=20 x=620 y=5 ]
[ptext name="E_HPtxt" text="&tf.E_HPtxt" layer="2" edge="0x000000" size=20 x=620 y=30 overwrite=true]
[ptext name="E_MGPtxt" text="&tf.E_MGPtxt" layer="2" edge="0x000000" size=20 x=740 y=30 overwrite=true]
[ptext name="E_EROtxt" text="&tf.E_EROtxt" layer="2" edge="0x000000" size=20 x=840 y=30 overwrite=true]
[ptext name="E_MNTtxt" text="&tf.E_MNTtxt" layer="2" edge="0x000000" size=20 x=840 y=50 overwrite=true]

[CardDebug]
[endmacro]

;カード関係
[macro name="DeckRemake"]
;cardを増減したときなどにDeckの再構築を行う
[iscript]
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]
[endmacro]

[macro name="CardShuffle"]
[DeckRemake]
;Deckはシャッフルした山札（ただしカード自体ではなくカードの位置nの列。引き換え番号みたいなもの）
[iscript]
for(i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[endmacro]

[macro name="ShowCardList"]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x="450" y="500" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Answer=f.Cards[f.Hand[0]]['value']" cond="f.Cards[f.Hand[0]]['active']>0" target="&f.Cards[f.Hand[0]]['tag']" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="500" text="&f.Cards[f.Hand[1]]['txt']" exp="tf.Answer=f.Cards[f.Hand[1]]['value']" cond="f.Cards[f.Hand[1]]['active']>0" target="&f.Cards[f.Hand[1]]['tag']" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="500" text="&f.Cards[f.Hand[2]]['txt']" exp="tf.Answer=f.Cards[f.Hand[2]]['value']" cond="f.Cards[f.Hand[2]]['active']>0" target="&f.Cards[f.Hand[2]]['tag']" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="500" text="&f.Cards[f.Hand[3]]['txt']" exp="tf.Answer=f.Cards[f.Hand[3]]['value']" cond="f.Cards[f.Hand[3]]['active']>0" target="&f.Cards[f.Hand[3]]['tag']" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="500" text="&f.Cards[f.Hand[4]]['txt']" exp="tf.Answer=f.Cards[f.Hand[4]]['value']" cond="f.Cards[f.Hand[4]]['active']>0" target="&f.Cards[f.Hand[4]]['tag']" ]
[endmacro]

[macro name="Calc_Card"]
;各色の数値を計算
[iscript]
f.Red=0,f.Green=0,f.Blue=0,f.black=0;
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "red"){f.Red += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "green"){f.Green += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "blue"){f.Blue += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "black"){f.black += f.Cards[f.Hand[i]]['value'];}
}
[endscript]
[endmacro]

[macro name="DeActivate"]
;コスト消費
[iscript]
i=0;
while(tf.Cost>0){
if(f.Cards[f.Hand[i]]['color']==tf.Type && f.Cards[f.Hand[i]]['active']>0 ){f.Cards[f.Hand[i]]['active']=0 , tf.Cost--};
i++;
}
[endscript]
[endmacro]

[macro name="ReActivate"]
;カードのアクティベート
[iscript]
for(i=0; i<5 ;i++){f.Cards[f.Hand[i]]['active'] = 1 ;}
[endscript]
[endmacro]

[macro name="Ikigire"]
;息切れ時の疲労カード削除
[iscript]
i = 0;
n = 0;
while(n < 3){
  if(f.Cards[f.Hand[i]]['color']=="black"){
    f.Cards.splice(f.Hand[i],1);
    n++;
  }
  else{
    i++;
  }
}
f.P_EXH = f.P_EXH - 3
[endscript]
[DeckRemake]
[endmacro]

[macro name="CardDebug"]
[layopt layer="4" visible=true]
[ptext name="Cards" text="&f.Cards.length" layer="4" edge="0x000000" size=10 x=0 y=0 overwrite=true]
[ptext name="Deck" text="&f.Deck" layer="4" edge="0x000000" size=10 x=0 y=10 overwrite=true]
[ptext name="Hand" text="&f.Hand" layer="4" edge="0x000000" size=10 x=0 y=20 overwrite=true]
[endmacro]


[macro name="Calc_HitRate"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
(命中率[emb exp="tf.HitRate"]％)[r]
[endmacro]

[macro name="Calc_Damage"]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_charm_DUR * 2)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.3" cond="tf.dice <= (1 + tf.P_LUKb1) * f.P_LUK * 3 * tf.CRTrate"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.ArousSTRd * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[endmacro]

;勝敗判定
[macro name="Triage"]
[jump storage="battle-Triage.ks" target="*game_lose" cond="tf.P_HP <= 0"]
[jump storage="battle-Triage.ks" target="*game_lose" cond="f.P_EXH >= 100"]
[jump storage="battle-Triage.ks" target="*game_win" cond="tf.E_HP <= 0"]
[endmacro]

;絶頂判定
[macro name="Orgasm"]
[if exp="tf.P_ERO >= 70 && tf.Arousal != 2"]
[eval exp="tf.Arousal = 2"]
なずなは興奮状態になった[p]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =0.8 , tf.ArousAGId =0.8 , tf.ArousDEXd =0.8 , tf.ArousAPPb =2 , tf.ArousPOWb =2 , tf.ArousMNDd =0.8 , tf.ArousSEXd =2"]
[endif]

[if exp="tf.Kaikan > 99 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
なずなは絶頂した[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]

[elsif exp="tf.Kaikan > 99 && tf.Orga >= 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
なずなは[emb exp="tf.OrgaCount"]回目の絶頂を迎えた[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]
[endif]
[endmacro]

[macro name="SANcheck"]
;理性喪失判定
[eval exp="tf.Max=tf.Kaikan , tf.Min=0"][dice]
[if exp="tf.Orga == 4  && tf.dice >= tf.P_SAN && f.Insanity==0"]
[eval exp="tf.dice=1"]
絶頂によりなずなの理性が[emb exp="tf.dice"]減少[p]
[eval exp="tf.P_SAN = tf.P_SAN - tf.dice"]
[endif]
;発狂判定
[if exp="5 < f.P_SAN - tf.P_SAN"]
[eval exp="f.Insanity=1"]
[endif]
[eval exp="tf.Kaikan = 0 , tf.Yokujo = 0"]
[endmacro]

[macro name="SCALD"]
[if exp="tf.E_scald>0"]
[eval exp="tf.E_HP = tf.E_HP - 100"][limit]
火傷で[EnName]の体力が100減少[p]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[Triage]
[endif]
[endmacro]

[macro name="MAZO"]
[if exp="f.P_MAZO>0"]
[eval exp="tf.RATE=f.P_MAZO*2 , tf.P_SEN = f.P_SEN_EX"]
;欲情＝敵の性技技能値は無関係
[eval exp="tf.Yokujo = Math.floor(10 * tf.RATE * tf.ArousSEXd * tf.P_DefSKBb1 * (100 - tf.P_SAN)/100)"]
;快感＝敵の性技技能値は無関係
[eval exp="tf.Kaikan = Math.floor(18 * tf.RATE * tf.ArousSEXd * tf.P_DefSKBb1 * (tf.P_SEN * f.P_SENboost ) / 100 * (tf.P_ERO + 50)/100)"]
[eval exp="tf.P_ERO = tf.P_ERO + tf.Yokujo"][limit]
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]なずなの欲情が[emb exp="tf.Yokujo"]上昇した[p]
[endif]
[endmacro]

[macro name="Dress"]
[if exp="tf.P_DRESS > 1"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
なずなは下着姿になった[p]なずなの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]
[elsif exp="tf.P_DRESS > 0"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
なずなは一糸まとわぬ姿になった[p]なずなの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]
[endmacro]

[return]
