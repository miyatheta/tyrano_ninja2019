*game_start
[eval exp="f.array=['欲','煩','懊','悩','悦','愉','快','色','情','乱','姦','淫','絶','雌','雄','痴']"]
[eval exp="tf.Max=15 , tf.Min=0"][dice]
[eval exp="tf.Sample=f.array[tf.dice]"]
[iscript]
for(var i = f.array.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.array[i];
    f.array[i] = f.array[r];
    f.array[r] = tmp;
}
[endscript]

[emb exp="tf.Sample"]を選べ
[wait time=300]
[glink  color="rosy"  size="20"  x="260"  width="20"  y="100"  text="&f.array[0]"  exp="tf.Answer=f.array[0]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="260"  width="20"  y="170"  text="&f.array[1]"  exp="tf.Answer=f.array[1]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="260"  width="20"  y="240"  text="&f.array[2]"  exp="tf.Answer=f.array[2]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="260"  width="20"  y="310"  text="&f.array[3]"  exp="tf.Answer=f.array[3]" storage="BochuGame.ks" target="*Kotae"  ]

[glink  color="rosy"  size="20"  x="360"  width="20"  y="100"  text="&f.array[4]"  exp="tf.Answer=f.array[4]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="360"  width="20"  y="170"  text="&f.array[5]"  exp="tf.Answer=f.array[5]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="360"  width="20"  y="240"  text="&f.array[6]"  exp="tf.Answer=f.array[6]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="360"  width="20"  y="310"  text="&f.array[7]"  exp="tf.Answer=f.array[7]" storage="BochuGame.ks" target="*Kotae"  ]

[glink  color="rosy"  size="20"  x="460"  width="20"  y="100"  text="&f.array[8]"  exp="tf.Answer=f.array[8]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="460"  width="20"  y="170"  text="&f.array[9]"  exp="tf.Answer=f.array[9]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="460"  width="20"  y="240"  text="&f.array[10]"  exp="tf.Answer=f.array[10]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="460"  width="20"  y="310"  text="&f.array[11]"  exp="tf.Answer=f.array[11]" storage="BochuGame.ks" target="*Kotae"  ]

[glink  color="rosy"  size="20"  x="560"  width="20"  y="100"  text="&f.array[12]"  exp="tf.Answer=f.array[12]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="560"  width="20"  y="170"  text="&f.array[13]"  exp="tf.Answer=f.array[13]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="560"  width="20"  y="240"  text="&f.array[14]"  exp="tf.Answer=f.array[14]" storage="BochuGame.ks" target="*Kotae"  ]
[glink  color="rosy"  size="20"  x="560"  width="20"  y="310"  text="&f.array[15]"  exp="tf.Answer=f.array[15]" storage="BochuGame.ks" target="*Kotae"  ]
[wait time=5000]
[jump target="*timeout"]
[s]

*Kotae
[wait_cancel]
[if exp="tf.Sample == tf.Answer"]
成功[p]
[eval exp="tf.VP=tf.VP+3"]

[else]
失敗[p]
くぬぎはうまく集中することができなかった[p]
[eval exp="tf.VP=tf.VP+1"]
[endif]
[jump storage="bochu.ks" target="&tf.label"]
[s]

*timeout
[cm]
時間切れ[p]
失敗[p]
くぬぎはうまく集中することができなかった[p]
[jump storage="bochu.ks" target="&tf.label"]
[s]
