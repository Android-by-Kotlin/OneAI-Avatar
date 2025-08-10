.class public abstract Landroid/gov/nist/javax/sip/address/NetObject;
.super Landroid/gov/nist/core/GenericObject;
.source "NetObject.java"


# static fields
.field protected static final CORE_PACKAGE:Ljava/lang/String; = "android.gov.nist.core"

.field protected static final GRUU:Ljava/lang/String; = "gr"

.field protected static final LR:Ljava/lang/String; = "lr"

.field protected static final MADDR:Ljava/lang/String; = "maddr"

.field protected static final METHOD:Ljava/lang/String; = "method"

.field protected static final NET_PACKAGE:Ljava/lang/String; = "android.gov.nist.javax.sip.address"

.field protected static final PARSER_PACKAGE:Ljava/lang/String; = "android.gov.nist.javax.sip.parser"

.field protected static final PHONE:Ljava/lang/String; = "phone"

.field protected static final SIP:Ljava/lang/String; = "sip"

.field protected static final SIPS:Ljava/lang/String; = "sips"

.field protected static final TCP:Ljava/lang/String; = "tcp"

.field protected static final TLS:Ljava/lang/String; = "tls"

.field protected static final TRANSPORT:Ljava/lang/String; = "transport"

.field protected static final TTL:Ljava/lang/String; = "ttl"

.field protected static final UDP:Ljava/lang/String; = "udp"

.field protected static final USER:Ljava/lang/String; = "user"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 73
    return-void
.end method


# virtual methods
.method public debugDump()Ljava/lang/String;
    .locals 13

    .line 280
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/address/NetObject;->stringRepresentation:Ljava/lang/String;

    .line 281
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 282
    .local v0, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 283
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 284
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 285
    .local v2, "fields":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    const-string/jumbo v5, "}"

    if-ge v3, v4, :cond_11

    .line 286
    aget-object v4, v2, v3

    .line 288
    .local v4, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 289
    .local v6, "modifier":I
    and-int/lit8 v7, v6, 0x2

    const/4 v8, 0x2

    if-ne v7, v8, :cond_0

    .line 290
    goto/16 :goto_6

    .line 291
    :cond_0
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    .line 292
    .local v7, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    .line 293
    .local v8, "fieldName":Ljava/lang/String;
    const-string/jumbo v9, "stringRepresentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_1

    .line 295
    goto/16 :goto_6

    .line 297
    :cond_1
    const-string/jumbo v9, "indentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_2

    .line 299
    goto/16 :goto_6

    .line 301
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 304
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 305
    invoke-virtual {v7}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    .line 306
    .local v5, "fname":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 307
    const-string/jumbo v9, "int"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_3

    .line 308
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    .line 309
    .local v9, "intfield":I
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(I)V

    .line 310
    .end local v9    # "intfield":I
    goto :goto_2

    :cond_3
    const-string/jumbo v9, "short"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_4

    .line 311
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v9

    .line 312
    .local v9, "shortField":S
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(S)V

    .line 313
    .end local v9    # "shortField":S
    goto :goto_2

    :cond_4
    const-string/jumbo v9, "char"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_5

    .line 314
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v9

    .line 315
    .local v9, "charField":C
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(C)V

    .line 316
    .end local v9    # "charField":C
    goto :goto_2

    :cond_5
    const-string/jumbo v9, "long"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    .line 317
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v9

    .line 318
    .local v9, "longField":J
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(J)V

    .line 319
    .end local v9    # "longField":J
    goto :goto_2

    :cond_6
    const-string/jumbo v9, "boolean"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_7

    .line 320
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    .line 321
    .local v9, "booleanField":Z
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Z)V

    .line 322
    .end local v9    # "booleanField":Z
    goto :goto_2

    :cond_7
    const-string/jumbo v9, "double"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_8

    .line 323
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v9

    .line 324
    .local v9, "doubleField":D
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(D)V

    .end local v9    # "doubleField":D
    goto :goto_1

    .line 325
    :cond_8
    const-string/jumbo v9, "float"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_9

    .line 326
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v9

    .line 327
    .local v9, "floatField":F
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(F)V

    goto :goto_2

    .line 325
    .end local v9    # "floatField":F
    :cond_9
    :goto_1
    nop

    .line 329
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

    .line 330
    :try_start_1
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 331
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObject;

    iget v9, p0, Landroid/gov/nist/javax/sip/address/NetObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObject;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 335
    :cond_b
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 338
    :cond_c
    const-class v9, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 340
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 341
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObjectList;

    iget v9, p0, Landroid/gov/nist/javax/sip/address/NetObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 345
    :cond_d
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 351
    :cond_e
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 352
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    goto :goto_3

    .line 354
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 357
    :goto_3
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 358
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 359
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    goto :goto_4

    .line 361
    :cond_10
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 363
    :goto_4
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 367
    :goto_5
    goto :goto_6

    .line 365
    :catch_0
    move-exception v5

    .line 366
    .local v5, "ex1":Ljava/lang/IllegalAccessException;
    nop

    .line 285
    .end local v4    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v6    # "modifier":I
    .end local v7    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "fieldName":Ljava/lang/String;
    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 369
    .end local v3    # "i":I
    :cond_11
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/address/NetObject;->sprint(Ljava/lang/String;)V

    .line 370
    iget-object v1, p0, Landroid/gov/nist/javax/sip/address/NetObject;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I

    .line 382
    iget v0, p0, Landroid/gov/nist/javax/sip/address/NetObject;->indentation:I

    .line 383
    .local v0, "save":I
    iput p1, p0, Landroid/gov/nist/javax/sip/address/NetObject;->indentation:I

    .line 384
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/address/NetObject;->debugDump()Ljava/lang/String;

    move-result-object v1

    .line 385
    .local v1, "retval":Ljava/lang/String;
    iput v0, p0, Landroid/gov/nist/javax/sip/address/NetObject;->indentation:I

    .line 386
    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 18
    .param p1, "that"    # Ljava/lang/Object;

    .line 80
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

    .line 81
    return v3

    .line 82
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 83
    .local v0, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    move-object v5, v4

    move-object v4, v0

    .line 85
    .end local v0    # "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v4, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v5, "hisclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 86
    .local v6, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    .line 87
    .local v7, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v8, v0

    .local v8, "i":I
    :goto_1
    array-length v0, v6

    if-ge v8, v0, :cond_10

    .line 88
    aget-object v9, v6, v8

    .line 89
    .local v9, "f":Ljava/lang/reflect/Field;
    aget-object v10, v7, v8

    .line 91
    .local v10, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v11

    .line 92
    .local v11, "modifier":I
    and-int/lit8 v0, v11, 0x2

    const/4 v12, 0x2

    if-ne v0, v12, :cond_1

    .line 93
    goto/16 :goto_3

    .line 94
    :cond_1
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v12

    .line 95
    .local v12, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    .line 96
    .local v13, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v13, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    .line 97
    goto/16 :goto_3

    .line 99
    :cond_2
    const-string/jumbo v0, "indentation"

    invoke-virtual {v13, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 100
    goto/16 :goto_3

    .line 104
    :cond_3
    :try_start_0
    invoke-virtual {v12}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 105
    invoke-virtual {v12}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v14, "int"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_4

    .line 107
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    if-eq v14, v15, :cond_a

    .line 108
    return v3

    .line 109
    :cond_4
    const-string/jumbo v14, "short"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_5

    .line 110
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v14, v15, :cond_a

    .line 111
    return v3

    .line 112
    :cond_5
    const-string/jumbo v14, "char"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_6

    .line 113
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v14, v15, :cond_a

    .line 114
    return v3

    .line 115
    :cond_6
    const-string/jumbo v14, "long"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_7

    .line 116
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v16

    cmp-long v14, v14, v16

    if-eqz v14, :cond_a

    .line 117
    return v3

    .line 118
    :cond_7
    const-string/jumbo v14, "boolean"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_8

    .line 119
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v14, v15, :cond_a

    .line 120
    return v3

    .line 121
    :cond_8
    const-string/jumbo v14, "double"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_9

    .line 122
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v16

    cmpl-double v14, v14, v16

    if-eqz v14, :cond_a

    .line 123
    return v3

    .line 124
    :cond_9
    const-string/jumbo v14, "float"

    invoke-virtual {v0, v14}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_a

    .line 125
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v14

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v14, v14, v15

    if-eqz v14, :cond_a

    .line 126
    return v3

    .line 128
    .end local v0    # "fname":Ljava/lang/String;
    :cond_a
    goto :goto_2

    :cond_b
    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    if-ne v0, v14, :cond_c

    .line 129
    goto :goto_3

    .line 130
    :cond_c
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_d

    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 131
    return v3

    .line 132
    :cond_d
    invoke-virtual {v10, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-virtual {v9, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 133
    return v3

    .line 134
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

    .line 135
    return v3

    .line 138
    :cond_f
    :goto_2
    goto :goto_3

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 87
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v9    # "f":Ljava/lang/reflect/Field;
    .end local v10    # "g":Ljava/lang/reflect/Field;
    .end local v11    # "modifier":I
    .end local v12    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v13    # "fieldName":Ljava/lang/String;
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 140
    .end local v8    # "i":I
    :cond_10
    const-class v0, Landroid/gov/nist/javax/sip/address/NetObject;

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 141
    nop

    .line 147
    .end local v6    # "fields":[Ljava/lang/reflect/Field;
    .end local v7    # "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x1

    return v0

    .line 143
    .restart local v6    # "fields":[Ljava/lang/reflect/Field;
    .restart local v7    # "hisfields":[Ljava/lang/reflect/Field;
    :cond_11
    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    .line 144
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 146
    .end local v6    # "fields":[Ljava/lang/reflect/Field;
    .end local v7    # "hisfields":[Ljava/lang/reflect/Field;
    goto/16 :goto_0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 21
    .param p1, "other"    # Ljava/lang/Object;

    .line 164
    move-object/from16 v1, p0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    .line 165
    return v2

    .line 166
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    .line 167
    return v3

    .line 168
    :cond_1
    move-object/from16 v4, p1

    check-cast v4, Landroid/gov/nist/core/GenericObject;

    .line 172
    .local v4, "that":Landroid/gov/nist/core/GenericObject;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 173
    .local v0, "hisclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    move-object v6, v5

    move-object v5, v0

    .line 175
    .end local v0    # "hisclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v5, "hisclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v6, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v6}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    .line 176
    .local v7, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    .line 177
    .local v8, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_1
    array-length v0, v7

    if-ge v9, v0, :cond_17

    .line 178
    aget-object v10, v7, v9

    .line 179
    .local v10, "f":Ljava/lang/reflect/Field;
    aget-object v11, v8, v9

    .line 181
    .local v11, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    .line 182
    .local v12, "modifier":I
    and-int/lit8 v0, v12, 0x2

    const/4 v13, 0x2

    if-ne v0, v13, :cond_2

    .line 183
    goto/16 :goto_4

    .line 184
    :cond_2
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 185
    .local v13, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    .line 186
    .local v14, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 187
    goto/16 :goto_4

    .line 189
    :cond_3
    const-string/jumbo v0, "indentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 190
    goto/16 :goto_4

    .line 194
    :cond_4
    :try_start_0
    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 195
    invoke-virtual {v13}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v15, "int"

    invoke-virtual {v0, v15}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v15

    if-nez v15, :cond_5

    .line 197
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    if-eq v15, v2, :cond_b

    .line 198
    return v3

    .line 199
    :cond_5
    const-string/jumbo v2, "short"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_6

    .line 200
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v2, v15, :cond_b

    .line 201
    return v3

    .line 202
    :cond_6
    const-string/jumbo v2, "char"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_7

    .line 203
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v2, v15, :cond_b

    .line 204
    return v3

    .line 205
    :cond_7
    const-string/jumbo v2, "long"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    .line 206
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v17

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v19

    cmp-long v2, v17, v19

    if-eqz v2, :cond_b

    .line 207
    return v3

    .line 208
    :cond_8
    const-string/jumbo v2, "boolean"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_9

    .line 209
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v2, v15, :cond_b

    .line 210
    return v3

    .line 211
    :cond_9
    const-string/jumbo v2, "double"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_a

    .line 212
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v17

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v19

    cmpl-double v2, v17, v19

    if-eqz v2, :cond_b

    .line 213
    return v3

    .line 214
    :cond_a
    const-string/jumbo v2, "float"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_b

    .line 215
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v2, v2, v15

    if-eqz v2, :cond_b

    .line 216
    return v3

    .line 218
    .end local v0    # "fname":Ljava/lang/String;
    :cond_b
    goto/16 :goto_2

    .line 219
    :cond_c
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 220
    .local v0, "myObj":Ljava/lang/Object;
    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 221
    .local v2, "hisObj":Ljava/lang/Object;
    if-eqz v2, :cond_d

    if-nez v0, :cond_d

    .line 222
    return v3

    .line 223
    :cond_d
    if-nez v2, :cond_e

    if-eqz v0, :cond_e

    .line 224
    goto/16 :goto_4

    .line 225
    :cond_e
    if-nez v2, :cond_f

    if-nez v0, :cond_f

    .line 226
    goto/16 :goto_4

    .line 227
    :cond_f
    instance-of v15, v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v15, :cond_12

    :try_start_1
    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_12

    .line 230
    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 231
    const/4 v3, 0x0

    goto/16 :goto_4

    .line 232
    :cond_10
    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_11

    .line 235
    const/4 v3, 0x0

    return v3

    .line 232
    :cond_11
    const/4 v3, 0x0

    goto :goto_2

    .line 236
    :cond_12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    move-object v3, v2

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->getMatcher()Landroid/gov/nist/core/Match;

    move-result-object v3

    if-eqz v3, :cond_14

    .line 242
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v3

    .line 244
    .local v3, "myObjEncoded":Ljava/lang/String;
    move-object v15, v2

    check-cast v15, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v15}, Landroid/gov/nist/core/GenericObject;->getMatcher()Landroid/gov/nist/core/Match;

    move-result-object v15

    invoke-interface {v15, v3}, Landroid/gov/nist/core/Match;->match(Ljava/lang/String;)Z

    move-result v15

    .line 247
    .local v15, "retval":Z
    if-nez v15, :cond_13

    .line 248
    const/16 v16, 0x0

    return v16

    .line 249
    .end local v3    # "myObjEncoded":Ljava/lang/String;
    .end local v15    # "retval":Z
    :cond_13
    const/4 v3, 0x0

    goto :goto_2

    :cond_14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_15

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObject;->match(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 252
    const/4 v3, 0x0

    return v3

    .line 253
    :cond_15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_16

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObjectList;->match(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v3, :cond_16

    .line 256
    const/4 v3, 0x0

    return v3

    .line 253
    :cond_16
    const/4 v3, 0x0

    .line 260
    .end local v0    # "myObj":Ljava/lang/Object;
    .end local v2    # "hisObj":Ljava/lang/Object;
    :goto_2
    goto :goto_4

    .line 258
    :catch_0
    move-exception v0

    const/4 v3, 0x0

    goto :goto_3

    :catch_1
    move-exception v0

    .line 259
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    :goto_3
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 177
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v10    # "f":Ljava/lang/reflect/Field;
    .end local v11    # "g":Ljava/lang/reflect/Field;
    .end local v12    # "modifier":I
    .end local v13    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v14    # "fieldName":Ljava/lang/String;
    :goto_4
    add-int/lit8 v9, v9, 0x1

    const/4 v2, 0x1

    goto/16 :goto_1

    .line 262
    .end local v9    # "i":I
    :cond_17
    const-class v0, Landroid/gov/nist/javax/sip/address/NetObject;

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 263
    nop

    .line 269
    .end local v7    # "fields":[Ljava/lang/reflect/Field;
    .end local v8    # "hisfields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    return v2

    .line 265
    .restart local v7    # "fields":[Ljava/lang/reflect/Field;
    .restart local v8    # "hisfields":[Ljava/lang/reflect/Field;
    :cond_18
    const/4 v2, 0x1

    invoke-virtual {v6}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 266
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 268
    .end local v7    # "fields":[Ljava/lang/reflect/Field;
    .end local v8    # "hisfields":[Ljava/lang/reflect/Field;
    goto/16 :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 394
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/address/NetObject;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
