*game_start
[emb exp="tf.MP"]/[emb exp="tf.Cost"][p]
[eval exp="tf.Max=99 ,tf.Min=0"][dice]
[if exp="tf.dice>66"][jump target="*Q1"]
[elsif exp="tf.dice>33"][jump target="*Q2"]
[else][jump target="*Q3"]
[endif]
[s]

*Q1
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>79"][eval exp="tf.Sample='水' "]
[elsif exp="tf.dice>59"][eval exp="tf.Sample='金' "]
[elsif exp="tf.dice>39"][eval exp="tf.Sample='土' "]
[elsif exp="tf.dice>19"][eval exp="tf.Sample='火' "]
[else][eval exp="tf.Sample='木' "]
[endif]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="100"  text="水"  exp="tf.Answer='水'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="170"  text="金"  exp="tf.Answer='金'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="240"  text="土"  exp="tf.Answer='土'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="310"  text="火"  exp="tf.Answer='火'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="380"  text="木"  exp="tf.Answer='木'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Q2
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>79"][eval exp="tf.Sample='子' "]
[elsif exp="tf.dice>59"][eval exp="tf.Sample='丑' "]
[elsif exp="tf.dice>39"][eval exp="tf.Sample='寅' "]
[elsif exp="tf.dice>19"][eval exp="tf.Sample='卯' "]
[else][eval exp="tf.Sample='辰' "]
[endif]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="100"  text="子"  exp="tf.Answer='子'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="170"  text="丑"  exp="tf.Answer='丑'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="240"  text="寅"  exp="tf.Answer='寅'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="310"  text="卯"  exp="tf.Answer='卯'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="380"  text="辰"  exp="tf.Answer='辰'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Q3
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.dice>79"][eval exp="tf.Sample='赤' "]
[elsif exp="tf.dice>59"][eval exp="tf.Sample='黒' "]
[elsif exp="tf.dice>39"][eval exp="tf.Sample='黄' "]
[elsif exp="tf.dice>19"][eval exp="tf.Sample='白' "]
[else][eval exp="tf.Sample='青' "]
[endif]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="100"  text="赤"  exp="tf.Answer='赤'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="170"  text="黒"  exp="tf.Answer='黒'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="240"  text="黄"  exp="tf.Answer='黄'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="310"  text="白"  exp="tf.Answer='白'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="battle.ks"  size="20"  x="260"  width="400"  y="380"  text="青"  exp="tf.Answer='青'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Kotae
[wait_cancel]
[if exp="tf.Sample == tf.Answer"]
成功[p]
[eval exp="tf.MP=tf.MP+1"]

[else]
[eval exp="tf.MP=-1"]
失敗[p]
くぬぎは術の発動に失敗した[p]
[jump storage="battle.ks" target="*P_phase_start"]
[endif]

[if exp="tf.MP >= tf.Cost"]
術の発動[p]
[jump storage="battle.ks" target="&tf.label"]
[else]
[jump target="*game_start"]
[endif]
[s]

*timeout
[cm]
時間切れ[p]
[eval exp="tf.MP=-1"]
失敗[p]
くぬぎは術の発動に失敗した[p]
[jump storage="battle.ks" target="*P_phase_start"]
[s]
