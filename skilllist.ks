*集中
「集中」[p]
敵の命中力が上昇[p]
[eval exp="tf.E_DEXb1 = 1.5"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*沈静化
「沈静化」[p]
敵の欲情が減少[p]
[eval exp="tf.E_ERO = tf.E_ERO - 20"][limit]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*全力
「全力」[p]
敵の物理攻撃力が上昇[p]
[eval exp="tf.E_STRb3 = 1.3"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*激怒
「激怒」[p]
敵の物理攻撃力が上昇、耐久力が減少（1ターン）[p]
[eval exp="tf.E_STRb1 = 1.5 ,tf.E_DURb1 = 0.7"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*剛体
「剛体」[p]
敵の防御が上昇[p]
[eval exp="tf.E_DURb1 = 1.5"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*見切り
「見切り」[p]
敵の回避が上昇[p]
[eval exp="tf.E_AGIb1 = 1.5"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*視姦
「視姦」[p]
敵の命中が上昇(１ターン)。この戦闘中、くぬぎの感度が増幅[p]
[eval exp="tf.E_DEXb1 = 1.3"][eval exp="f.P_SENboost = f.P_SENboost + 0.2"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*挑発
「挑発」[p]
くぬぎの攻撃力が上昇、命中が減少(１ターン)[p]
[eval exp="tf.P_STRb1 = 1.3"][eval exp="tf.P_DEXd1 = 0.7"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*気合
「気合」[p]
敵の気力が上昇[p]
[eval exp="f.E_AUR = f.E_AUR + 10"][limit]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*奇声
「奇声」[p]
くぬぎの気力が減少[p]
[eval exp="f.P_AUR = f.P_AUR - 20"][limit]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*吸収
「吸収」[p]
くぬぎの気力が減少。敵の気力が上昇[p]
[eval exp="f.E_AUR = f.E_AUR + 10"][eval exp="f.E_AUR = f.E_AUR + 10"][limit][limit]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*呪言
「呪言」[p]
くぬぎの運気が低下[p]
[eval exp="f.P_LUK = f.P_LUK - 1"][limit]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*毒霧
「毒霧」[p]
くぬぎの体力が減少[p]
[eval exp="tf.P_HP = tf.P_HP - 100"][eval exp="tf.P_HP = 1" cond="tf.P_HP < 0"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*粘液
「粘液」[p]
くぬぎの回避が低下[p]
[eval exp="tf.P_AGId1 = 0.7"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*煙幕
「煙幕」[p]
くぬぎの命中が低下[p]
[eval exp="tf.P_DEXd1 = 0.7"]
[jump storage="battle.ks" target="*P_phase_start"]
[s]

*媚薬
「催淫香」[p]
くぬぎの欲情が上昇した[p]
[eval exp="tf.Max=5 , tf.Min=2"][dice][eval exp="tf.P_ERO = tf.P_ERO + tf.dice"]

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

[jump storage="battle.ks" target="*P_phase_start"]
[s]

*剥ぎ取り
[Calc_Status]
;この時点で裸だった場合
[jump target="*組付B" cond="tf.P_DRESS==0"]

「剥ぎ取り」[p]
敵の手が怪しく閃きくぬぎの服の裾を掴んだ[p]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 0 , tf.ACC = 0 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
;命中：[emb exp="tf.HitRate"]％[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice]

[if exp="tf.OrgaStan > 0 && tf.P_DRESS > 1"]
絶頂で身動きの取れないくぬぎは為す術なく装束を剥がされた[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 33 , tf.P_DRESS = 1"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.OrgaStan > 0 && tf.P_DRESS > 0"]
絶頂で身動きの取れないくぬぎは為す術なく全裸に剥かれた[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 0 , tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.P_DRESS > 1 && tf.HIT > tf.dice"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
くぬぎは装束を剥がされた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]

[elsif exp="tf.P_DRESS > 0 && tf.HIT > tf.dice"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
くぬぎは一糸まとわぬ姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[else]
くぬぎは敵の腕を躱した[p]
[endif]

[jump storage="battle.ks" target="*E_attack_select"]
[s]

*切り裂き
[Calc_Status]
;この時点で裸だった場合
[jump target="*組付B" cond="tf.P_DRESS==0"]

「切り裂き」[p]
敵の手が怪しく閃きくぬぎの装束を切り裂いた[p]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 0 , tf.ACC = 0 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
;命中：[emb exp="tf.HitRate"]％[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.OrgaStan > 0 && tf.P_DRESS > 1"]
絶頂で身動きの取れないくぬぎは為す術なく下着姿にされた[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 33 , tf.P_DRESS = 1"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.OrgaStan > 0 && tf.P_DRESS > 0"]
絶頂で身動きの取れないくぬぎは為す術なく全裸に剥かれた[p]くぬぎの色気が上昇した[p]
[eval exp="tf.P_ARMOR = 0 , tf.P_DRESS = 0"]
[chara_mod name="kunugi" face="nude"]

[elsif exp="tf.P_DRESS > 1 && tf.HIT > tf.dice"]
[eval exp="tf.P_ARMOR = 33 ,tf.P_DRESS = 1"]
くぬぎは下着姿になった[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]

[elsif exp="tf.P_DRESS > 0 && tf.HIT > tf.dice"]
[eval exp="tf.P_ARMOR = 0 ,tf.P_DRESS = 0"]
くぬぎは裸になった[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]

[else]
[eval exp="tf.P_ARMOR = tf.P_ARMOR - 30"][limit]
[chara_mod name="kunugi" face="nude"]
[endif]

[if exp="tf.P_ARMOR >= 33 "]
;何も起きない
[elsif exp="tf.P_ARMOR > 0 && tf.P_DRESS > 1"]
[eval exp="tf.P_DRESS = 1"]
くぬぎは下着姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="seminude"]

[elsif exp="tf.P_ARMOR = 0 && tf.P_DRESS > 0"]
[eval exp="tf.P_DRESS = 0"]
くぬぎは一糸まとわぬ姿に剥かれた[p]くぬぎの色気が上昇した[p]
[chara_mod name="kunugi" face="nude"]
[endif]

[jump storage="battle.ks" target="*E_attack_select"]
[s]

*組付A
組付[p]
[Calc_Status]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 0 , tf.ACC = 0 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
;命中：[emb exp="tf.HitRate"]％[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.HIT > tf.dice"]
くぬぎは敵に組み付かれた[p]
[jump storage="battle.ks" target="*mount_start"]
[else]
くぬぎは敵の組付を躱した[p]
[jump storage="battle.ks" target="*E_attack_select"]
[endif]
[s]

*組付B
組付[p]
[Calc_Status]
[eval exp="tf.E_ACT=tf.E_ACT-1 , tf.RATE = 0 , tf.ACC = 40 , tf.E_ATK='*E_attack_1'"]
[eval exp="tf.HIT = Math.floor(tf.ACC + tf.E_DEX * 3 - tf.P_AGI * tf.ArousAGId)"]
[Calc_HitRate]
;命中：[emb exp="tf.HitRate"]％[p]
[eval exp="tf.Max=99 , tf.Min=0"][dice]
[if exp="tf.HIT > tf.dice"]
くぬぎは敵に組み付かれた[p]
[jump storage="battle.ks" target="*mount_start"]
[endif]
くぬぎは敵の組付を躱した[p]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]

*気迫
「気迫」[p]
敵に気圧されたくぬぎの呼吸が１減少[p]
[eval exp="tf.P_ACT = tf.P_ACT - 1 , tf.E_ACT = tf.E_ACT - 1"]
[eval exp="f.E_AUR = f.E_AUR - 10"]
[limit]
[jump storage="battle.ks"  target="*ikigire" cond="tf.P_ACT <= 0"]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]

*轟爆斧
「轟爆斧」[p]
大上段から敵の薙刀が叩きつけられた[p]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.ATP = 10.0 * tf.E_STR * tf.E_charm_STR "]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit][triage]
[limit]
[MAZO][Orgasm][SANcheck]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]

*旋風棍
「旋風棍」[p]
唸りを上げて敵の棍が乱れ打ちを放った[p]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.ATP = 10.0 * tf.E_STR * tf.E_charm_STR "]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit][triage]
くぬぎの防御力が低下した(３ターン)[p]
[eval exp="tf.P_AGId3 = 0.8"][limit]
[MAZO][Orgasm][SANcheck]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]

*青龍拳
「青龍拳」[p]
うねるような軌跡を描いて拳撃が襲いかかった[p]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.ATP = 10.0 * tf.E_STR * tf.E_charm_STR "]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit][triage]
くぬぎの攻撃力が低下した(３ターン)[p]
[eval exp="tf.P_AGId3 = 0.8"][limit]
[MAZO][Orgasm][SANcheck]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]

*つむじ切り
「つむじ切り」[p]
それまでとは打って変わった俊敏な踏み込みから斬撃が放たれた[p]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.ATP = 9.0 * tf.E_STR * tf.E_charm_STR "]
[eval exp="tf.Damage =  Math.floor(tf.ATP - tf.DEF)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit][triage]
くぬぎの命中が低下した(３ターン)[p]
[eval exp="tf.P_DEXd3 = 0.8"][limit]
[MAZO][Orgasm][SANcheck]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]

*波動A
「波動・裂波」[p]
不可視の力がくぬぎの身体を弾き飛ばした[p]
[eval exp="tf.Max=9 , tf.Min=0+f.P_LUK"][dice][eval exp="tf.DEF = Math.floor(tf.P_DUR * tf.P_GRD * 2 + tf.dice)"]
[eval exp="tf.ATP = 30.0 * tf.E_POW * tf.E_charm_STR "]
[eval exp="tf.Damage =  Math.floor(tf.ATP + 1)"][eval exp="tf.Damage = 0" cond="tf.Damage<0"]
[quake count=5 time=300 hmax=20]
くぬぎに[emb exp="tf.Damage"]のダメージ[p]
[jump storage="battle.ks" target="*P_Barrier" cond="tf.P_Barrier>0"]
[eval exp="tf.P_HP = tf.P_HP - tf.Damage"][limit][triage]
くぬぎの敏捷が低下した(３ターン)[p]
[eval exp="tf.P_AGId3 = 0.8"][limit]
[MAZO][Orgasm][SANcheck]
[if exp="tf.E_ACT>0"][jump storage="battle.ks" target="*E_attack_select"]
[else][jump storage="battle.ks" target="*turn_end"][endif]
[s]
