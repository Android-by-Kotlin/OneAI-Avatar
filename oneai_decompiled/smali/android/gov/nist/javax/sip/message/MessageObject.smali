.class public abstract Landroid/gov/nist/javax/sip/message/MessageObject;
.super Landroid/gov/nist/core/GenericObject;
.source "MessageObject.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 157
    invoke-direct {p0}, Landroid/gov/nist/core/GenericObject;-><init>()V

    .line 158
    return-void
.end method


# virtual methods
.method public dbgPrint(I)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I

    .line 164
    iget v0, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->indentation:I

    .line 165
    .local v0, "save":I
    iput p1, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->indentation:I

    .line 166
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 167
    .local v1, "retval":Ljava/lang/String;
    iput v0, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->indentation:I

    .line 168
    return-object v1
.end method

.method public dbgPrint()V
    .locals 0

    .line 50
    invoke-super {p0}, Landroid/gov/nist/core/GenericObject;->dbgPrint()V

    .line 51
    return-void
.end method

.method public debugDump()Ljava/lang/String;
    .locals 13

    .line 60
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->stringRepresentation:Ljava/lang/String;

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 62
    .local v0, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 63
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 65
    .local v2, "fields":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    const-string/jumbo v5, "}"

    if-ge v3, v4, :cond_11

    .line 66
    aget-object v4, v2, v3

    .line 68
    .local v4, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 69
    .local v6, "modifier":I
    const/4 v7, 0x2

    if-ne v6, v7, :cond_0

    .line 70
    goto/16 :goto_6

    .line 71
    :cond_0
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    .line 72
    .local v7, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    .line 73
    .local v8, "fieldName":Ljava/lang/String;
    const-string/jumbo v9, "stringRepresentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_1

    .line 75
    goto/16 :goto_6

    .line 77
    :cond_1
    const-string/jumbo v9, "indentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_2

    .line 79
    goto/16 :goto_6

    .line 81
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 84
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 85
    invoke-virtual {v7}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    .line 86
    .local v5, "fname":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 87
    const-string/jumbo v9, "int"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_3

    .line 88
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    .line 89
    .local v9, "intfield":I
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(I)V

    .line 90
    .end local v9    # "intfield":I
    goto :goto_2

    :cond_3
    const-string/jumbo v9, "short"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_4

    .line 91
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v9

    .line 92
    .local v9, "shortField":S
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(S)V

    .line 93
    .end local v9    # "shortField":S
    goto :goto_2

    :cond_4
    const-string/jumbo v9, "char"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_5

    .line 94
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v9

    .line 95
    .local v9, "charField":C
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(C)V

    .line 96
    .end local v9    # "charField":C
    goto :goto_2

    :cond_5
    const-string/jumbo v9, "long"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    .line 97
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v9

    .line 98
    .local v9, "longField":J
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(J)V

    .line 99
    .end local v9    # "longField":J
    goto :goto_2

    :cond_6
    const-string/jumbo v9, "boolean"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_7

    .line 100
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    .line 101
    .local v9, "booleanField":Z
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Z)V

    .line 102
    .end local v9    # "booleanField":Z
    goto :goto_2

    :cond_7
    const-string/jumbo v9, "double"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_8

    .line 103
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v9

    .line 104
    .local v9, "doubleField":D
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(D)V

    .end local v9    # "doubleField":D
    goto :goto_1

    .line 105
    :cond_8
    const-string/jumbo v9, "float"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_9

    .line 106
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v9

    .line 107
    .local v9, "floatField":F
    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(F)V

    goto :goto_2

    .line 105
    .end local v9    # "floatField":F
    :cond_9
    :goto_1
    nop

    .line 109
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

    .line 112
    :try_start_1
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 113
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObject;

    iget v9, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObject;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 117
    :cond_b
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 120
    :cond_c
    const-class v9, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 122
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 123
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObjectList;

    iget v9, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 127
    :cond_d
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 133
    :cond_e
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 134
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    goto :goto_3

    .line 136
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 139
    :goto_3
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 140
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 141
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    goto :goto_4

    .line 143
    :cond_10
    invoke-virtual {p0, v11}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 145
    :goto_4
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 149
    :goto_5
    goto :goto_6

    .line 147
    :catch_0
    move-exception v5

    .line 148
    .local v5, "ex1":Ljava/lang/IllegalAccessException;
    nop

    .line 65
    .end local v4    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v6    # "modifier":I
    .end local v7    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "fieldName":Ljava/lang/String;
    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 151
    .end local v3    # "i":I
    :cond_11
    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/message/MessageObject;->sprint(Ljava/lang/String;)V

    .line 152
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/MessageObject;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public abstract encode()Ljava/lang/String;
.end method
