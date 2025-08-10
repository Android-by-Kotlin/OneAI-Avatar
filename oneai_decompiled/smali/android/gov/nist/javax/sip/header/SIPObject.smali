.class public abstract Landroid/gov/nist/javax/sip/header/SIPObject;
.super Landroid/gov/nist/core/GenericObject;
.source "SIPObject.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 56
    return-void
.end method


# virtual methods
.method public dbgPrint()V
    .locals 0

    .line 63
    invoke-super {p0}, Landroid/gov/nist/core/GenericObject;->dbgPrint()V

    .line 64
    return-void
.end method

.method public debugDump()Ljava/lang/String;
    .locals 13

    .line 291
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->stringRepresentation:Ljava/lang/String;

    .line 292
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 293
    .local v0, "myclass":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 294
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 295
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 296
    .local v2, "fields":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    const-string/jumbo v5, "}"

    if-ge v3, v4, :cond_11

    .line 297
    aget-object v4, v2, v3

    .line 299
    .local v4, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 300
    .local v6, "modifier":I
    and-int/lit8 v7, v6, 0x2

    const/4 v8, 0x2

    if-ne v7, v8, :cond_0

    .line 301
    goto/16 :goto_6

    .line 302
    :cond_0
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    .line 303
    .local v7, "fieldType":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    .line 304
    .local v8, "fieldName":Ljava/lang/String;
    const-string/jumbo v9, "stringRepresentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_1

    .line 306
    goto/16 :goto_6

    .line 308
    :cond_1
    const-string/jumbo v9, "indentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_2

    .line 310
    goto/16 :goto_6

    .line 312
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 315
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 316
    invoke-virtual {v7}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    .line 317
    .local v5, "fname":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 318
    const-string/jumbo v9, "int"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_3

    .line 319
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    .line 320
    .local v9, "intfield":I
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(I)V

    .line 321
    .end local v9    # "intfield":I
    goto :goto_2

    :cond_3
    const-string/jumbo v9, "short"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_4

    .line 322
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v9

    .line 323
    .local v9, "shortField":S
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(S)V

    .line 324
    .end local v9    # "shortField":S
    goto :goto_2

    :cond_4
    const-string/jumbo v9, "char"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_5

    .line 325
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v9

    .line 326
    .local v9, "charField":C
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(C)V

    .line 327
    .end local v9    # "charField":C
    goto :goto_2

    :cond_5
    const-string/jumbo v9, "long"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    .line 328
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v9

    .line 329
    .local v9, "longField":J
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(J)V

    .line 330
    .end local v9    # "longField":J
    goto :goto_2

    :cond_6
    const-string/jumbo v9, "boolean"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_7

    .line 331
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    .line 332
    .local v9, "booleanField":Z
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Z)V

    .line 333
    .end local v9    # "booleanField":Z
    goto :goto_2

    :cond_7
    const-string/jumbo v9, "double"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_8

    .line 334
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v9

    .line 335
    .local v9, "doubleField":D
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(D)V

    .end local v9    # "doubleField":D
    goto :goto_1

    .line 336
    :cond_8
    const-string/jumbo v9, "float"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_9

    .line 337
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v9

    .line 338
    .local v9, "floatField":F
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(F)V

    goto :goto_2

    .line 336
    .end local v9    # "floatField":F
    :cond_9
    :goto_1
    nop

    .line 340
    .end local v5    # "fname":Ljava/lang/String;
    :goto_2
    goto/16 :goto_5

    :cond_a
    const-class v9, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v11, "<null>"

    if-eqz v9, :cond_c

    .line 341
    :try_start_1
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 342
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObject;

    iget v9, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObject;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 346
    :cond_b
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 349
    :cond_c
    const-class v9, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 351
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 352
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObjectList;

    iget v9, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 356
    :cond_d
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 362
    :cond_e
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 363
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    goto :goto_3

    .line 365
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 368
    :goto_3
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 369
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 370
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    goto :goto_4

    .line 372
    :cond_10
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 374
    :goto_4
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 378
    :goto_5
    goto :goto_6

    .line 376
    :catch_0
    move-exception v5

    .line 377
    .local v5, "ex1":Ljava/lang/IllegalAccessException;
    nop

    .line 296
    .end local v4    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v6    # "modifier":I
    .end local v7    # "fieldType":Ljava/lang/Class;
    .end local v8    # "fieldName":Ljava/lang/String;
    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 380
    .end local v3    # "i":I
    :cond_11
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/header/SIPObject;->sprint(Ljava/lang/String;)V

    .line 381
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I

    .line 390
    iget v0, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->indentation:I

    .line 391
    .local v0, "save":I
    iput p1, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->indentation:I

    .line 392
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;->debugDump()Ljava/lang/String;

    move-result-object v1

    .line 393
    .local v1, "retval":Ljava/lang/String;
    iput v0, p0, Landroid/gov/nist/javax/sip/header/SIPObject;->indentation:I

    .line 394
    return-object v1
.end method

.method public abstract encode()Ljava/lang/String;
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 18
    .param p1, "other"    # Ljava/lang/Object;

    .line 83
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 84
    return v2

    .line 85
    :cond_0
    move-object/from16 v3, p1

    check-cast v3, Landroid/gov/nist/javax/sip/header/SIPObject;

    .line 86
    .local v3, "that":Landroid/gov/nist/javax/sip/header/SIPObject;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 87
    .local v0, "myclass":Ljava/lang/Class;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    move-object v5, v4

    move-object v4, v0

    .line 89
    .end local v0    # "myclass":Ljava/lang/Class;
    .local v4, "myclass":Ljava/lang/Class;
    .local v5, "hisclass":Ljava/lang/Class;
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 90
    .local v6, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 91
    return v2

    .line 92
    :cond_1
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    .line 93
    .local v7, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v8, v0

    .local v8, "i":I
    :goto_1
    array-length v0, v6

    if-ge v8, v0, :cond_11

    .line 94
    aget-object v9, v6, v8

    .line 95
    .local v9, "f":Ljava/lang/reflect/Field;
    aget-object v10, v7, v8

    .line 97
    .local v10, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v11

    .line 98
    .local v11, "modifier":I
    and-int/lit8 v0, v11, 0x2

    const/4 v12, 0x2

    if-ne v0, v12, :cond_2

    .line 99
    goto/16 :goto_3

    .line 100
    :cond_2
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v12

    .line 101
    .local v12, "fieldType":Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    .line 102
    .local v13, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v13, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 103
    goto/16 :goto_3

    .line 105
    :cond_3
    const-string/jumbo v0, "indentation"

    invoke-virtual {v13, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 106
    goto/16 :goto_3

    .line 110
    :cond_4
    :try_start_0
    invoke-virtual {v12}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 111
    invoke-virtual {v12}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v14, "int"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_5

    .line 113
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    if-eq v14, v15, :cond_b

    .line 114
    return v2

    .line 115
    :cond_5
    const-string/jumbo v14, "short"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_6

    .line 116
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v14, v15, :cond_b

    .line 117
    return v2

    .line 118
    :cond_6
    const-string/jumbo v14, "char"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_7

    .line 119
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v14, v15, :cond_b

    .line 120
    return v2

    .line 121
    :cond_7
    const-string/jumbo v14, "long"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_8

    .line 122
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v16

    cmp-long v14, v14, v16

    if-eqz v14, :cond_b

    .line 123
    return v2

    .line 124
    :cond_8
    const-string/jumbo v14, "boolean"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_9

    .line 125
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v14, v15, :cond_b

    .line 126
    return v2

    .line 127
    :cond_9
    const-string/jumbo v14, "double"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_a

    .line 128
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v16

    cmpl-double v14, v14, v16

    if-eqz v14, :cond_b

    .line 129
    return v2

    .line 130
    :cond_a
    const-string/jumbo v14, "float"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_b

    .line 131
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v14

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v14, v14, v15

    if-eqz v14, :cond_b

    .line 132
    return v2

    .line 134
    .end local v0    # "fname":Ljava/lang/String;
    :cond_b
    goto :goto_2

    :cond_c
    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    if-ne v0, v14, :cond_d

    .line 135
    goto :goto_3

    .line 136
    :cond_d
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 137
    return v2

    .line 138
    :cond_e
    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_f

    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 139
    return v2

    .line 140
    :cond_f
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v10, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v0, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_10

    .line 141
    return v2

    .line 147
    :cond_10
    :goto_2
    goto :goto_3

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "accessed field "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 144
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "modifier  "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 145
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v14, "modifier.private  2"

    invoke-virtual {v2, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 146
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 93
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v9    # "f":Ljava/lang/reflect/Field;
    .end local v10    # "g":Ljava/lang/reflect/Field;
    .end local v11    # "modifier":I
    .end local v12    # "fieldType":Ljava/lang/Class;
    .end local v13    # "fieldName":Ljava/lang/String;
    :goto_3
    add-int/lit8 v8, v8, 0x1

    const/4 v2, 0x0

    goto/16 :goto_1

    .line 149
    .end local v8    # "i":I
    :cond_11
    const-class v0, Landroid/gov/nist/javax/sip/header/SIPObject;

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 150
    nop

    .line 156
    .end local v6    # "fields":[Ljava/lang/reflect/Field;
    .end local v7    # "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x1

    return v0

    .line 152
    .restart local v6    # "fields":[Ljava/lang/reflect/Field;
    .restart local v7    # "hisfields":[Ljava/lang/reflect/Field;
    :cond_12
    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    .line 153
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 155
    .end local v6    # "fields":[Ljava/lang/reflect/Field;
    .end local v7    # "hisfields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 21
    .param p1, "other"    # Ljava/lang/Object;

    .line 172
    move-object/from16 v1, p0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    .line 173
    return v2

    .line 176
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    .line 177
    return v3

    .line 178
    :cond_1
    move-object/from16 v4, p1

    check-cast v4, Landroid/gov/nist/core/GenericObject;

    .line 179
    .local v4, "that":Landroid/gov/nist/core/GenericObject;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 180
    .local v0, "myclass":Ljava/lang/Class;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    move-object v6, v5

    move-object v5, v0

    .line 182
    .end local v0    # "myclass":Ljava/lang/Class;
    .local v5, "myclass":Ljava/lang/Class;
    .local v6, "hisclass":Ljava/lang/Class;
    :goto_0
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    .line 183
    .local v7, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual {v6}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    .line 184
    .local v8, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_1
    array-length v0, v7

    if-ge v9, v0, :cond_18

    .line 185
    aget-object v10, v7, v9

    .line 186
    .local v10, "f":Ljava/lang/reflect/Field;
    aget-object v11, v8, v9

    .line 188
    .local v11, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    .line 189
    .local v12, "modifier":I
    and-int/lit8 v0, v12, 0x2

    const/4 v13, 0x2

    if-ne v0, v13, :cond_2

    .line 190
    goto/16 :goto_4

    .line 191
    :cond_2
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 192
    .local v13, "fieldType":Ljava/lang/Class;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    .line 193
    .local v14, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 194
    goto/16 :goto_4

    .line 196
    :cond_3
    const-string/jumbo v0, "indentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 197
    goto/16 :goto_4

    .line 200
    :cond_4
    :try_start_0
    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 201
    invoke-virtual {v13}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v15, "int"

    invoke-virtual {v0, v15}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v15

    if-nez v15, :cond_5

    .line 203
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    if-eq v15, v2, :cond_c

    .line 204
    return v3

    .line 205
    :cond_5
    const-string/jumbo v2, "short"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_6

    .line 206
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v2, v15, :cond_c

    .line 207
    return v3

    .line 208
    :cond_6
    const-string/jumbo v2, "char"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_7

    .line 209
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v2, v15, :cond_c

    .line 210
    return v3

    .line 211
    :cond_7
    const-string/jumbo v2, "long"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    .line 212
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v17

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v19

    cmp-long v2, v17, v19

    if-eqz v2, :cond_c

    .line 213
    return v3

    .line 214
    :cond_8
    const-string/jumbo v2, "boolean"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_9

    .line 215
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v2, v15, :cond_c

    .line 216
    return v3

    .line 217
    :cond_9
    const-string/jumbo v2, "double"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_a

    .line 218
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v17

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v19

    cmpl-double v2, v17, v19

    if-eqz v2, :cond_c

    .line 219
    return v3

    .line 220
    :cond_a
    const-string/jumbo v2, "float"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_b

    .line 221
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v2, v2, v15

    if-eqz v2, :cond_c

    .line 222
    return v3

    .line 224
    :cond_b
    const-string/jumbo v2, "unknown type"

    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/String;)V

    .line 227
    .end local v0    # "fname":Ljava/lang/String;
    :cond_c
    goto/16 :goto_2

    .line 228
    :cond_d
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 229
    .local v0, "myObj":Ljava/lang/Object;
    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 230
    .local v2, "hisObj":Ljava/lang/Object;
    if-eqz v2, :cond_e

    if-nez v0, :cond_e

    .line 231
    return v3

    .line 232
    :cond_e
    if-nez v2, :cond_f

    if-eqz v0, :cond_f

    .line 233
    goto/16 :goto_4

    .line 234
    :cond_f
    if-nez v2, :cond_10

    if-nez v0, :cond_10

    .line 235
    goto/16 :goto_4

    .line 236
    :cond_10
    instance-of v15, v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v15, :cond_13

    :try_start_1
    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_13

    .line 239
    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    const-string v3, ""

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 240
    const/4 v3, 0x0

    goto/16 :goto_4

    .line 241
    :cond_11
    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_12

    .line 244
    const/4 v3, 0x0

    return v3

    .line 241
    :cond_12
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 269
    .end local v0    # "myObj":Ljava/lang/Object;
    .end local v2    # "hisObj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    const/4 v3, 0x0

    goto/16 :goto_3

    .line 245
    .restart local v0    # "myObj":Ljava/lang/Object;
    .restart local v2    # "hisObj":Ljava/lang/Object;
    :cond_13
    if-eqz v2, :cond_15

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    move-object v3, v2

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->getMatcher()Landroid/gov/nist/core/Match;

    move-result-object v3

    if-eqz v3, :cond_15

    .line 252
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v3

    .line 254
    .local v3, "myObjEncoded":Ljava/lang/String;
    move-object v15, v2

    check-cast v15, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v15}, Landroid/gov/nist/core/GenericObject;->getMatcher()Landroid/gov/nist/core/Match;

    move-result-object v15

    invoke-interface {v15, v3}, Landroid/gov/nist/core/Match;->match(Ljava/lang/String;)Z

    move-result v15

    .line 257
    .local v15, "retval":Z
    if-nez v15, :cond_14

    .line 258
    const/16 v16, 0x0

    return v16

    .line 259
    .end local v3    # "myObjEncoded":Ljava/lang/String;
    .end local v15    # "retval":Z
    :cond_14
    const/4 v3, 0x0

    goto :goto_2

    :cond_15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_16

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObject;->match(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    .line 262
    const/4 v3, 0x0

    return v3

    .line 263
    :cond_16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_17

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObjectList;->match(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v3, :cond_17

    .line 266
    const/4 v3, 0x0

    return v3

    .line 263
    :cond_17
    const/4 v3, 0x0

    .line 271
    .end local v0    # "myObj":Ljava/lang/Object;
    .end local v2    # "hisObj":Ljava/lang/Object;
    :goto_2
    goto :goto_4

    .line 269
    :catch_1
    move-exception v0

    .line 270
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    :goto_3
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 184
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v10    # "f":Ljava/lang/reflect/Field;
    .end local v11    # "g":Ljava/lang/reflect/Field;
    .end local v12    # "modifier":I
    .end local v13    # "fieldType":Ljava/lang/Class;
    .end local v14    # "fieldName":Ljava/lang/String;
    :goto_4
    add-int/lit8 v9, v9, 0x1

    const/4 v2, 0x1

    goto/16 :goto_1

    .line 273
    .end local v9    # "i":I
    :cond_18
    const-class v0, Landroid/gov/nist/javax/sip/header/SIPObject;

    invoke-virtual {v5, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 274
    nop

    .line 280
    .end local v7    # "fields":[Ljava/lang/reflect/Field;
    .end local v8    # "hisfields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    return v2

    .line 276
    .restart local v7    # "fields":[Ljava/lang/reflect/Field;
    .restart local v8    # "hisfields":[Ljava/lang/reflect/Field;
    :cond_19
    const/4 v2, 0x1

    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 277
    invoke-virtual {v6}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 279
    .end local v7    # "fields":[Ljava/lang/reflect/Field;
    .end local v8    # "hisfields":[Ljava/lang/reflect/Field;
    goto/16 :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 399
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/header/SIPObject;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
