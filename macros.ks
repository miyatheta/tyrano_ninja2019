*マクロ
;文法関係
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
[emb exp="f.Enemy.HN"]
[endmacro]

;数値関係
[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

;ステータス関係

[macro name="enemySetUp"]
;敵設定読込
[iscript]
f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnDEC = f.originEnDEC;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnMND = f.originEnMND;
f.BaseEnANG = f.originEnANG;
f.BaseEnDEX = f.originEnDEX;
f.BaseEnEND = f.originEnEND;
f.BaseBindPower = f.originBindPower;

f.EnHP = f.BaseEnHP;
f.EnSTR = f.BaseEnSTR;
f.EnDEF = f.BaseEnDEF;
f.EnSPD = f.BaseEnSPD;
f.EnDEC = f.BaseEnDEC;
f.EnFP = f.BaseEnFP;
f.EnERO = f.BaseEnERO;
f.EnMND = f.BaseEnMND;
f.EnANG = f.BaseEnANG;
f.EnDEX = f.BaseEnDEX;
f.EnEND = f.BaseEnEND;
f.BindPower = f.BaseBindPower;

f.BaseEnOption = JSON.stringify(f.originEnOption);
f.BaseEnOption = JSON.parse(f.BaseEnOption);
f.EnOption = JSON.stringify(f.BaseEnOption);
f.EnOption = JSON.parse(f.EnOption);

f.EnCount = 0;

f.EnGBuff = 1.0;
f.EnStan = 0;
[endscript]
[endmacro]

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
calcStatus(f.TURNdigit,f.turn);

f.P_HPdigit=[];
calcStatus(f.P_HPdigit,f.P_HP);
f.FPdigit=[];
calcStatus(f.FPdigit,f.FP);
f.SPDdigit=[];
calcStatus(f.SPDdigit,f.SPD);
f.EROdigit=[];
calcStatus(f.EROdigit,f.ERO);
f.TIRdigit=[];
calcStatus(f.TIRdigit,f.TIR);
f.MNDdigit=[];
calcStatus(f.MNDdigit,f.MND);
f.ARSdigit=[];
calcStatus(f.ARSdigit,f.ARS);
f.APPdigit=[];
calcStatus(f.APPdigit,f.APP);
f.SENdigit=[];
calcStatus(f.SENdigit,f.SEN);
f.POWdigit=[];
calcStatus(f.POWdigit,f.POW);

f.EnHPdigit=[];
calcStatus(f.EnHPdigit,f.EnHP);
f.EnFPdigit=[];
calcStatus(f.EnFPdigit,f.EnFP);
f.EnSPDdigit=[];
calcStatus(f.EnSPDdigit,f.EnSPD);
f.EnEROdigit=[];
calcStatus(f.EnEROdigit,f.EnERO);
f.EnMNDdigit=[];
calcStatus(f.EnMNDdigit,f.EnMND);
f.EnErectdigit=[];
calcStatus(f.EnErectdigit,f.EnErect);
[endscript]
[endmacro]

[macro name="showStatus"]
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
[image layer=1 storage="&f.FPdigit[1]" width="20" top="30" left="95" visible="true"]
[image layer=1 storage="&f.FPdigit[2]" width="20" top="30" left="110" visible="true"]
[image layer=1 storage="&f.FPdigit[3]" width="20" top="30" left="135" visible="true"]
[image layer=1 storage="&f.FPdigit[4]" width="20" top="30" left="155" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="290" visible="true"]
[image layer=1 storage="&f.SPDdigit[2]" width="20" top="30" left="350" visible="true"]
[image layer=1 storage="&f.SPDdigit[3]" width="20" top="30" left="375" visible="true"]
[image layer=1 storage="&f.SPDdigit[4]" width="20" top="30" left="395" visible="true"]

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

[image layer=1 storage="UI/number/敵名.png" width="75" top="480" left="890" visible="true"]

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
[macro name="Bonus"]
[iscript]
tf.Num = f.selectOption[f.H].num * f.selectOption[f.H-1].num * f.selectOption[f.H-2].num;
tf.EnNum = f.EnSelectOption[f.EnSelectPattern[f.N + f.EnCount * 3]].num * f.EnSelectOption[f.EnSelectPattern[f.N-1 + f.EnCount * 3]].num * f.EnSelectOption[f.EnSelectPattern[f.N-2 + f.EnCount * 3]].num;
[endscript]
;PL：[emb exp="tf.Num"]＊敵：[emb exp="tf.EnNum"][l][cm]
[if exp="tf.Num == 1"]
  ;グー３枚＞体力上昇
  [eval exp="f.GBuff = f.GBuff + 0.5"]
  [image layer=4 storage="buff/STRup.png" width="75" top="200" left="280" visible="true"]
[elsif exp="tf.Num == 2 || tf.Num == 3"]
  ;グー２枚＞体力上昇
  [eval exp="f.GBuff = f.GBuff + 0.2"]
  [image layer=4 storage="buff/STRup.png" width="75" top="200" left="280" visible="true"]
[elsif exp="tf.Num == 8"]
  ;チョキ３枚＞FP上昇
  [eval exp="f.FP = f.FP + 30"][eval exp="f.FP = 100" cond="f.FP > 100"]
  [image layer=4 storage="buff/FPup.png" width="75" top="200" left="280" visible="true"]
[elsif exp="tf.Num == 4 || tf.Num == 12"]
  ;チョキ2枚＞FP上昇
  [eval exp="f.FP = f.FP + 10"][eval exp="f.FP = 100" cond="f.FP > 100"]
  [image layer=4 storage="buff/FPup.png" width="75" top="200" left="280" visible="true"]
[elsif exp="tf.Num == 27"]
  ;パー３枚＞スピード上昇
  [eval exp="f.SPD = f.SPD + 9"][eval exp="f.SPD = f.BaseSPD" cond="f.SPD > f.BaseSPD"]
  [image layer=4 storage="buff/SPDup.png" width="75" top="200" left="280" visible="true"]
[elsif exp="tf.Num == 9 || tf.Num == 18"]
  ;パー2枚＞スピード上昇
  [eval exp="f.SPD = f.SPD + 3"][eval exp="f.SPD = f.BaseSPD" cond="f.SPD > f.BaseSPD"]
  [image layer=4 storage="buff/SPDup.png" width="75" top="200" left="280" visible="true"]
[endif]

[if exp="tf.EnNum == 1"]
  ;グー３枚
  [eval exp="f.EnGBuff = f.EnGBuff + 0.5"]
  [image layer=4 storage="buff/STRup.png" width="75" top="200" left="580" visible="true"]
[elsif exp="tf.EnNum == 2 || tf.EnNum == 3"]
  ;グー２枚
  [eval exp="f.EnGBuff = f.EnGBuff + 0.2"]
  [image layer=4 storage="buff/STRup.png" width="75" top="200" left="580" visible="true"]
[elsif exp="tf.EnNum == 8"]
  ;チョキ３枚＞FP上昇
  [eval exp="f.EnFP = f.EnFP + 30"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
  [image layer=4 storage="buff/FPup.png" width="75" top="200" left="580" visible="true"]
[elsif exp="tf.EnNum == 4 || tf.EnNum == 12"]
  ;チョキ2枚＞FP上昇
  [eval exp="f.EnFP = f.EnFP + 10"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
  [image layer=4 storage="buff/FPup.png" width="75" top="200" left="580" visible="true"]
[elsif exp="tf.EnNum == 27"]
  ;パー３枚＞スピード上昇
  [eval exp="f.EnSPD = f.EnSPD + 9"][eval="f.EnSPD = f.BaseEnSPD" cond="f.EnSPD > f.BaseEnSPD"]
  [image layer=4 storage="buff/SPDup.png" width="75" top="200" left="580" visible="true"]
[elsif exp="tf.EnNum == 9 || tf.EnNum == 18"]
  ;パー2枚＞スピード上昇
  [eval exp="f.EnSPD = f.EnSPD + 3"][eval="f.EnSPD = f.BaseEnSPD" cond="f.EnSPD > f.BaseEnSPD"]
  [image layer=4 storage="buff/SPDup.png" width="75" top="200" left="580" visible="true"]
[endif]
[endmacro]

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

[macro name="enemy_attack1"]
[emb exp="tf.E_attack_1"]
[endmacro]

[macro name="enemy_attack2"]
[emb exp="tf.E_attack_2"]
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
[eval exp="tf.Yokujo = Math.floor(tf.E_SEX * tf.RATE * tf.ArousSEXd * tf.P_DefSKBb1 * (100 - tf.P_SAN)/100)"]
;快感＝敵の性技技能値×行為の基礎倍率×欲情状態のデバフ×セクハラへの防御状態×欲情度による倍率
[eval exp="tf.Kaikan = Math.floor(tf.E_SEX * tf.RATE * tf.ArousSEXd * tf.P_DefSKBb1 * (tf.P_SEN * f.P_SENboost ) / 100 * (tf.P_ERO + 50)/100)"]
[endmacro]

[macro name="limit"]
[eval exp="tf.P_HP = 0" cond="tf.P_HP < 0"]
[eval exp="tf.E_HP = 0" cond="tf.E_HP < 0"]
[eval exp="f.P_EXH = 100" cond="f.P_EXH > 100"]
[eval exp="f.P_AUR = 100" cond="f.P_AUR > 100"]
[eval exp="f.E_AUR = 100" cond="f.E_AUR > 100"]
[eval exp="f.P_AUR = 0" cond="f.P_AUR < 0"]
[eval exp="f.P_LUK = 5" cond="f.P_LUK > 5"]
[eval exp="f.P_LUK = 0" cond="f.P_LUK < 0"]
[eval exp="tf.P_ERO = 999" cond="tf.P_ERO > 999"]
[eval exp="tf.P_ERO = 0" cond="tf.P_ERO < 0"]
[eval exp="tf.E_ERO = 999" cond="tf.E_ERO > 999"]
[eval exp="tf.P_ACT = 0" cond="tf.P_ACT < 0"]
[eval exp="tf.E_ACT = 0" cond="tf.E_ACT < 0"]
[eval exp="tf.AvoidRate = 0" cond="tf.AvoidRate < 0"]
[eval exp="tf.AvoidRate = 100" cond="tf.AvoidRate > 100"]
[eval exp="tf.E_ACT = f.E_ACT" cond="tf.E_ACT > f.E_ACT"]
[eval exp="tf.P_ACT = tf.P_ACTmax" cond="tf.P_ACT > tf.P_ACTmax"]
[eval exp="tf.P_ARMOR = 0" cond="tf.P_ARMOR < 0"]
[endmacro]

[macro name="Calc_Status"]
[eval exp="tf.P_STR = f.P_STR * tf.P_STRd3 * tf.P_STRd1 * tf.P_STRb3 * tf.P_STRb1 * tf.P_Cardb1"]
[eval exp="tf.P_DUR = f.P_DUR * tf.P_DURd3 * tf.P_DURd1 * tf.P_DURb3 * tf.P_DURb1 "]
[eval exp="tf.P_AGI = f.P_AGI * tf.P_AGId3 * tf.P_AGId1 * tf.P_AGIb3 * tf.P_AGIb1 "]
[eval exp="tf.P_DEX = f.P_DEX * tf.P_DEXd3 * tf.P_DEXd1 * tf.P_DEXb3 * tf.P_DEXb1 "]
[eval exp="tf.P_POW = f.P_POW * tf.P_POWd3 * tf.P_POWd1 * tf.P_POWb3 * tf.P_POWb1 "]
[eval exp="tf.P_APP = f.P_APP * tf.P_APPd3 * tf.P_APPd1 * tf.P_APPb3 * tf.P_APPb1 - (2 - tf.P_DRESS)"]

[eval exp="tf.E_STR = f.E_STR * tf.E_STRd3 * tf.E_STRd1 * tf.E_STRb3 * tf.E_STRb1 "]
[eval exp="tf.E_DUR = f.E_DUR * tf.E_DURd3 * tf.E_DURd1 * tf.E_DURb3 * tf.E_DURb1 "]
[eval exp="tf.E_AGI = f.E_AGI * tf.E_AGId3 * tf.E_AGId1 * tf.E_AGIb3 * tf.E_AGIb1 "]
[eval exp="tf.E_DEX = f.E_DEX * tf.E_DEXd3 * tf.E_DEXd1 * tf.E_DEXb3 * tf.E_DEXb1 "]
[eval exp="tf.E_POW = f.E_POW * tf.E_POWd3 * tf.E_POWd1 * tf.E_POWb3 * tf.E_POWb1 "]
[eval exp="tf.E_APP = f.E_APP * tf.E_APPd3 * tf.E_APPd1 * tf.E_APPb3 * tf.E_APPb1 "]
[endmacro]

[macro name="Initialize_1Tbuff"]
[eval exp="tf.P_STRd1=1 , tf.P_DURd1=1 , tf.P_AGId1=1 , tf.P_DEXd1=1 , tf.P_POWd1=1 , tf.P_APPd1=1"]
[eval exp="tf.P_STRb1=1 , tf.P_DURb1=1 , tf.P_AGIb1=1 , tf.P_DEXb1=1 , tf.P_POWb1=1 , tf.P_APPb1=1 , tf.P_DefSKBb1=1 , tf.P_Cardb1=1"]
[eval exp="tf.E_STRd1=1 , tf.E_DURd1=1 , tf.E_AGId1=1 , tf.E_DEXd1=1 , tf.E_POWd1=1 , tf.E_APPd1=1"]
[eval exp="tf.E_STRb1=1 , tf.E_DURb1=1 , tf.E_AGIb1=1 , tf.E_DEXb1=1 , tf.E_POWb1=1 , tf.E_APPb1=1"]
[endmacro]

[macro name="Initialize_3Tbuff"]
[eval exp="tf.P_STRd3=1 , tf.P_DURd3=1 , tf.P_AGId3=1 , tf.P_DEXd3=1 , tf.P_POWd3=1 , tf.P_APPd3=1"]
[eval exp="tf.P_STRd3_count=1 , tf.P_DURd3_count=1 , tf.P_AGId3_count=1 , tf.P_DEXd3_count=1 , tf.P_POWd3_count=1 , tf.P_APPd3_count=1"]

[eval exp="tf.P_STRb3=1 , tf.P_DURb3=1 , tf.P_AGIb3=1 , tf.P_DEXb3=1 , tf.P_POWb3=1 , tf.P_APPb3=1"]
[eval exp="tf.P_STRb3_count=1 , tf.P_DURb3_count=1 , tf.P_AGIb3_count=1 , tf.P_DEXb3_count=1 , tf.P_POWb3_count=1 , tf.P_APPb3_count=1"]

[eval exp="tf.E_STRd3=1 , tf.E_DURd3=1 , tf.E_AGId3=1 , tf.E_DEXd3=1 , tf.E_POWd3=1 , tf.E_APPd3=1"]
[eval exp="tf.E_STRd3_count=1 , tf.E_DURd3_count=1 , tf.E_AGId3_count=1 , tf.E_DEXd3_count=1 , tf.E_POWd3_count=1 , tf.E_APPd3_count=1"]

[eval exp="tf.E_STRb3=1 , tf.E_DURb3=1 , tf.E_AGIb3=1 , tf.E_DEXb3=1 , tf.E_POWb3=1 , tf.E_APPb3=1"]
[eval exp="tf.E_STRb3_count=1 , tf.E_DURb3_count=1 , tf.E_AGIb3_count=1 , tf.E_DEXb3_count=1 , tf.E_POWb3_count=1 , tf.E_APPb3_count=1"]

[eval exp="tf.E_charm_STR=1 , tf.E_charm_AGI=1 "]
[eval exp="tf.E_charm_count=1 "]
[endmacro]

[macro name="Refresh_3Tbuff"]
[eval exp="tf.P_STRd3_count = tf.P_STRd3_count-1" cond="tf.P_STRd3_count>1"][eval exp="tf.P_STRd3=1 ,tf.P_STRd3_count=0" cond="tf.P_STRd3_count==1"]
[eval exp="tf.P_DURd3_count = tf.P_DURd3_count-1" cond="tf.P_DURd3_count>1"][eval exp="tf.P_DURd3=1 ,tf.P_DURd3_count=0" cond="tf.P_DURd3_count==1"]
[eval exp="tf.P_AGId3_count = tf.P_AGId3_count-1" cond="tf.P_AGId3_count>1"][eval exp="tf.P_AGId3=1 ,tf.P_AGId3_count=0" cond="tf.P_AGId3_count==1"]
[eval exp="tf.P_DEXd3_count = tf.P_DEXd3_count-1" cond="tf.P_DEXd3_count>1"][eval exp="tf.P_DEXd3=1 ,tf.P_DEXd3_count=0" cond="tf.P_DEXd3_count==1"]
[eval exp="tf.P_STRb3_count = tf.P_STRb3_count-1" cond="tf.P_STRb3_count>1"][eval exp="tf.P_STRb3=1 ,tf.P_STRb3_count=0" cond="tf.P_STRb3_count==1"]
[eval exp="tf.P_DURb3_count = tf.P_DURb3_count-1" cond="tf.P_DURb3_count>1"][eval exp="tf.P_DURb3=1 ,tf.P_DURb3_count=0" cond="tf.P_DURb3_count==1"]
[eval exp="tf.P_AGIb3_count = tf.P_AGIb3_count-1" cond="tf.P_AGIb3_count>1"][eval exp="tf.P_AGIb3=1 ,tf.P_AGIb3_count=0" cond="tf.P_AGIb3_count==1"]
[eval exp="tf.P_DEXb3_count = tf.P_DEXb3_count-1" cond="tf.P_DEXb3_count>1"][eval exp="tf.P_DEXb3=1 ,tf.P_DEXb3_count=0" cond="tf.P_DEXb3_count==1"]

[eval exp="tf.E_STRd3_count = tf.E_STRd3_count-1" cond="tf.E_STRd3_count>1"][eval exp="tf.E_STRd3=1 ,tf.E_STRd3_count=0" cond="tf.E_STRd3_count==1"]
[eval exp="tf.E_DURd3_count = tf.E_DURd3_count-1" cond="tf.E_DURd3_count>1"][eval exp="tf.E_DURd3=1 ,tf.E_DURd3_count=0" cond="tf.E_DURd3_count==1"]
[eval exp="tf.E_AGId3_count = tf.E_AGId3_count-1" cond="tf.E_AGId3_count>1"][eval exp="tf.E_AGId3=1 ,tf.E_AGId3_count=0" cond="tf.E_AGId3_count==1"]
[eval exp="tf.E_DEXd3_count = tf.E_DEXd3_count-1" cond="tf.E_DEXd3_count>1"][eval exp="tf.E_DEXd3=1 ,tf.E_DEXd3_count=0" cond="tf.E_DEXd3_count==1"]
[eval exp="tf.E_STRb3_count = tf.E_STRb3_count-1" cond="tf.E_STRb3_count>1"][eval exp="tf.E_STRb3=1 ,tf.E_STRb3_count=0" cond="tf.E_STRb3_count==1"]
[eval exp="tf.E_DURb3_count = tf.E_DURb3_count-1" cond="tf.E_DURb3_count>1"][eval exp="tf.E_DURb3=1 ,tf.E_DURb3_count=0" cond="tf.E_DURb3_count==1"]
[eval exp="tf.E_AGIb3_count = tf.E_AGIb3_count-1" cond="tf.E_AGIb3_count>1"][eval exp="tf.E_AGIb3=1 ,tf.E_AGIb3_count=0" cond="tf.E_AGIb3_count==1"]
[eval exp="tf.E_DEXb3_count = tf.E_DEXb3_count-1" cond="tf.E_DEXb3_count>1"][eval exp="tf.E_DEXb3=1 ,tf.E_DEXb3_count=0" cond="tf.E_DEXb3_count==1"]
[eval exp="tf.E_charm_count = tf.E_charm_count-1" cond="tf.E_charm_count>1"][eval exp="tf.E_charm_STR=1 ,tf.E_charm_AGI=1 ,tf.E_charm_count=0" cond="tf.E_charm_count==1"]
[endmacro]

[macro name="Initialize_Cards"]
;術の設定
[iscript]
f.P_Skill=[
{id:0 , name:"集気法" , aura:0 , MP:0 , cost:0 , label:"*P_skill0"},
{id:1 , name:"火炎" , aura:60 , MP:0 , cost:3 , label:"*P_skill1"},
{id:2 , name:"空蝉" , aura:50 , MP:0 , cost:3 , label:"*P_skill2"},
{id:3 , name:"魅了" , aura:30 , MP:0 , cost:2 , label:"*P_skill3"},
{id:4 , name:"衣変" , aura:20 , MP:0 , cost:2 , label:"*P_skill4"},
{id:5 , name:"螺旋功" , aura:100 , MP:0 , cost:4 , label:"*P_skill5"}
];
[endscript]
;カードの設定
[iscript]
f.Deck=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
f.Cards=[
{id:0,type:1,name:"忍術",suite:"水",comb:1,active:1,txt:"水・忍　術　"},
{id:1,type:1,name:"忍術",suite:"風",comb:1,active:1,txt:"風・忍　術　"},
{id:2,type:1,name:"忍術",suite:"炎",comb:1,active:1,txt:"炎・忍　術　"},
{id:3,type:2,name:"拳",suite:"水",comb:1,active:1,txt:"水・拳　　　"},
{id:4,type:2,name:"拳",suite:"風",comb:1,active:1,txt:"風・拳　　　"},
{id:5,type:2,name:"拳",suite:"炎",comb:1,active:1,txt:"炎・拳　　　"},
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
;初回シャッフル
[iscript]
for(var i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]
[endmacro]

[macro name="SelectedCardSplice"]
[iscript]
f.Selected.splice(0,1)
[endscript]
[endmacro]

[macro name="Calc_HitRate"]
[eval exp="tf.HitRate = tf.HIT"][eval exp="tf.HitRate=0" cond="tf.HitRate<0"][eval exp="tf.HitRate=100" cond="tf.HitRate>100"]
(命中率[emb exp="tf.HitRate"]％)[p]
[endmacro]

[macro name="Calc_Damage"]
[eval exp="tf.DEF = Math.floor(tf.E_DUR * tf.E_GRD * 2)"]
[eval exp="tf.Max=99 , tf.Min=0 , tf.CRT = 1"][dice][eval exp="tf.CRT = 1.3" cond="tf.dice <= f.P_LUK * 3 * tf.CRTrate"]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice]
[eval exp="tf.ATP = tf.P_STR * tf.ArousSTRd * tf.RATE * tf.CRT + tf.dice"]
[eval exp="tf.Damage = Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[eval exp="tf.E_HP = tf.E_HP - tf.Damage"][limit]
[endmacro]

;絶頂判定
[macro name="Orgasm"]
[if exp="tf.P_ERO >= 70 && tf.Arousal != 2"]
[eval exp="tf.Arousal = 2"]
くぬぎは興奮状態になった[p]
[eval exp="tf.Arousal = 2 , tf.ArousSTRd =0.8 , tf.ArousAGId =0.8 , tf.ArousDEXd =0.8 , tf.ArousAPPb =2 , tf.ArousPOWb =2 , tf.ArousSEXd =2"]
[endif]

[if exp="tf.Kaikan > 99 && tf.Orga < 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
くぬぎは絶頂した[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]

[elsif exp="tf.Kaikan > 99 && tf.Orga >= 1"]
[quake count=8 time=300 hmax=30]
[eval exp="tf.OrgaCount = tf.OrgaCount+1"]
くぬぎは[emb exp="tf.OrgaCount"]回目の絶頂を迎えた[p]
[eval exp="tf.Orga = 4 , tf.OrgaPOWb = 2"]
[endif]
[endmacro]

[macro name="SANcheck"]
;理性喪失判定
[eval exp="tf.Max=tf.Kaikan , tf.Min=0"][dice]
[if exp="tf.Orga == 4  && tf.dice >= tf.P_SAN && f.Insanity==0"]
[eval exp="tf.Max=3 , tf.Min=1"][dice]
絶頂によりくぬぎの理性が[emb exp="tf.dice"]減少[p]
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
火傷で[enemyname]の体力が100減少[p]
[eval exp="tf.E_scald = tf.E_scald - 1"]
[triage]
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
【被虐性癖】[emb exp="tf.Kaikan"]の快感[r]くぬぎの欲情が[emb exp="tf.Yokujo"]上昇した[p]
[endif]
[endmacro]

[return]
