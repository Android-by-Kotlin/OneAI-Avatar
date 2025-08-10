.class public Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;
.super Ljava/lang/Object;
.source "SessionDescriptionImpl.java"

# interfaces
.implements Landroid/javax/sdp/SessionDescription;


# instance fields
.field protected attributesList:Ljava/util/Vector;

.field protected bandwidthList:Ljava/util/Vector;

.field protected connectionImpl:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

.field private currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

.field private currentTimeDescription:Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

.field protected emailList:Ljava/util/Vector;

.field protected infoImpl:Landroid/gov/nist/javax/sdp/fields/InformationField;

.field protected keyImpl:Landroid/gov/nist/javax/sdp/fields/KeyField;

.field protected mediaDescriptions:Ljava/util/Vector;

.field protected originImpl:Landroid/gov/nist/javax/sdp/fields/OriginField;

.field protected phoneList:Ljava/util/Vector;

.field protected sessionNameImpl:Landroid/gov/nist/javax/sdp/fields/SessionNameField;

.field protected timeDescriptions:Ljava/util/Vector;

.field protected uriImpl:Landroid/gov/nist/javax/sdp/fields/URIField;

.field protected versionImpl:Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

.field protected zoneAdjustments:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/javax/sdp/SessionDescription;)V
    .locals 30
    .param p1, "otherSessionDescription"    # Landroid/javax/sdp/SessionDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 97
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 99
    if-nez v1, :cond_0

    return-void

    .line 102
    :cond_0
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getVersion()Landroid/javax/sdp/Version;

    move-result-object v2

    .line 103
    .local v2, "otherVersion":Landroid/javax/sdp/Version;
    if-eqz v2, :cond_1

    .line 104
    invoke-interface {v2}, Landroid/javax/sdp/Version;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/javax/sdp/Version;

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setVersion(Landroid/javax/sdp/Version;)V

    .line 108
    :cond_1
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getOrigin()Landroid/javax/sdp/Origin;

    move-result-object v3

    .line 109
    .local v3, "otherOrigin":Landroid/javax/sdp/Origin;
    if-eqz v3, :cond_2

    .line 110
    invoke-interface {v3}, Landroid/javax/sdp/Origin;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/javax/sdp/Origin;

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setOrigin(Landroid/javax/sdp/Origin;)V

    .line 114
    :cond_2
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getSessionName()Landroid/javax/sdp/SessionName;

    move-result-object v4

    .line 115
    .local v4, "otherSessionName":Landroid/javax/sdp/SessionName;
    if-eqz v4, :cond_3

    .line 116
    invoke-interface {v4}, Landroid/javax/sdp/SessionName;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/javax/sdp/SessionName;

    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setSessionName(Landroid/javax/sdp/SessionName;)V

    .line 120
    :cond_3
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getInfo()Landroid/javax/sdp/Info;

    move-result-object v5

    .line 121
    .local v5, "otherInfo":Landroid/javax/sdp/Info;
    if-eqz v5, :cond_4

    .line 122
    invoke-interface {v5}, Landroid/javax/sdp/Info;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/javax/sdp/Info;

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setInfo(Landroid/javax/sdp/Info;)V

    .line 126
    :cond_4
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getURI()Landroid/javax/sdp/URI;

    move-result-object v6

    check-cast v6, Landroid/gov/nist/javax/sdp/fields/URIField;

    .line 127
    .local v6, "otherUriField":Landroid/gov/nist/javax/sdp/fields/URIField;
    if-eqz v6, :cond_5

    .line 128
    new-instance v7, Landroid/gov/nist/javax/sdp/fields/URIField;

    invoke-direct {v7}, Landroid/gov/nist/javax/sdp/fields/URIField;-><init>()V

    .line 131
    .local v7, "newUF":Landroid/gov/nist/javax/sdp/fields/URIField;
    invoke-virtual {v6}, Landroid/gov/nist/javax/sdp/fields/URIField;->get()Ljava/net/URL;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/gov/nist/javax/sdp/fields/URIField;->set(Ljava/net/URL;)V

    .line 132
    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setURI(Landroid/javax/sdp/URI;)V

    .line 136
    .end local v7    # "newUF":Landroid/gov/nist/javax/sdp/fields/URIField;
    :cond_5
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getConnection()Landroid/javax/sdp/Connection;

    move-result-object v7

    .line 137
    .local v7, "otherConnection":Landroid/javax/sdp/Connection;
    if-eqz v7, :cond_6

    .line 138
    invoke-interface {v7}, Landroid/javax/sdp/Connection;->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/javax/sdp/Connection;

    invoke-virtual {v0, v8}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setConnection(Landroid/javax/sdp/Connection;)V

    .line 142
    :cond_6
    invoke-interface/range {p1 .. p1}, Landroid/javax/sdp/SessionDescription;->getKey()Landroid/javax/sdp/Key;

    move-result-object v8

    .line 143
    .local v8, "otherKey":Landroid/javax/sdp/Key;
    if-eqz v8, :cond_7

    .line 144
    invoke-interface {v8}, Landroid/javax/sdp/Key;->clone()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/javax/sdp/Key;

    invoke-virtual {v0, v9}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setKey(Landroid/javax/sdp/Key;)V

    .line 148
    :cond_7
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Landroid/javax/sdp/SessionDescription;->getTimeDescriptions(Z)Ljava/util/Vector;

    move-result-object v10

    .line 149
    .local v10, "otherTimeDescriptions":Ljava/util/Vector;
    if-eqz v10, :cond_c

    .line 150
    new-instance v11, Ljava/util/Vector;

    invoke-direct {v11}, Ljava/util/Vector;-><init>()V

    .line 151
    .local v11, "newTDs":Ljava/util/Vector;
    invoke-virtual {v10}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 152
    .local v12, "itTimeDescriptions":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b

    .line 153
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    .line 154
    .local v13, "otherTimeDescription":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    if-eqz v13, :cond_a

    .line 155
    invoke-virtual {v13}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->getTime()Landroid/javax/sdp/Time;

    move-result-object v14

    invoke-interface {v14}, Landroid/javax/sdp/Time;->clone()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/gov/nist/javax/sdp/fields/TimeField;

    .line 156
    .local v14, "otherTimeField":Landroid/gov/nist/javax/sdp/fields/TimeField;
    new-instance v15, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    invoke-direct {v15, v14}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;-><init>(Landroid/gov/nist/javax/sdp/fields/TimeField;)V

    .line 157
    .local v15, "newTD":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    invoke-virtual {v13, v9}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->getRepeatTimes(Z)Ljava/util/Vector;

    move-result-object v16

    .line 158
    .local v16, "otherRepeatTimes":Ljava/util/Vector;
    if-eqz v16, :cond_9

    .line 159
    invoke-virtual/range {v16 .. v16}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .line 160
    .local v17, "itRepeatTimes":Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_9

    .line 161
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    .line 162
    .local v18, "otherRepeatField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    if-eqz v18, :cond_8

    .line 164
    invoke-virtual/range {v18 .. v18}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->clone()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v9, v19

    check-cast v9, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    .line 165
    .local v9, "newRF":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    invoke-virtual {v15, v9}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->addRepeatField(Landroid/gov/nist/javax/sdp/fields/RepeatField;)V

    .line 167
    .end local v9    # "newRF":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    .end local v18    # "otherRepeatField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    :cond_8
    const/4 v9, 0x0

    goto :goto_1

    .line 169
    .end local v17    # "itRepeatTimes":Ljava/util/Iterator;
    :cond_9
    invoke-virtual {v11, v15}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 171
    .end local v13    # "otherTimeDescription":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    .end local v14    # "otherTimeField":Landroid/gov/nist/javax/sdp/fields/TimeField;
    .end local v15    # "newTD":Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;
    .end local v16    # "otherRepeatTimes":Ljava/util/Vector;
    :cond_a
    const/4 v9, 0x0

    goto :goto_0

    .line 172
    :cond_b
    invoke-virtual {v0, v11}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setTimeDescriptions(Ljava/util/Vector;)V

    .line 176
    .end local v11    # "newTDs":Ljava/util/Vector;
    .end local v12    # "itTimeDescriptions":Ljava/util/Iterator;
    :cond_c
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Landroid/javax/sdp/SessionDescription;->getEmails(Z)Ljava/util/Vector;

    move-result-object v11

    .line 177
    .local v11, "otherEmails":Ljava/util/Vector;
    if-eqz v11, :cond_f

    .line 178
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 179
    .local v9, "newEmails":Ljava/util/Vector;
    invoke-virtual {v11}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 180
    .local v12, "itEmails":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 181
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/gov/nist/javax/sdp/fields/EmailField;

    .line 182
    .local v13, "otherEmailField":Landroid/gov/nist/javax/sdp/fields/EmailField;
    if-eqz v13, :cond_d

    .line 184
    invoke-virtual {v13}, Landroid/gov/nist/javax/sdp/fields/EmailField;->clone()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/gov/nist/javax/sdp/fields/EmailField;

    .line 185
    .local v14, "newEF":Landroid/gov/nist/javax/sdp/fields/EmailField;
    invoke-virtual {v9, v14}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 187
    .end local v13    # "otherEmailField":Landroid/gov/nist/javax/sdp/fields/EmailField;
    .end local v14    # "newEF":Landroid/gov/nist/javax/sdp/fields/EmailField;
    :cond_d
    goto :goto_2

    .line 188
    :cond_e
    invoke-virtual {v0, v9}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setEmails(Ljava/util/Vector;)V

    .line 192
    .end local v9    # "newEmails":Ljava/util/Vector;
    .end local v12    # "itEmails":Ljava/util/Iterator;
    :cond_f
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Landroid/javax/sdp/SessionDescription;->getPhones(Z)Ljava/util/Vector;

    move-result-object v12

    .line 193
    .local v12, "otherPhones":Ljava/util/Vector;
    if-eqz v12, :cond_12

    .line 194
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 195
    .local v9, "newPhones":Ljava/util/Vector;
    invoke-virtual {v12}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 196
    .local v13, "itPhones":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_11

    .line 197
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/gov/nist/javax/sdp/fields/PhoneField;

    .line 198
    .local v14, "otherPhoneField":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    if-eqz v14, :cond_10

    .line 200
    invoke-virtual {v14}, Landroid/gov/nist/javax/sdp/fields/PhoneField;->clone()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/gov/nist/javax/sdp/fields/PhoneField;

    .line 201
    .local v15, "newPF":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    invoke-virtual {v9, v15}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 203
    .end local v14    # "otherPhoneField":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    .end local v15    # "newPF":Landroid/gov/nist/javax/sdp/fields/PhoneField;
    :cond_10
    goto :goto_3

    .line 204
    :cond_11
    invoke-virtual {v0, v9}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setPhones(Ljava/util/Vector;)V

    .line 208
    .end local v9    # "newPhones":Ljava/util/Vector;
    .end local v13    # "itPhones":Ljava/util/Iterator;
    :cond_12
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Landroid/javax/sdp/SessionDescription;->getZoneAdjustments(Z)Ljava/util/Vector;

    move-result-object v13

    .line 209
    .local v13, "otherZAs":Ljava/util/Vector;
    if-eqz v13, :cond_15

    .line 210
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 211
    .local v9, "newZAs":Ljava/util/Vector;
    invoke-virtual {v13}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 212
    .local v14, "itZAs":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_14

    .line 213
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/gov/nist/javax/sdp/fields/ZoneField;

    .line 214
    .local v15, "otherZoneField":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    if-eqz v15, :cond_13

    .line 216
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/fields/ZoneField;->clone()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v17, v2

    .end local v2    # "otherVersion":Landroid/javax/sdp/Version;
    .local v17, "otherVersion":Landroid/javax/sdp/Version;
    move-object/from16 v2, v16

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/ZoneField;

    .line 217
    .local v2, "newPF":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    invoke-virtual {v9, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 214
    .end local v17    # "otherVersion":Landroid/javax/sdp/Version;
    .local v2, "otherVersion":Landroid/javax/sdp/Version;
    :cond_13
    move-object/from16 v17, v2

    .line 219
    .end local v2    # "otherVersion":Landroid/javax/sdp/Version;
    .end local v15    # "otherZoneField":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    .restart local v17    # "otherVersion":Landroid/javax/sdp/Version;
    :goto_5
    move-object/from16 v2, v17

    goto :goto_4

    .line 220
    .end local v17    # "otherVersion":Landroid/javax/sdp/Version;
    .restart local v2    # "otherVersion":Landroid/javax/sdp/Version;
    :cond_14
    move-object/from16 v17, v2

    .end local v2    # "otherVersion":Landroid/javax/sdp/Version;
    .restart local v17    # "otherVersion":Landroid/javax/sdp/Version;
    invoke-virtual {v0, v9}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setZoneAdjustments(Ljava/util/Vector;)V

    goto :goto_6

    .line 209
    .end local v9    # "newZAs":Ljava/util/Vector;
    .end local v14    # "itZAs":Ljava/util/Iterator;
    .end local v17    # "otherVersion":Landroid/javax/sdp/Version;
    .restart local v2    # "otherVersion":Landroid/javax/sdp/Version;
    :cond_15
    move-object/from16 v17, v2

    .line 224
    .end local v2    # "otherVersion":Landroid/javax/sdp/Version;
    .restart local v17    # "otherVersion":Landroid/javax/sdp/Version;
    :goto_6
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/javax/sdp/SessionDescription;->getBandwidths(Z)Ljava/util/Vector;

    move-result-object v9

    .line 225
    .local v9, "otherBandwidths":Ljava/util/Vector;
    if-eqz v9, :cond_18

    .line 226
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 227
    .local v2, "newBandwidths":Ljava/util/Vector;
    invoke-virtual {v9}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 228
    .local v14, "itBandwidths":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_17

    .line 229
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 230
    .local v15, "otherBandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    if-eqz v15, :cond_16

    .line 232
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->clone()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v18, v3

    .end local v3    # "otherOrigin":Landroid/javax/sdp/Origin;
    .local v18, "otherOrigin":Landroid/javax/sdp/Origin;
    move-object/from16 v3, v16

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 233
    .local v3, "newBF":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 230
    .end local v18    # "otherOrigin":Landroid/javax/sdp/Origin;
    .local v3, "otherOrigin":Landroid/javax/sdp/Origin;
    :cond_16
    move-object/from16 v18, v3

    .line 235
    .end local v3    # "otherOrigin":Landroid/javax/sdp/Origin;
    .end local v15    # "otherBandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .restart local v18    # "otherOrigin":Landroid/javax/sdp/Origin;
    :goto_8
    move-object/from16 v3, v18

    goto :goto_7

    .line 236
    .end local v18    # "otherOrigin":Landroid/javax/sdp/Origin;
    .restart local v3    # "otherOrigin":Landroid/javax/sdp/Origin;
    :cond_17
    move-object/from16 v18, v3

    .end local v3    # "otherOrigin":Landroid/javax/sdp/Origin;
    .restart local v18    # "otherOrigin":Landroid/javax/sdp/Origin;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setBandwidths(Ljava/util/Vector;)V

    goto :goto_9

    .line 225
    .end local v2    # "newBandwidths":Ljava/util/Vector;
    .end local v14    # "itBandwidths":Ljava/util/Iterator;
    .end local v18    # "otherOrigin":Landroid/javax/sdp/Origin;
    .restart local v3    # "otherOrigin":Landroid/javax/sdp/Origin;
    :cond_18
    move-object/from16 v18, v3

    .line 240
    .end local v3    # "otherOrigin":Landroid/javax/sdp/Origin;
    .restart local v18    # "otherOrigin":Landroid/javax/sdp/Origin;
    :goto_9
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/javax/sdp/SessionDescription;->getAttributes(Z)Ljava/util/Vector;

    move-result-object v3

    .line 241
    .local v3, "otherAttributes":Ljava/util/Vector;
    if-eqz v3, :cond_1b

    .line 242
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 243
    .local v2, "newAttributes":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 244
    .local v14, "itAttributes":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1a

    .line 245
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 246
    .local v15, "otherAttributeField":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    if-eqz v15, :cond_19

    .line 248
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->clone()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v19, v3

    .end local v3    # "otherAttributes":Ljava/util/Vector;
    .local v19, "otherAttributes":Ljava/util/Vector;
    move-object/from16 v3, v16

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 249
    .local v3, "newBF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 246
    .end local v19    # "otherAttributes":Ljava/util/Vector;
    .local v3, "otherAttributes":Ljava/util/Vector;
    :cond_19
    move-object/from16 v19, v3

    .line 251
    .end local v3    # "otherAttributes":Ljava/util/Vector;
    .end local v15    # "otherAttributeField":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .restart local v19    # "otherAttributes":Ljava/util/Vector;
    :goto_b
    move-object/from16 v3, v19

    goto :goto_a

    .line 252
    .end local v19    # "otherAttributes":Ljava/util/Vector;
    .restart local v3    # "otherAttributes":Ljava/util/Vector;
    :cond_1a
    move-object/from16 v19, v3

    .end local v3    # "otherAttributes":Ljava/util/Vector;
    .restart local v19    # "otherAttributes":Ljava/util/Vector;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setAttributes(Ljava/util/Vector;)V

    goto :goto_c

    .line 241
    .end local v2    # "newAttributes":Ljava/util/Vector;
    .end local v14    # "itAttributes":Ljava/util/Iterator;
    .end local v19    # "otherAttributes":Ljava/util/Vector;
    .restart local v3    # "otherAttributes":Ljava/util/Vector;
    :cond_1b
    move-object/from16 v19, v3

    .line 256
    .end local v3    # "otherAttributes":Ljava/util/Vector;
    .restart local v19    # "otherAttributes":Ljava/util/Vector;
    :goto_c
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/javax/sdp/SessionDescription;->getMediaDescriptions(Z)Ljava/util/Vector;

    move-result-object v3

    .line 257
    .local v3, "otherMediaDescriptions":Ljava/util/Vector;
    if-eqz v3, :cond_2b

    .line 258
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 259
    .local v2, "newMDs":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 260
    .local v14, "itMediaDescriptions":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2a

    .line 261
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    .line 262
    .local v15, "otherMediaDescription":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    if-eqz v15, :cond_29

    .line 263
    new-instance v16, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    invoke-direct/range {v16 .. v16}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;-><init>()V

    move-object/from16 v21, v16

    .line 266
    .local v21, "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getMediaField()Landroid/gov/nist/javax/sdp/fields/MediaField;

    move-result-object v16

    .line 267
    .local v16, "otherMediaField":Landroid/gov/nist/javax/sdp/fields/MediaField;
    if-eqz v16, :cond_1f

    .line 269
    new-instance v22, Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-direct/range {v22 .. v22}, Landroid/gov/nist/javax/sdp/fields/MediaField;-><init>()V

    move-object/from16 v23, v22

    .line 270
    .local v23, "newMF":Landroid/gov/nist/javax/sdp/fields/MediaField;
    invoke-virtual/range {v16 .. v16}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getMedia()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v22, v3

    move-object/from16 v3, v23

    .end local v23    # "newMF":Landroid/gov/nist/javax/sdp/fields/MediaField;
    .local v3, "newMF":Landroid/gov/nist/javax/sdp/fields/MediaField;
    .local v22, "otherMediaDescriptions":Ljava/util/Vector;
    invoke-virtual {v3, v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMedia(Ljava/lang/String;)V

    .line 271
    invoke-virtual/range {v16 .. v16}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getPort()I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setPort(I)V

    .line 272
    invoke-virtual/range {v16 .. v16}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getNports()I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setNports(I)V

    .line 273
    invoke-virtual/range {v16 .. v16}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getProto()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setProto(Ljava/lang/String;)V

    .line 274
    invoke-virtual/range {v16 .. v16}, Landroid/gov/nist/javax/sdp/fields/MediaField;->getFormats()Ljava/util/Vector;

    move-result-object v1

    .line 275
    .local v1, "otherFormats":Ljava/util/Vector;
    if-eqz v1, :cond_1e

    .line 276
    new-instance v23, Ljava/util/Vector;

    invoke-direct/range {v23 .. v23}, Ljava/util/Vector;-><init>()V

    move-object/from16 v24, v23

    .line 277
    .local v24, "newFormats":Ljava/util/Vector;
    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .line 278
    .local v23, "itFormats":Ljava/util/Iterator;
    :goto_e
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_1d

    .line 279
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    .line 280
    .local v25, "otherFormat":Ljava/lang/Object;
    if-eqz v25, :cond_1c

    .line 282
    move-object/from16 v26, v1

    .end local v1    # "otherFormats":Ljava/util/Vector;
    .local v26, "otherFormats":Ljava/util/Vector;
    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v27, v4

    move-object/from16 v4, v24

    .end local v24    # "newFormats":Ljava/util/Vector;
    .local v4, "newFormats":Ljava/util/Vector;
    .local v27, "otherSessionName":Landroid/javax/sdp/SessionName;
    invoke-virtual {v4, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 280
    .end local v26    # "otherFormats":Ljava/util/Vector;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v1    # "otherFormats":Ljava/util/Vector;
    .local v4, "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v24    # "newFormats":Ljava/util/Vector;
    :cond_1c
    move-object/from16 v26, v1

    move-object/from16 v27, v4

    move-object/from16 v4, v24

    .line 284
    .end local v1    # "otherFormats":Ljava/util/Vector;
    .end local v24    # "newFormats":Ljava/util/Vector;
    .end local v25    # "otherFormat":Ljava/lang/Object;
    .local v4, "newFormats":Ljava/util/Vector;
    .restart local v26    # "otherFormats":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :goto_f
    move-object/from16 v24, v4

    move-object/from16 v1, v26

    move-object/from16 v4, v27

    goto :goto_e

    .line 285
    .end local v26    # "otherFormats":Ljava/util/Vector;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v1    # "otherFormats":Ljava/util/Vector;
    .local v4, "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v24    # "newFormats":Ljava/util/Vector;
    :cond_1d
    move-object/from16 v26, v1

    move-object/from16 v27, v4

    move-object/from16 v4, v24

    .end local v1    # "otherFormats":Ljava/util/Vector;
    .end local v24    # "newFormats":Ljava/util/Vector;
    .local v4, "newFormats":Ljava/util/Vector;
    .restart local v26    # "otherFormats":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setFormats(Ljava/util/Vector;)V

    goto :goto_10

    .line 275
    .end local v23    # "itFormats":Ljava/util/Iterator;
    .end local v26    # "otherFormats":Ljava/util/Vector;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v1    # "otherFormats":Ljava/util/Vector;
    .local v4, "otherSessionName":Landroid/javax/sdp/SessionName;
    :cond_1e
    move-object/from16 v26, v1

    move-object/from16 v27, v4

    .line 287
    .end local v1    # "otherFormats":Ljava/util/Vector;
    .end local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v26    # "otherFormats":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :goto_10
    move-object/from16 v1, v21

    .end local v21    # "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    .local v1, "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setMedia(Landroid/javax/sdp/Media;)V

    goto :goto_11

    .line 267
    .end local v1    # "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    .end local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v26    # "otherFormats":Ljava/util/Vector;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .local v3, "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v21    # "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    :cond_1f
    move-object/from16 v22, v3

    move-object/from16 v27, v4

    move-object/from16 v1, v21

    .line 291
    .end local v3    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .end local v21    # "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    .restart local v1    # "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    .restart local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :goto_11
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getInformationField()Landroid/gov/nist/javax/sdp/fields/InformationField;

    move-result-object v3

    .line 292
    .local v3, "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    if-eqz v3, :cond_20

    .line 293
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/InformationField;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sdp/fields/InformationField;

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setInformationField(Landroid/gov/nist/javax/sdp/fields/InformationField;)V

    .line 297
    :cond_20
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getConnectionField()Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    move-result-object v4

    .line 298
    .local v4, "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    if-eqz v4, :cond_21

    .line 299
    invoke-virtual {v4}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->clone()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v23, v3

    .end local v3    # "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    .local v23, "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    move-object/from16 v3, v21

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setConnectionField(Landroid/gov/nist/javax/sdp/fields/ConnectionField;)V

    goto :goto_12

    .line 298
    .end local v23    # "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    .restart local v3    # "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    :cond_21
    move-object/from16 v23, v3

    .line 303
    .end local v3    # "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    .restart local v23    # "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    :goto_12
    const/4 v3, 0x0

    invoke-virtual {v15, v3}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getBandwidths(Z)Ljava/util/Vector;

    move-result-object v20

    .line 304
    .local v20, "otherBFs":Ljava/util/Vector;
    if-eqz v20, :cond_24

    .line 305
    new-instance v21, Ljava/util/Vector;

    invoke-direct/range {v21 .. v21}, Ljava/util/Vector;-><init>()V

    move-object/from16 v24, v21

    .line 306
    .local v24, "newBFs":Ljava/util/Vector;
    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .line 307
    .local v21, "itBFs":Ljava/util/Iterator;
    :goto_13
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_23

    .line 308
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 309
    .local v25, "otherBF":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    if-eqz v25, :cond_22

    .line 311
    invoke-virtual/range {v25 .. v25}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->clone()Ljava/lang/Object;

    move-result-object v26

    move-object/from16 v3, v26

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    move-object/from16 v26, v4

    move-object/from16 v4, v24

    .end local v24    # "newBFs":Ljava/util/Vector;
    .local v4, "newBFs":Ljava/util/Vector;
    .local v26, "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    invoke-virtual {v4, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_14

    .line 309
    .end local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .local v4, "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .restart local v24    # "newBFs":Ljava/util/Vector;
    :cond_22
    move-object/from16 v26, v4

    move-object/from16 v4, v24

    .line 313
    .end local v24    # "newBFs":Ljava/util/Vector;
    .end local v25    # "otherBF":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .local v4, "newBFs":Ljava/util/Vector;
    .restart local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    :goto_14
    move-object/from16 v24, v4

    move-object/from16 v4, v26

    const/4 v3, 0x0

    goto :goto_13

    .line 314
    .end local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .local v4, "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .restart local v24    # "newBFs":Ljava/util/Vector;
    :cond_23
    move-object/from16 v26, v4

    move-object/from16 v4, v24

    .end local v24    # "newBFs":Ljava/util/Vector;
    .local v4, "newBFs":Ljava/util/Vector;
    .restart local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setBandwidths(Ljava/util/Vector;)V

    goto :goto_15

    .line 304
    .end local v21    # "itBFs":Ljava/util/Iterator;
    .end local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .local v4, "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    :cond_24
    move-object/from16 v26, v4

    .line 318
    .end local v4    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .restart local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    :goto_15
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getKeyField()Landroid/gov/nist/javax/sdp/fields/KeyField;

    move-result-object v3

    .line 319
    .local v3, "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    if-eqz v3, :cond_25

    .line 320
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/KeyField;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gov/nist/javax/sdp/fields/KeyField;

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setKeyField(Landroid/gov/nist/javax/sdp/fields/KeyField;)V

    .line 324
    :cond_25
    invoke-virtual {v15}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->getAttributeFields()Ljava/util/Vector;

    move-result-object v4

    .line 325
    .local v4, "otherAFs":Ljava/util/Vector;
    if-eqz v4, :cond_28

    .line 326
    new-instance v21, Ljava/util/Vector;

    invoke-direct/range {v21 .. v21}, Ljava/util/Vector;-><init>()V

    move-object/from16 v24, v21

    .line 327
    .local v24, "newAFs":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .line 328
    .local v21, "itAFs":Ljava/util/Iterator;
    :goto_16
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_27

    .line 329
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 330
    .local v25, "otherAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    if-eqz v25, :cond_26

    .line 333
    invoke-virtual/range {v25 .. v25}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->clone()Ljava/lang/Object;

    move-result-object v28

    move-object/from16 v29, v3

    .end local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .local v29, "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    move-object/from16 v3, v28

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    move-object/from16 v28, v4

    move-object/from16 v4, v24

    .end local v24    # "newAFs":Ljava/util/Vector;
    .local v4, "newAFs":Ljava/util/Vector;
    .local v28, "otherAFs":Ljava/util/Vector;
    invoke-virtual {v4, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 330
    .end local v28    # "otherAFs":Ljava/util/Vector;
    .end local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .restart local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .local v4, "otherAFs":Ljava/util/Vector;
    .restart local v24    # "newAFs":Ljava/util/Vector;
    :cond_26
    move-object/from16 v29, v3

    move-object/from16 v28, v4

    move-object/from16 v4, v24

    .line 335
    .end local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .end local v24    # "newAFs":Ljava/util/Vector;
    .end local v25    # "otherAF":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .local v4, "newAFs":Ljava/util/Vector;
    .restart local v28    # "otherAFs":Ljava/util/Vector;
    .restart local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    :goto_17
    move-object/from16 v24, v4

    move-object/from16 v4, v28

    move-object/from16 v3, v29

    goto :goto_16

    .line 336
    .end local v28    # "otherAFs":Ljava/util/Vector;
    .end local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .restart local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .local v4, "otherAFs":Ljava/util/Vector;
    .restart local v24    # "newAFs":Ljava/util/Vector;
    :cond_27
    move-object/from16 v29, v3

    move-object/from16 v28, v4

    move-object/from16 v4, v24

    .end local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .end local v24    # "newAFs":Ljava/util/Vector;
    .local v4, "newAFs":Ljava/util/Vector;
    .restart local v28    # "otherAFs":Ljava/util/Vector;
    .restart local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setAttributeFields(Ljava/util/Vector;)V

    goto :goto_18

    .line 325
    .end local v21    # "itAFs":Ljava/util/Iterator;
    .end local v28    # "otherAFs":Ljava/util/Vector;
    .end local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .restart local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .local v4, "otherAFs":Ljava/util/Vector;
    :cond_28
    move-object/from16 v29, v3

    move-object/from16 v28, v4

    .line 338
    .end local v3    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .end local v4    # "otherAFs":Ljava/util/Vector;
    .restart local v28    # "otherAFs":Ljava/util/Vector;
    .restart local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    :goto_18
    invoke-virtual {v2, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 262
    .end local v1    # "newMD":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    .end local v16    # "otherMediaField":Landroid/gov/nist/javax/sdp/fields/MediaField;
    .end local v20    # "otherBFs":Ljava/util/Vector;
    .end local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v23    # "otherInfoField":Landroid/gov/nist/javax/sdp/fields/InformationField;
    .end local v26    # "otherConnectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .end local v28    # "otherAFs":Ljava/util/Vector;
    .end local v29    # "otherKeyField":Landroid/gov/nist/javax/sdp/fields/KeyField;
    .local v3, "otherMediaDescriptions":Ljava/util/Vector;
    .local v4, "otherSessionName":Landroid/javax/sdp/SessionName;
    :cond_29
    move-object/from16 v22, v3

    move-object/from16 v27, v4

    .line 340
    .end local v3    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .end local v15    # "otherMediaDescription":Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;
    .restart local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :goto_19
    move-object/from16 v1, p1

    move-object/from16 v3, v22

    move-object/from16 v4, v27

    goto/16 :goto_d

    .line 341
    .end local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v3    # "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :cond_2a
    move-object/from16 v22, v3

    move-object/from16 v27, v4

    .end local v3    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->setMediaDescriptions(Ljava/util/Vector;)V

    goto :goto_1a

    .line 257
    .end local v2    # "newMDs":Ljava/util/Vector;
    .end local v14    # "itMediaDescriptions":Ljava/util/Iterator;
    .end local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v3    # "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :cond_2b
    move-object/from16 v22, v3

    move-object/from16 v27, v4

    .line 343
    .end local v3    # "otherMediaDescriptions":Ljava/util/Vector;
    .end local v4    # "otherSessionName":Landroid/javax/sdp/SessionName;
    .restart local v22    # "otherMediaDescriptions":Ljava/util/Vector;
    .restart local v27    # "otherSessionName":Landroid/javax/sdp/SessionName;
    :goto_1a
    return-void
.end method

.method private encodeVector(Ljava/util/Vector;)Ljava/lang/String;
    .locals 3
    .param p1, "vector"    # Ljava/util/Vector;

    .line 1038
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1040
    .local v0, "encBuff":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1041
    invoke-virtual {p1, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1040
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1043
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public addField(Landroid/gov/nist/javax/sdp/fields/SDPField;)V
    .locals 5
    .param p1, "sdpField"    # Landroid/gov/nist/javax/sdp/fields/SDPField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 347
    const/4 v0, 0x0

    :try_start_0
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    if-eqz v1, :cond_0

    .line 348
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->versionImpl:Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    goto/16 :goto_0

    .line 349
    :cond_0
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/OriginField;

    if-eqz v1, :cond_1

    .line 350
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/OriginField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->originImpl:Landroid/gov/nist/javax/sdp/fields/OriginField;

    goto/16 :goto_0

    .line 351
    :cond_1
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    if-eqz v1, :cond_2

    .line 352
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->sessionNameImpl:Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    goto/16 :goto_0

    .line 353
    :cond_2
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/InformationField;

    if-eqz v1, :cond_4

    .line 354
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    if-eqz v1, :cond_3

    .line 355
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/InformationField;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setInformationField(Landroid/gov/nist/javax/sdp/fields/InformationField;)V

    goto/16 :goto_0

    .line 358
    :cond_3
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/InformationField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->infoImpl:Landroid/gov/nist/javax/sdp/fields/InformationField;

    goto/16 :goto_0

    .line 359
    :cond_4
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/URIField;

    if-eqz v1, :cond_5

    .line 360
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/URIField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->uriImpl:Landroid/gov/nist/javax/sdp/fields/URIField;

    goto/16 :goto_0

    .line 361
    :cond_5
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    if-eqz v1, :cond_7

    .line 362
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    if-eqz v1, :cond_6

    .line 363
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setConnectionField(Landroid/gov/nist/javax/sdp/fields/ConnectionField;)V

    goto/16 :goto_0

    .line 366
    :cond_6
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->connectionImpl:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    goto/16 :goto_0

    .line 367
    :cond_7
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/KeyField;

    if-eqz v1, :cond_9

    .line 368
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    if-eqz v1, :cond_8

    .line 369
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/KeyField;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setKey(Landroid/javax/sdp/Key;)V

    goto/16 :goto_0

    .line 371
    :cond_8
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/KeyField;

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->keyImpl:Landroid/gov/nist/javax/sdp/fields/KeyField;

    goto/16 :goto_0

    .line 372
    :cond_9
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/EmailField;

    const/4 v2, 0x1

    if-eqz v1, :cond_a

    .line 373
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getEmails(Z)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 374
    :cond_a
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/PhoneField;

    if-eqz v1, :cond_b

    .line 375
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getPhones(Z)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 376
    :cond_b
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/TimeField;

    if-eqz v1, :cond_c

    .line 377
    new-instance v1, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    move-object v3, p1

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v1, v3}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;-><init>(Landroid/gov/nist/javax/sdp/fields/TimeField;)V

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentTimeDescription:Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    .line 379
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getTimeDescriptions(Z)Ljava/util/Vector;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentTimeDescription:Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 380
    :cond_c
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    if-eqz v1, :cond_e

    .line 381
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentTimeDescription:Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    if-eqz v1, :cond_d

    .line 384
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentTimeDescription:Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/TimeDescriptionImpl;->addRepeatField(Landroid/gov/nist/javax/sdp/fields/RepeatField;)V

    goto :goto_0

    .line 382
    :cond_d
    new-instance v1, Ljava/text/ParseException;

    const-string/jumbo v2, "no time specified"

    invoke-direct {v1, v2, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "sdpField":Landroid/gov/nist/javax/sdp/fields/SDPField;
    throw v1

    .line 387
    .restart local p1    # "sdpField":Landroid/gov/nist/javax/sdp/fields/SDPField;
    :cond_e
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/ZoneField;

    if-eqz v1, :cond_f

    .line 388
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getZoneAdjustments(Z)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 389
    :cond_f
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    if-eqz v1, :cond_11

    .line 390
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    if-eqz v1, :cond_10

    .line 391
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->addBandwidthField(Landroid/gov/nist/javax/sdp/fields/BandwidthField;)V

    goto :goto_0

    .line 394
    :cond_10
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getBandwidths(Z)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 395
    :cond_11
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    if-eqz v1, :cond_13

    .line 396
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    if-eqz v1, :cond_12

    .line 397
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 398
    .local v1, "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v1}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getName()Ljava/lang/String;

    move-result-object v2

    .line 400
    .local v2, "s":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    move-object v4, p1

    check-cast v4, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->addAttribute(Landroid/gov/nist/javax/sdp/fields/AttributeField;)V

    .line 402
    .end local v1    # "af":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 403
    :cond_12
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getAttributes(Z)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 406
    :cond_13
    instance-of v1, p1, Landroid/gov/nist/javax/sdp/fields/MediaField;

    if-eqz v1, :cond_14

    .line 407
    new-instance v1, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    invoke-direct {v1}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;-><init>()V

    iput-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    .line 408
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getMediaDescriptions(Z)Ljava/util/Vector;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 410
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->currentMediaDescription:Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;

    move-object v2, p1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sdp/MediaDescriptionImpl;->setMediaField(Landroid/gov/nist/javax/sdp/fields/MediaField;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    :cond_14
    :goto_0
    nop

    .line 415
    return-void

    .line 412
    :catch_0
    move-exception v1

    .line 413
    .local v1, "ex":Landroid/javax/sdp/SdpException;
    new-instance v2, Ljava/text/ParseException;

    invoke-virtual {p1}, Landroid/gov/nist/javax/sdp/fields/SDPField;->encode()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 425
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;

    invoke-direct {v0, p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;-><init>(Landroid/javax/sdp/SessionDescription;)V
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 426
    :catch_0
    move-exception v0

    .line 428
    .local v0, "e":Landroid/javax/sdp/SdpException;
    new-instance v1, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v1}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v1
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 897
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 898
    return-object v0

    .line 899
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    if-nez v1, :cond_1

    .line 900
    return-object v0

    .line 901
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 902
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 903
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    if-eqz v3, :cond_2

    .line 904
    move-object v3, v2

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 905
    .local v3, "a":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getName()Ljava/lang/String;

    move-result-object v4

    .line 906
    .local v4, "n":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 907
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 908
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 901
    .end local v2    # "o":Ljava/lang/Object;
    .end local v3    # "a":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v4    # "n":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 913
    .end local v1    # "i":I
    :cond_3
    return-object v0
.end method

.method public getAttributes(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z

    .line 926
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 927
    if-eqz p1, :cond_0

    .line 928
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    .line 930
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    return-object v0
.end method

.method public getBandwidth(Ljava/lang/String;)I
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 784
    const/4 v0, -0x1

    if-nez p1, :cond_0

    .line 785
    return v0

    .line 786
    :cond_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    if-nez v1, :cond_1

    .line 787
    return v0

    .line 788
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 789
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 790
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    if-eqz v3, :cond_2

    .line 791
    move-object v3, v2

    check-cast v3, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 792
    .local v3, "b":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getType()Ljava/lang/String;

    move-result-object v4

    .line 793
    .local v4, "type":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 794
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 795
    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getValue()I

    move-result v0

    return v0

    .line 788
    .end local v2    # "o":Ljava/lang/Object;
    .end local v3    # "b":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .end local v4    # "type":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 800
    .end local v1    # "i":I
    :cond_3
    return v0
.end method

.method public getBandwidths(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z

    .line 753
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 754
    if-eqz p1, :cond_0

    .line 755
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    .line 757
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    return-object v0
.end method

.method public getConnection()Landroid/javax/sdp/Connection;
    .locals 1

    .line 724
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->connectionImpl:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    return-object v0
.end method

.method public getEmails(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpParseException;
        }
    .end annotation

    .line 589
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->emailList:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 590
    if-eqz p1, :cond_0

    .line 591
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->emailList:Ljava/util/Vector;

    .line 593
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->emailList:Ljava/util/Vector;

    return-object v0
.end method

.method public getInfo()Landroid/javax/sdp/Info;
    .locals 1

    .line 527
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->infoImpl:Landroid/gov/nist/javax/sdp/fields/InformationField;

    return-object v0
.end method

.method public getKey()Landroid/javax/sdp/Key;
    .locals 1

    .line 865
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->keyImpl:Landroid/gov/nist/javax/sdp/fields/KeyField;

    return-object v0
.end method

.method public getMediaDescriptions(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 1014
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->mediaDescriptions:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 1015
    if-eqz p1, :cond_0

    .line 1016
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->mediaDescriptions:Ljava/util/Vector;

    .line 1018
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->mediaDescriptions:Ljava/util/Vector;

    return-object v0
.end method

.method public getOrigin()Landroid/javax/sdp/Origin;
    .locals 1

    .line 468
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->originImpl:Landroid/gov/nist/javax/sdp/fields/OriginField;

    return-object v0
.end method

.method public getPhones(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 622
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->phoneList:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 623
    if-eqz p1, :cond_0

    .line 624
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->phoneList:Ljava/util/Vector;

    .line 626
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->phoneList:Ljava/util/Vector;

    return-object v0
.end method

.method public getSessionName()Landroid/javax/sdp/SessionName;
    .locals 1

    .line 498
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->sessionNameImpl:Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    return-object v0
.end method

.method public getTimeDescriptions(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 656
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->timeDescriptions:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 657
    if-eqz p1, :cond_0

    .line 658
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->timeDescriptions:Ljava/util/Vector;

    .line 660
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->timeDescriptions:Ljava/util/Vector;

    return-object v0
.end method

.method public getURI()Landroid/javax/sdp/URI;
    .locals 1

    .line 556
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->uriImpl:Landroid/gov/nist/javax/sdp/fields/URIField;

    return-object v0
.end method

.method public getVersion()Landroid/javax/sdp/Version;
    .locals 1

    .line 439
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->versionImpl:Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    return-object v0
.end method

.method public getZoneAdjustments(Z)Ljava/util/Vector;
    .locals 1
    .param p1, "create"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 691
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->zoneAdjustments:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 692
    if-eqz p1, :cond_0

    .line 693
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->zoneAdjustments:Ljava/util/Vector;

    .line 695
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->zoneAdjustments:Ljava/util/Vector;

    return-object v0
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .line 940
    if-eqz p1, :cond_2

    .line 941
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    if-eqz v0, :cond_2

    .line 942
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 943
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 944
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    if-eqz v2, :cond_1

    .line 945
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 947
    .local v2, "a":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :try_start_0
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getName()Ljava/lang/String;

    move-result-object v3

    .line 948
    .local v3, "n":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 949
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 950
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/javax/sdp/SdpParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 954
    .end local v3    # "n":Ljava/lang/String;
    :cond_0
    goto :goto_1

    .line 953
    :catch_0
    move-exception v3

    .line 942
    .end local v1    # "o":Ljava/lang/Object;
    .end local v2    # "a":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 959
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method public removeBandwidth(Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .line 839
    if-eqz p1, :cond_2

    .line 840
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    if-eqz v0, :cond_2

    .line 841
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 842
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 843
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    if-eqz v2, :cond_1

    .line 844
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 846
    .local v2, "b":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    :try_start_0
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getType()Ljava/lang/String;

    move-result-object v3

    .line 847
    .local v3, "type":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 848
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 849
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/javax/sdp/SdpParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 853
    .end local v3    # "type":Ljava/lang/String;
    :cond_0
    goto :goto_1

    .line 852
    :catch_0
    move-exception v3

    .line 841
    .end local v1    # "o":Ljava/lang/Object;
    .end local v2    # "b":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 857
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 972
    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 974
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    if-eqz v0, :cond_1

    .line 975
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 976
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 977
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    if-eqz v2, :cond_0

    .line 978
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/AttributeField;

    .line 979
    .local v2, "a":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->getName()Ljava/lang/String;

    move-result-object v3

    .line 980
    .local v3, "n":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 981
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 982
    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sdp/fields/AttributeField;->setValue(Ljava/lang/String;)V

    .line 975
    .end local v1    # "o":Ljava/lang/Object;
    .end local v2    # "a":Landroid/gov/nist/javax/sdp/fields/AttributeField;
    .end local v3    # "n":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 988
    .end local v0    # "i":I
    :cond_1
    return-void

    .line 973
    :cond_2
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAttributes(Ljava/util/Vector;)V
    .locals 2
    .param p1, "attributes"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 998
    if-eqz p1, :cond_0

    .line 1001
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->attributesList:Ljava/util/Vector;

    .line 1002
    return-void

    .line 999
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBandwidth(Ljava/lang/String;I)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 814
    if-eqz p1, :cond_2

    .line 816
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    if-eqz v0, :cond_1

    .line 817
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 818
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 819
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    if-eqz v2, :cond_0

    .line 820
    move-object v2, v1

    check-cast v2, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    .line 821
    .local v2, "b":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->getType()Ljava/lang/String;

    move-result-object v3

    .line 822
    .local v3, "type":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 823
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 824
    invoke-virtual {v2, p2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setValue(I)V

    .line 817
    .end local v1    # "o":Ljava/lang/Object;
    .end local v2    # "b":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .end local v3    # "type":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 830
    .end local v0    # "i":I
    :cond_1
    return-void

    .line 815
    :cond_2
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBandwidths(Ljava/util/Vector;)V
    .locals 2
    .param p1, "bandwidthList"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 769
    if-eqz p1, :cond_0

    .line 772
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->bandwidthList:Ljava/util/Vector;

    .line 773
    return-void

    .line 770
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setConnection(Landroid/javax/sdp/Connection;)V
    .locals 2
    .param p1, "conn"    # Landroid/javax/sdp/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 736
    if-eqz p1, :cond_1

    .line 738
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    if-eqz v0, :cond_0

    .line 739
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    .line 740
    .local v0, "c":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->connectionImpl:Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    .line 741
    .end local v0    # "c":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    nop

    .line 743
    return-void

    .line 742
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string v1, "Bad implementation class ConnectionField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 737
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setEmails(Ljava/util/Vector;)V
    .locals 2
    .param p1, "emails"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 606
    if-eqz p1, :cond_0

    .line 609
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->emailList:Ljava/util/Vector;

    .line 610
    return-void

    .line 607
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInfo(Landroid/javax/sdp/Info;)V
    .locals 2
    .param p1, "i"    # Landroid/javax/sdp/Info;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 539
    if-eqz p1, :cond_1

    .line 541
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/InformationField;

    if-eqz v0, :cond_0

    .line 542
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/InformationField;

    .line 543
    .local v0, "info":Landroid/gov/nist/javax/sdp/fields/InformationField;
    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->infoImpl:Landroid/gov/nist/javax/sdp/fields/InformationField;

    .line 544
    .end local v0    # "info":Landroid/gov/nist/javax/sdp/fields/InformationField;
    nop

    .line 547
    return-void

    .line 545
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter must be an instance of InformationField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 540
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setKey(Landroid/javax/sdp/Key;)V
    .locals 2
    .param p1, "key"    # Landroid/javax/sdp/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 878
    if-eqz p1, :cond_1

    .line 880
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/KeyField;

    if-eqz v0, :cond_0

    .line 881
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/KeyField;

    .line 882
    .local v0, "k":Landroid/gov/nist/javax/sdp/fields/KeyField;
    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->keyImpl:Landroid/gov/nist/javax/sdp/fields/KeyField;

    .line 883
    .end local v0    # "k":Landroid/gov/nist/javax/sdp/fields/KeyField;
    nop

    .line 886
    return-void

    .line 884
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter must be an instance of KeyField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 879
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMediaDescriptions(Ljava/util/Vector;)V
    .locals 2
    .param p1, "mediaDescriptions"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 1031
    if-eqz p1, :cond_0

    .line 1034
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->mediaDescriptions:Ljava/util/Vector;

    .line 1035
    return-void

    .line 1032
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOrigin(Landroid/javax/sdp/Origin;)V
    .locals 2
    .param p1, "origin"    # Landroid/javax/sdp/Origin;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 481
    if-eqz p1, :cond_1

    .line 483
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/OriginField;

    if-eqz v0, :cond_0

    .line 484
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/OriginField;

    .line 485
    .local v0, "o":Landroid/gov/nist/javax/sdp/fields/OriginField;
    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->originImpl:Landroid/gov/nist/javax/sdp/fields/OriginField;

    .line 486
    .end local v0    # "o":Landroid/gov/nist/javax/sdp/fields/OriginField;
    nop

    .line 489
    return-void

    .line 487
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter must be an instance of OriginField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 482
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPhones(Ljava/util/Vector;)V
    .locals 2
    .param p1, "phones"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 639
    if-eqz p1, :cond_0

    .line 642
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->phoneList:Ljava/util/Vector;

    .line 643
    return-void

    .line 640
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSessionName(Landroid/javax/sdp/SessionName;)V
    .locals 2
    .param p1, "sessionName"    # Landroid/javax/sdp/SessionName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 511
    if-eqz p1, :cond_1

    .line 513
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    if-eqz v0, :cond_0

    .line 514
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    .line 515
    .local v0, "s":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->sessionNameImpl:Landroid/gov/nist/javax/sdp/fields/SessionNameField;

    .line 516
    .end local v0    # "s":Landroid/gov/nist/javax/sdp/fields/SessionNameField;
    nop

    .line 519
    return-void

    .line 517
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter must be an instance of SessionNameField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 512
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTimeDescriptions(Ljava/util/Vector;)V
    .locals 2
    .param p1, "times"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 674
    if-eqz p1, :cond_0

    .line 677
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->timeDescriptions:Ljava/util/Vector;

    .line 679
    return-void

    .line 675
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setURI(Landroid/javax/sdp/URI;)V
    .locals 2
    .param p1, "uri"    # Landroid/javax/sdp/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 569
    if-eqz p1, :cond_1

    .line 571
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/URIField;

    if-eqz v0, :cond_0

    .line 572
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/URIField;

    .line 573
    .local v0, "u":Landroid/gov/nist/javax/sdp/fields/URIField;
    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->uriImpl:Landroid/gov/nist/javax/sdp/fields/URIField;

    .line 574
    .end local v0    # "u":Landroid/gov/nist/javax/sdp/fields/URIField;
    nop

    .line 577
    return-void

    .line 575
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter must be an instance of URIField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 570
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setVersion(Landroid/javax/sdp/Version;)V
    .locals 2
    .param p1, "v"    # Landroid/javax/sdp/Version;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 452
    if-eqz p1, :cond_1

    .line 454
    instance-of v0, p1, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    if-eqz v0, :cond_0

    .line 455
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->versionImpl:Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    .line 459
    return-void

    .line 457
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter must be an instance of VersionField"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 453
    :cond_1
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setZoneAdjustments(Ljava/util/Vector;)V
    .locals 2
    .param p1, "zoneAdjustments"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sdp/SdpException;
        }
    .end annotation

    .line 709
    if-eqz p1, :cond_0

    .line 712
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->zoneAdjustments:Ljava/util/Vector;

    .line 713
    return-void

    .line 710
    :cond_0
    new-instance v0, Landroid/javax/sdp/SdpException;

    const-string/jumbo v1, "The parameter is null"

    invoke-direct {v0, v1}, Landroid/javax/sdp/SdpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1056
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1059
    .local v0, "encBuff":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getVersion()Landroid/javax/sdp/Version;

    move-result-object v1

    const-string v2, ""

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getVersion()Landroid/javax/sdp/Version;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1060
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getOrigin()Landroid/javax/sdp/Origin;

    move-result-object v1

    if-nez v1, :cond_1

    move-object v1, v2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getOrigin()Landroid/javax/sdp/Origin;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1061
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getSessionName()Landroid/javax/sdp/SessionName;

    move-result-object v1

    if-nez v1, :cond_2

    move-object v1, v2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getSessionName()Landroid/javax/sdp/SessionName;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1063
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getInfo()Landroid/javax/sdp/Info;

    move-result-object v1

    if-nez v1, :cond_3

    move-object v1, v2

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getInfo()Landroid/javax/sdp/Info;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1067
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getURI()Landroid/javax/sdp/URI;

    move-result-object v1

    if-nez v1, :cond_4

    move-object v1, v2

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getURI()Landroid/javax/sdp/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1068
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getEmails(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_5

    move-object v3, v2

    goto :goto_5

    :cond_5
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getEmails(Z)Ljava/util/Vector;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v3

    :goto_5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1070
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getPhones(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_6

    move-object v3, v2

    goto :goto_6

    :cond_6
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getPhones(Z)Ljava/util/Vector;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v3

    :goto_6
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1072
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getConnection()Landroid/javax/sdp/Connection;

    move-result-object v3

    if-nez v3, :cond_7

    move-object v3, v2

    goto :goto_7

    :cond_7
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getConnection()Landroid/javax/sdp/Connection;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_7
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1074
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getBandwidths(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_8

    move-object v3, v2

    goto :goto_8

    :cond_8
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getBandwidths(Z)Ljava/util/Vector;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v3

    :goto_8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1076
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getTimeDescriptions(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_9

    move-object v3, v2

    goto :goto_9

    :cond_9
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getTimeDescriptions(Z)Ljava/util/Vector;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v3

    :goto_9
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1078
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getZoneAdjustments(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_a

    move-object v3, v2

    goto :goto_a

    :cond_a
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getZoneAdjustments(Z)Ljava/util/Vector;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v3

    :goto_a
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1080
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getKey()Landroid/javax/sdp/Key;

    move-result-object v3

    if-nez v3, :cond_b

    move-object v3, v2

    goto :goto_b

    :cond_b
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getKey()Landroid/javax/sdp/Key;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_b
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1081
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getAttributes(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_c

    move-object v3, v2

    goto :goto_c

    :cond_c
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getAttributes(Z)Ljava/util/Vector;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v3

    :goto_c
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1083
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getMediaDescriptions(Z)Ljava/util/Vector;

    move-result-object v3

    if-nez v3, :cond_d

    goto :goto_d

    :cond_d
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->getMediaDescriptions(Z)Ljava/util/Vector;

    move-result-object v1

    invoke-direct {p0, v1}, Landroid/gov/nist/javax/sdp/SessionDescriptionImpl;->encodeVector(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v2

    :goto_d
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Landroid/javax/sdp/SdpException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1088
    goto :goto_e

    .line 1086
    :catch_0
    move-exception v1

    .line 1089
    :goto_e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
