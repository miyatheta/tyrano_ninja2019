*game_start
[emb exp="tf.MP"]/[emb exp="tf.Cost"][p]
[eval exp="tf.Max=99 ,tf.Min=0"][dice]
[if exp="tf.dice>50"]
[jump target="*Q1"]
[else]
[jump target="*Q2"]
[endif]
[s]

*Q1
[eval exp="tf.Sample='水'"]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="水"  exp="tf.Answer='水'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="金"  exp="tf.Answer='金'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="土"  exp="tf.Answer='土'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="310"  text="火"  exp="tf.Answer='火'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="380"  text="木"  exp="tf.Answer='木'" storage="SkillGame.ks" target="*Kotae"  ]
[wait time=3000]
[jump target="*timeout"]
[s]

*Q2
[eval exp="tf.Sample='子'"]

[emb exp="tf.Sample"]を選べ
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="子"  exp="tf.Answer='子'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="170"  text="丑"  exp="tf.Answer='丑'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="240"  text="寅"  exp="tf.Answer='寅'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="310"  text="卯"  exp="tf.Answer='卯'" storage="SkillGame.ks" target="*Kotae"  ]
[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="380"  text="辰"  exp="tf.Answer='辰'" storage="SkillGame.ks" target="*Kotae"  ]
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
[jump storage="scene1.ks" target="*P_phase_start"]
[endif]

[if exp="tf.MP >= tf.Cost"]
術の発動[p]
[jump storage="scene1.ks" target="&tf.label"]
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
[jump storage="scene1.ks" target="*P_phase_start"]
[s]
