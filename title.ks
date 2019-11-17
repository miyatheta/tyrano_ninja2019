
[cm]

@clearstack
@bg storage ="sample_title2.jpg" time=100
@wait time = 200
@call storage="macros.ks" target="*マクロ"


*start

[button x=550 y=50 graphic="title/button_start.png" target="gamestart"]
[button x=550 y=120 graphic="title/button_load.png"  role="load" ]
[button x=550 y=190 graphic="title/button_cg.png" storage="cg.ks" ]
[button x=550 y=260 graphic="title/button_replay.png" storage="replay.ks" ]
[button x=550 y=330 graphic="title/button_config.png" role="sleepgame" storage="config.ks" ]
[s]

*gamestart
;一番最初のシナリオファイルへジャンプする
@jump storage="scene1.ks"
