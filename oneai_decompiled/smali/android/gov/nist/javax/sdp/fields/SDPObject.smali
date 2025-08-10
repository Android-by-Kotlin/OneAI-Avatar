.class public abstract Landroid/gov/nist/javax/sdp/fields/SDPObject;
.super Landroid/gov/nist/core/GenericObject;
.source "SDPObject.java"

# interfaces
.implements Landroid/gov/nist/javax/sdp/fields/SDPFieldNames;


# static fields
.field protected static final CORE_PACKAGE:Ljava/lang/String; = "android.gov.nist.core"

.field protected static final SDPFIELDS_PACKAGE:Ljava/lang/String; = "android.gov.nist.javax.sdp.fields"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    return-void
.end method


# virtual methods
.method public dbgPrint(I)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I

    .line 345
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->indentation:I

    .line 346
    .local v0, "save":I
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->indentation:I

    .line 347
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 348
    .local v1, "retval":Ljava/lang/String;
    iput v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->indentation:I

    .line 349
    return-object v1
.end method

.method public debugDump()Ljava/lang/String;
    .locals 13

    .line 139
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->stringRepresentation:Ljava/lang/String;

    .line 140
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 141
    .local v0, "myclass":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 142
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 143
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 144
    .local v2, "fields":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    const-string/jumbo v5, "}"

    if-ge v3, v4, :cond_11

    .line 145
    aget-object v4, v2, v3

    .line 147
    .local v4, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 148
    .local v6, "modifier":I
    const/4 v7, 0x2

    if-ne v6, v7, :cond_0

    .line 149
    goto/16 :goto_6

    .line 150
    :cond_0
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    .line 151
    .local v7, "fieldType":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    .line 152
    .local v8, "fieldName":Ljava/lang/String;
    const-string/jumbo v9, "stringRepresentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_1

    .line 154
    goto/16 :goto_6

    .line 156
    :cond_1
    const-string/jumbo v9, "indentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_2

    .line 158
    goto/16 :goto_6

    .line 160
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 163
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 164
    invoke-virtual {v7}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    .line 165
    .local v5, "fname":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 166
    const-string/jumbo v9, "int"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_3

    .line 167
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    .line 168
    .local v9, "intfield":I
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(I)V

    .line 169
    .end local v9    # "intfield":I
    goto :goto_2

    :cond_3
    const-string/jumbo v9, "short"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_4

    .line 170
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v9

    .line 171
    .local v9, "shortField":S
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(S)V

    .line 172
    .end local v9    # "shortField":S
    goto :goto_2

    :cond_4
    const-string/jumbo v9, "char"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_5

    .line 173
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v9

    .line 174
    .local v9, "charField":C
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(C)V

    .line 175
    .end local v9    # "charField":C
    goto :goto_2

    :cond_5
    const-string/jumbo v9, "long"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    .line 176
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v9

    .line 177
    .local v9, "longField":J
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(J)V

    .line 178
    .end local v9    # "longField":J
    goto :goto_2

    :cond_6
    const-string/jumbo v9, "boolean"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_7

    .line 179
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    .line 180
    .local v9, "booleanField":Z
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Z)V

    .line 181
    .end local v9    # "booleanField":Z
    goto :goto_2

    :cond_7
    const-string/jumbo v9, "double"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_8

    .line 182
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v9

    .line 183
    .local v9, "doubleField":D
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(D)V

    .end local v9    # "doubleField":D
    goto :goto_1

    .line 184
    :cond_8
    const-string/jumbo v9, "float"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_9

    .line 185
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v9

    .line 186
    .local v9, "floatField":F
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(F)V

    goto :goto_2

    .line 184
    .end local v9    # "floatField":F
    :cond_9
    :goto_1
    nop

    .line 188
    .end local v5    # "fname":Ljava/lang/String;
    :goto_2
    goto/16 :goto_5

    :cond_a
    const-string/jumbo v9, "android.gov.nist.core.GenericObject"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v11, "<null>"

    if-eqz v9, :cond_c

    .line 192
    :try_start_1
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 193
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObject;

    iget v9, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObject;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 197
    :cond_b
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 200
    :cond_c
    const-string/jumbo v9, "android.gov.nist.core.GenericObjectList"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 204
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 205
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObjectList;

    iget v9, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 209
    :cond_d
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 215
    :cond_e
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 216
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    goto :goto_3

    .line 218
    :cond_f
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 221
    :goto_3
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 222
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 223
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    goto :goto_4

    .line 225
    :cond_10
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 227
    :goto_4
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 235
    :goto_5
    goto :goto_6

    .line 231
    :catch_0
    move-exception v5

    .line 232
    .local v5, "ex":Ljava/lang/ClassNotFoundException;
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Cound not find "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v5}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 233
    invoke-virtual {v5}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    .line 234
    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/System;->exit(I)V

    goto :goto_6

    .line 229
    .end local v5    # "ex":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v5

    .line 230
    .local v5, "ex1":Ljava/lang/IllegalAccessException;
    nop

    .line 144
    .end local v4    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v6    # "modifier":I
    .end local v7    # "fieldType":Ljava/lang/Class;
    .end local v8    # "fieldName":Ljava/lang/String;
    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 237
    .end local v3    # "i":I
    :cond_11
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->sprint(Ljava/lang/String;)V

    .line 238
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/fields/SDPObject;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public abstract encode()Ljava/lang/String;
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 18
    .param p1, "that"    # Ljava/lang/Object;

    .line 70
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    .line 71
    return v3

    .line 72
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 73
    .local v4, "myclass":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v5

    .line 74
    .local v5, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 75
    .local v6, "hisclass":Ljava/lang/Class;
    invoke-virtual {v6}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    .line 76
    .local v7, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v8, v0

    .local v8, "i":I
    :goto_0
    array-length v0, v5

    if-ge v8, v0, :cond_10

    .line 77
    aget-object v9, v5, v8

    .line 78
    .local v9, "f":Ljava/lang/reflect/Field;
    aget-object v10, v7, v8

    .line 80
    .local v10, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v11

    .line 81
    .local v11, "modifier":I
    const/4 v0, 0x2

    if-ne v11, v0, :cond_1

    .line 82
    goto/16 :goto_2

    .line 83
    :cond_1
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v12

    .line 84
    .local v12, "fieldType":Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    .line 85
    .local v13, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v13, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    .line 86
    goto/16 :goto_2

    .line 88
    :cond_2
    const-string/jumbo v0, "indentation"

    invoke-virtual {v13, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 89
    goto/16 :goto_2

    .line 93
    :cond_3
    :try_start_0
    invoke-virtual {v12}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 94
    invoke-virtual {v12}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v14, "int"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_4

    .line 96
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    if-eq v14, v15, :cond_a

    .line 97
    return v3

    .line 98
    :cond_4
    const-string/jumbo v14, "short"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_5

    .line 99
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v14, v15, :cond_a

    .line 100
    return v3

    .line 101
    :cond_5
    const-string/jumbo v14, "char"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_6

    .line 102
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v14, v15, :cond_a

    .line 103
    return v3

    .line 104
    :cond_6
    const-string/jumbo v14, "long"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_7

    .line 105
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v16

    cmp-long v14, v14, v16

    if-eqz v14, :cond_a

    .line 106
    return v3

    .line 107
    :cond_7
    const-string/jumbo v14, "boolean"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_8

    .line 108
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v14, v15, :cond_a

    .line 109
    return v3

    .line 110
    :cond_8
    const-string/jumbo v14, "double"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_9

    .line 111
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v16

    cmpl-double v14, v14, v16

    if-eqz v14, :cond_a

    .line 112
    return v3

    .line 113
    :cond_9
    const-string/jumbo v14, "float"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_a

    .line 114
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v14, v14, v15

    if-eqz v14, :cond_a

    .line 115
    return v3

    .line 117
    .end local v0    # "fname":Ljava/lang/String;
    :cond_a
    goto :goto_1

    :cond_b
    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    if-ne v0, v14, :cond_c

    .line 118
    goto :goto_2

    .line 119
    :cond_c
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 120
    return v3

    .line 121
    :cond_d
    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-virtual {v9, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 122
    return v3

    .line 123
    :cond_e
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v0, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_f

    .line 124
    return v3

    .line 127
    :cond_f
    :goto_1
    goto :goto_2

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 76
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v9    # "f":Ljava/lang/reflect/Field;
    .end local v10    # "g":Ljava/lang/reflect/Field;
    .end local v11    # "modifier":I
    .end local v12    # "fieldType":Ljava/lang/Class;
    .end local v13    # "fieldName":Ljava/lang/String;
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 129
    .end local v8    # "i":I
    :cond_10
    const/4 v0, 0x1

    return v0
.end method

.method protected getStringRepresentation()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    return-object v0
.end method

.method protected initSprint()V
    .locals 1

    .line 53
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 20
    .param p1, "other"    # Ljava/lang/Object;

    .line 251
    move-object/from16 v1, p0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    .line 252
    return v2

    .line 253
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    .line 254
    return v3

    .line 255
    :cond_1
    move-object/from16 v4, p1

    check-cast v4, Landroid/gov/nist/core/GenericObject;

    .line 256
    .local v4, "that":Landroid/gov/nist/core/GenericObject;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 257
    .local v5, "myclass":Ljava/lang/Class;
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 258
    .local v6, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 259
    .local v7, "hisclass":Ljava/lang/Class;
    invoke-virtual {v7}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    .line 260
    .local v8, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_0
    array-length v0, v6

    if-ge v9, v0, :cond_14

    .line 261
    aget-object v10, v6, v9

    .line 262
    .local v10, "f":Ljava/lang/reflect/Field;
    aget-object v11, v8, v9

    .line 264
    .local v11, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    .line 265
    .local v12, "modifier":I
    const/4 v0, 0x2

    if-ne v12, v0, :cond_2

    .line 266
    goto/16 :goto_3

    .line 267
    :cond_2
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 268
    .local v13, "fieldType":Ljava/lang/Class;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    .line 269
    .local v14, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 270
    goto/16 :goto_3

    .line 272
    :cond_3
    const-string/jumbo v0, "indentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 273
    goto/16 :goto_3

    .line 277
    :cond_4
    :try_start_0
    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 278
    invoke-virtual {v13}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 279
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v15, "int"

    invoke-virtual {v0, v15}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v15

    if-nez v15, :cond_5

    .line 280
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    if-eq v15, v2, :cond_b

    .line 281
    return v3

    .line 282
    :cond_5
    const-string/jumbo v2, "short"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_6

    .line 283
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v2, v15, :cond_b

    .line 284
    return v3

    .line 285
    :cond_6
    const-string/jumbo v2, "char"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_7

    .line 286
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v2, v15, :cond_b

    .line 287
    return v3

    .line 288
    :cond_7
    const-string/jumbo v2, "long"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    .line 289
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v16

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v18

    cmp-long v2, v16, v18

    if-eqz v2, :cond_b

    .line 290
    return v3

    .line 291
    :cond_8
    const-string/jumbo v2, "boolean"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_9

    .line 292
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v2, v15, :cond_b

    .line 293
    return v3

    .line 294
    :cond_9
    const-string/jumbo v2, "double"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_a

    .line 295
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v16

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v18

    cmpl-double v2, v16, v18

    if-eqz v2, :cond_b

    .line 296
    return v3

    .line 297
    :cond_a
    const-string/jumbo v2, "float"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_b

    .line 298
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v2, v2, v15

    if-eqz v2, :cond_b

    .line 299
    return v3

    .line 301
    .end local v0    # "fname":Ljava/lang/String;
    :cond_b
    goto/16 :goto_1

    .line 302
    :cond_c
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 303
    .local v0, "myObj":Ljava/lang/Object;
    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 304
    .local v2, "hisObj":Ljava/lang/Object;
    if-ne v2, v0, :cond_d

    .line 305
    const/4 v3, 0x1

    return v3

    .line 306
    :cond_d
    if-eqz v2, :cond_e

    if-nez v0, :cond_e

    .line 307
    return v3

    .line 308
    :cond_e
    instance-of v15, v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v15, :cond_10

    :try_start_1
    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_10

    .line 311
    move-object v15, v0

    check-cast v15, Ljava/lang/String;

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_f

    .line 314
    const/4 v3, 0x0

    return v3

    .line 311
    :cond_f
    const/4 v3, 0x0

    goto :goto_1

    .line 333
    .end local v0    # "myObj":Ljava/lang/Object;
    .end local v2    # "hisObj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    const/4 v3, 0x0

    goto :goto_2

    .line 315
    .restart local v0    # "myObj":Ljava/lang/Object;
    .restart local v2    # "hisObj":Ljava/lang/Object;
    :cond_10
    if-eqz v2, :cond_11

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    move-object v3, v2

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->getMatcher()Landroid/gov/nist/core/Match;

    move-result-object v3

    if-eqz v3, :cond_11

    .line 321
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v3

    .line 322
    .local v3, "myObjEncoded":Ljava/lang/String;
    move-object v15, v2

    check-cast v15, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v15}, Landroid/gov/nist/core/GenericObject;->getMatcher()Landroid/gov/nist/core/Match;

    move-result-object v15

    invoke-interface {v15, v3}, Landroid/gov/nist/core/Match;->match(Ljava/lang/String;)Z

    move-result v15

    return v15

    .line 324
    .end local v3    # "myObjEncoded":Ljava/lang/String;
    :cond_11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_12

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObject;->match(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 327
    const/4 v3, 0x0

    return v3

    .line 328
    :cond_12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_13

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObjectList;->match(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v3, :cond_13

    .line 331
    const/4 v3, 0x0

    return v3

    .line 328
    :cond_13
    const/4 v3, 0x0

    .line 335
    .end local v0    # "myObj":Ljava/lang/Object;
    .end local v2    # "hisObj":Ljava/lang/Object;
    :goto_1
    goto :goto_3

    .line 333
    :catch_1
    move-exception v0

    .line 334
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    :goto_2
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 260
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v10    # "f":Ljava/lang/reflect/Field;
    .end local v11    # "g":Ljava/lang/reflect/Field;
    .end local v12    # "modifier":I
    .end local v13    # "fieldType":Ljava/lang/Class;
    .end local v14    # "fieldName":Ljava/lang/String;
    :goto_3
    add-int/lit8 v9, v9, 0x1

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 337
    .end local v9    # "i":I
    :cond_14
    const/4 v2, 0x1

    return v2
.end method

.method protected sprint(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .line 49
    invoke-super {p0, p1}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 57
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
