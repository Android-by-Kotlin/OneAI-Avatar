.class public abstract Landroid/gov/nist/core/GenericObject;
.super Ljava/lang/Object;
.source "GenericObject.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# static fields
.field protected static final AND:Ljava/lang/String; = "&"

.field protected static final AT:Ljava/lang/String; = "@"

.field protected static final COLON:Ljava/lang/String; = ":"

.field protected static final COMMA:Ljava/lang/String; = ","

.field protected static final DOT:Ljava/lang/String; = "."

.field protected static final DOUBLE_QUOTE:Ljava/lang/String; = "\""

.field protected static final EQUALS:Ljava/lang/String; = "="

.field protected static final GREATER_THAN:Ljava/lang/String; = ">"

.field protected static final HT:Ljava/lang/String; = "\t"

.field protected static final LESS_THAN:Ljava/lang/String; = "<"

.field protected static final LPAREN:Ljava/lang/String; = "("

.field protected static final NEWLINE:Ljava/lang/String; = "\r\n"

.field protected static final PERCENT:Ljava/lang/String; = "%"

.field protected static final POUND:Ljava/lang/String; = "#"

.field protected static final QUESTION:Ljava/lang/String; = "?"

.field protected static final QUOTE:Ljava/lang/String; = "\'"

.field protected static final RETURN:Ljava/lang/String; = "\n"

.field protected static final RPAREN:Ljava/lang/String; = ")"

.field protected static final SEMICOLON:Ljava/lang/String; = ";"

.field protected static final SLASH:Ljava/lang/String; = "/"

.field protected static final SP:Ljava/lang/String; = " "

.field protected static final STAR:Ljava/lang/String; = "*"

.field static final immutableClassNames:[Ljava/lang/String;

.field protected static final immutableClasses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field protected indentation:I

.field protected matchExpression:Landroid/gov/nist/core/Match;

.field protected stringRepresentation:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 73
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    sput-object v0, Landroid/gov/nist/core/GenericObject;->immutableClasses:Ljava/util/Set;

    .line 74
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "String"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Character"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Boolean"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Byte"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "Short"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Integer"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "Long"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Float"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "Double"

    aput-object v2, v0, v1

    sput-object v0, Landroid/gov/nist/core/GenericObject;->immutableClassNames:[Ljava/lang/String;

    .line 86
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    sget-object v1, Landroid/gov/nist/core/GenericObject;->immutableClassNames:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 87
    sget-object v1, Landroid/gov/nist/core/GenericObject;->immutableClasses:Ljava/util/Set;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "java.lang."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/gov/nist/core/GenericObject;->immutableClassNames:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 90
    .end local v0    # "i":I
    :cond_0
    nop

    .line 91
    return-void

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Internal error"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected constructor <init>()V
    .locals 1

    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 293
    const/4 v0, 0x0

    iput v0, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    .line 294
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 295
    return-void
.end method

.method public static getClassFromName(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 127
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 130
    const/4 v1, 0x0

    return-object v1
.end method

.method public static isMySubclass(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 136
    .local p0, "other":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public static makeClone(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "obj"    # Ljava/lang/Object;

    .line 148
    if-eqz p0, :cond_e

    .line 150
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 151
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v1, p0

    .line 152
    .local v1, "clone_obj":Ljava/lang/Object;
    sget-object v2, Landroid/gov/nist/core/GenericObject;->immutableClasses:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 153
    return-object p0

    .line 154
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 155
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 156
    .local v2, "ec":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-nez v3, :cond_1

    .line 157
    move-object v3, p0

    check-cast v3, [Ljava/lang/Object;

    check-cast v3, [Ljava/lang/Object;

    invoke-virtual {v3}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_1

    .line 159
    :cond_1
    sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_2

    .line 160
    move-object v3, p0

    check-cast v3, [C

    check-cast v3, [C

    invoke-virtual {v3}, [C->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 161
    :cond_2
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_3

    .line 162
    move-object v3, p0

    check-cast v3, [Z

    check-cast v3, [Z

    invoke-virtual {v3}, [Z->clone()Ljava/lang/Object;

    move-result-object v1

    .line 163
    :cond_3
    :goto_0
    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_4

    .line 164
    move-object v3, p0

    check-cast v3, [B

    check-cast v3, [B

    invoke-virtual {v3}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 165
    :cond_4
    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_5

    .line 166
    move-object v3, p0

    check-cast v3, [S

    check-cast v3, [S

    invoke-virtual {v3}, [S->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 167
    :cond_5
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_6

    .line 168
    move-object v3, p0

    check-cast v3, [I

    check-cast v3, [I

    invoke-virtual {v3}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 169
    :cond_6
    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_7

    .line 170
    move-object v3, p0

    check-cast v3, [J

    check-cast v3, [J

    invoke-virtual {v3}, [J->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 171
    :cond_7
    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_8

    .line 172
    move-object v3, p0

    check-cast v3, [F

    check-cast v3, [F

    invoke-virtual {v3}, [F->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 173
    :cond_8
    sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_9

    .line 174
    move-object v3, p0

    check-cast v3, [D

    check-cast v3, [D

    invoke-virtual {v3}, [D->clone()Ljava/lang/Object;

    move-result-object v1

    .line 176
    .end local v2    # "ec":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_9
    :goto_1
    goto :goto_3

    :cond_a
    const-class v2, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 177
    move-object v2, p0

    check-cast v2, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v2}, Landroid/gov/nist/core/GenericObject;->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_3

    .line 178
    :cond_b
    const-class v2, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 179
    move-object v2, p0

    check-cast v2, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v2}, Landroid/gov/nist/core/GenericObjectList;->clone()Ljava/lang/Object;

    move-result-object v1

    goto :goto_3

    .line 180
    :cond_c
    const-class v2, Ljava/lang/Cloneable;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 184
    :try_start_0
    const-string/jumbo v2, "clone"

    const/4 v3, 0x0

    move-object v4, v3

    check-cast v4, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 185
    .local v2, "meth":Ljava/lang/reflect/Method;
    move-object v4, v3

    check-cast v4, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v3

    .line 192
    .end local v2    # "meth":Ljava/lang/reflect/Method;
    :goto_2
    goto :goto_3

    .line 191
    :catch_0
    move-exception v2

    goto :goto_3

    .line 190
    :catch_1
    move-exception v2

    goto :goto_2

    .line 189
    :catch_2
    move-exception v2

    goto :goto_2

    .line 187
    :catch_3
    move-exception v2

    .line 188
    .local v2, "ex":Ljava/lang/IllegalArgumentException;
    invoke-static {v2}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .end local v2    # "ex":Ljava/lang/IllegalArgumentException;
    goto :goto_2

    .line 186
    :catch_4
    move-exception v2

    goto :goto_2

    .line 194
    :cond_d
    :goto_3
    return-object v1

    .line 149
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "clone_obj":Ljava/lang/Object;
    :cond_e
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "null obj!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 3

    .line 201
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Internal error"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected dbgPrint()V
    .locals 1

    .line 394
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObject;->debugDump()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/core/Debug;->println(Ljava/lang/String;)V

    .line 395
    return-void
.end method

.method protected dbgPrint(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .line 401
    invoke-static {p1}, Landroid/gov/nist/core/Debug;->println(Ljava/lang/String;)V

    .line 402
    return-void
.end method

.method public debugDump()Ljava/lang/String;
    .locals 13

    .line 594
    const-string v0, ""

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 595
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 596
    .local v0, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 597
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 598
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 599
    .local v2, "fields":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    const-string/jumbo v5, "}"

    if-ge v3, v4, :cond_11

    .line 600
    aget-object v4, v2, v3

    .line 602
    .local v4, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 603
    .local v6, "modifier":I
    and-int/lit8 v7, v6, 0x2

    const/4 v8, 0x2

    if-ne v7, v8, :cond_0

    .line 604
    goto/16 :goto_6

    .line 605
    :cond_0
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    .line 606
    .local v7, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    .line 607
    .local v8, "fieldName":Ljava/lang/String;
    const-string/jumbo v9, "stringRepresentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_1

    .line 609
    goto/16 :goto_6

    .line 611
    :cond_1
    const-string/jumbo v9, "indentation"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_2

    .line 613
    goto/16 :goto_6

    .line 615
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 618
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 619
    invoke-virtual {v7}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    .line 620
    .local v5, "fname":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 621
    const-string/jumbo v9, "int"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_3

    .line 622
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    .line 623
    .local v9, "intfield":I
    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(I)V

    .line 624
    .end local v9    # "intfield":I
    goto :goto_2

    :cond_3
    const-string/jumbo v9, "short"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_4

    .line 625
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v9

    .line 626
    .local v9, "shortField":S
    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(S)V

    .line 627
    .end local v9    # "shortField":S
    goto :goto_2

    :cond_4
    const-string/jumbo v9, "char"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_5

    .line 628
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v9

    .line 629
    .local v9, "charField":C
    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(C)V

    .line 630
    .end local v9    # "charField":C
    goto :goto_2

    :cond_5
    const-string/jumbo v9, "long"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    .line 631
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v9

    .line 632
    .local v9, "longField":J
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/core/GenericObject;->sprint(J)V

    .line 633
    .end local v9    # "longField":J
    goto :goto_2

    :cond_6
    const-string/jumbo v9, "boolean"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_7

    .line 634
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    .line 635
    .local v9, "booleanField":Z
    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(Z)V

    .line 636
    .end local v9    # "booleanField":Z
    goto :goto_2

    :cond_7
    const-string/jumbo v9, "double"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_8

    .line 637
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v9

    .line 638
    .local v9, "doubleField":D
    invoke-virtual {p0, v9, v10}, Landroid/gov/nist/core/GenericObject;->sprint(D)V

    .end local v9    # "doubleField":D
    goto :goto_1

    .line 639
    :cond_8
    const-string/jumbo v9, "float"

    invoke-virtual {v5, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_9

    .line 640
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v9

    .line 641
    .local v9, "floatField":F
    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(F)V

    goto :goto_2

    .line 639
    .end local v9    # "floatField":F
    :cond_9
    :goto_1
    nop

    .line 643
    .end local v5    # "fname":Ljava/lang/String;
    :goto_2
    goto/16 :goto_5

    :cond_a
    const-class v9, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v11, "<null>"

    if-eqz v9, :cond_c

    .line 644
    :try_start_1
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 645
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObject;

    iget v9, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObject;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 649
    :cond_b
    invoke-virtual {p0, v11}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 652
    :cond_c
    const-class v9, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v9, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 654
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 655
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/gov/nist/core/GenericObjectList;

    iget v9, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v5, v9}, Landroid/gov/nist/core/GenericObjectList;->debugDump(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 659
    :cond_d
    invoke-virtual {p0, v11}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    goto :goto_5

    .line 665
    :cond_e
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 666
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    goto :goto_3

    .line 668
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

    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 671
    :goto_3
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 672
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 673
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    goto :goto_4

    .line 675
    :cond_10
    invoke-virtual {p0, v11}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 677
    :goto_4
    invoke-virtual {p0, v5}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 683
    :goto_5
    goto :goto_6

    .line 681
    :catch_0
    move-exception v5

    .line 682
    .local v5, "ex":Ljava/lang/Exception;
    invoke-static {v5}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    goto :goto_6

    .line 679
    .end local v5    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v5

    .line 680
    .local v5, "ex1":Ljava/lang/IllegalAccessException;
    nop

    .line 599
    .end local v4    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v6    # "modifier":I
    .end local v7    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "fieldName":Ljava/lang/String;
    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 685
    .end local v3    # "i":I
    :cond_11
    invoke-virtual {p0, v5}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 686
    iget-object v1, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public debugDump(I)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I

    .line 693
    iput p1, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    .line 694
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObject;->debugDump()Ljava/lang/String;

    move-result-object v0

    .line 695
    .local v0, "retval":Ljava/lang/String;
    const/4 v1, 0x0

    iput v1, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    .line 696
    return-object v0
.end method

.method public abstract encode()Ljava/lang/String;
.end method

.method public encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .line 710
    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObject;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 19
    .param p1, "that"    # Ljava/lang/Object;

    .line 410
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const/4 v3, 0x0

    if-nez v2, :cond_0

    return v3

    .line 411
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 412
    return v3

    .line 413
    :cond_1
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 414
    .local v0, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    move-object v5, v4

    move-object v4, v0

    .line 416
    .end local v0    # "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v4, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v5, "hisclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 417
    .local v6, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    .line 418
    .local v7, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v8, v0

    .local v8, "i":I
    :goto_1
    array-length v0, v6

    const/4 v9, 0x1

    if-ge v8, v0, :cond_12

    .line 419
    aget-object v10, v6, v8

    .line 420
    .local v10, "f":Ljava/lang/reflect/Field;
    aget-object v11, v7, v8

    .line 422
    .local v11, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    .line 423
    .local v12, "modifier":I
    and-int/lit8 v0, v12, 0x2

    const/4 v13, 0x2

    if-ne v0, v13, :cond_2

    .line 424
    goto/16 :goto_3

    .line 425
    :cond_2
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 426
    .local v13, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    .line 427
    .local v14, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 428
    goto/16 :goto_3

    .line 430
    :cond_3
    const-string/jumbo v0, "indentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 431
    goto/16 :goto_3

    .line 435
    :cond_4
    :try_start_0
    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 436
    invoke-virtual {v13}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 437
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v9, "int"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_5

    .line 438
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    if-eq v9, v15, :cond_b

    .line 439
    return v3

    .line 440
    :cond_5
    const-string/jumbo v9, "short"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    .line 441
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v9

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v9, v15, :cond_b

    .line 442
    return v3

    .line 443
    :cond_6
    const-string/jumbo v9, "char"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_7

    .line 444
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v9

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v9, v15, :cond_b

    .line 445
    return v3

    .line 446
    :cond_7
    const-string/jumbo v9, "long"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_8

    .line 447
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v15

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v17

    cmp-long v9, v15, v17

    if-eqz v9, :cond_b

    .line 448
    return v3

    .line 449
    :cond_8
    const-string/jumbo v9, "boolean"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_9

    .line 450
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v9, v15, :cond_b

    .line 451
    return v3

    .line 452
    :cond_9
    const-string/jumbo v9, "double"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_a

    .line 453
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v15

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v17

    cmpl-double v9, v15, v17

    if-eqz v9, :cond_b

    .line 454
    return v3

    .line 455
    :cond_a
    const-string/jumbo v9, "float"

    invoke-virtual {v0, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_b

    .line 456
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v9

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v9, v9, v15

    if-eqz v9, :cond_b

    .line 457
    return v3

    .line 459
    .end local v0    # "fname":Ljava/lang/String;
    :cond_b
    goto :goto_2

    :cond_c
    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    if-ne v0, v15, :cond_d

    .line 460
    return v9

    .line 461
    :cond_d
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_e

    .line 462
    return v3

    .line 463
    :cond_e
    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_f

    .line 464
    return v3

    .line 465
    :cond_f
    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_10

    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 466
    return v3

    .line 467
    :cond_10
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v11, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_11

    .line 468
    return v3

    .line 471
    :cond_11
    :goto_2
    goto :goto_3

    .line 469
    :catch_0
    move-exception v0

    .line 470
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 418
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v10    # "f":Ljava/lang/reflect/Field;
    .end local v11    # "g":Ljava/lang/reflect/Field;
    .end local v12    # "modifier":I
    .end local v13    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v14    # "fieldName":Ljava/lang/String;
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 473
    .end local v8    # "i":I
    :cond_12
    const-class v0, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 474
    nop

    .line 481
    .end local v6    # "fields":[Ljava/lang/reflect/Field;
    .end local v7    # "hisfields":[Ljava/lang/reflect/Field;
    return v9

    .line 476
    .restart local v6    # "fields":[Ljava/lang/reflect/Field;
    .restart local v7    # "hisfields":[Ljava/lang/reflect/Field;
    :cond_13
    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    .line 477
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 480
    .end local v6    # "fields":[Ljava/lang/reflect/Field;
    .end local v7    # "hisfields":[Ljava/lang/reflect/Field;
    goto/16 :goto_0
.end method

.method protected getIndentation()Ljava/lang/String;
    .locals 2

    .line 298
    iget v0, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    new-array v0, v0, [C

    .line 299
    .local v0, "chars":[C
    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 300
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method public getMatcher()Landroid/gov/nist/core/Match;
    .locals 1

    .line 122
    iget-object v0, p0, Landroid/gov/nist/core/GenericObject;->matchExpression:Landroid/gov/nist/core/Match;

    return-object v0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 20
    .param p1, "other"    # Ljava/lang/Object;

    .line 494
    move-object/from16 v1, p0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    .line 495
    return v2

    .line 496
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    .line 497
    return v3

    .line 498
    :cond_1
    move-object/from16 v4, p1

    check-cast v4, Landroid/gov/nist/core/GenericObject;

    .line 499
    .local v4, "that":Landroid/gov/nist/core/GenericObject;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 500
    .local v5, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 501
    .local v6, "fields":[Ljava/lang/reflect/Field;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 502
    .local v7, "hisclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v7}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    .line 503
    .local v8, "hisfields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_0
    array-length v0, v6

    if-ge v9, v0, :cond_15

    .line 504
    aget-object v10, v6, v9

    .line 505
    .local v10, "f":Ljava/lang/reflect/Field;
    aget-object v11, v8, v9

    .line 507
    .local v11, "g":Ljava/lang/reflect/Field;
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    .line 508
    .local v12, "modifier":I
    and-int/lit8 v0, v12, 0x2

    const/4 v13, 0x2

    if-ne v0, v13, :cond_2

    .line 509
    goto/16 :goto_3

    .line 510
    :cond_2
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 511
    .local v13, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    .line 512
    .local v14, "fieldName":Ljava/lang/String;
    const-string/jumbo v0, "stringRepresentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 513
    goto/16 :goto_3

    .line 515
    :cond_3
    const-string/jumbo v0, "indentation"

    invoke-virtual {v14, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 516
    goto/16 :goto_3

    .line 520
    :cond_4
    :try_start_0
    invoke-virtual {v13}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 521
    invoke-virtual {v13}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    .line 522
    .local v0, "fname":Ljava/lang/String;
    const-string/jumbo v15, "int"

    invoke-virtual {v0, v15}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v15

    if-nez v15, :cond_5

    .line 523
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v15

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    if-eq v15, v2, :cond_b

    .line 524
    return v3

    .line 525
    :cond_5
    const-string/jumbo v2, "short"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_6

    .line 526
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v15

    if-eq v2, v15, :cond_b

    .line 527
    return v3

    .line 528
    :cond_6
    const-string/jumbo v2, "char"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_7

    .line 529
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v15

    if-eq v2, v15, :cond_b

    .line 530
    return v3

    .line 531
    :cond_7
    const-string/jumbo v2, "long"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    .line 532
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v16

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v18

    cmp-long v2, v16, v18

    if-eqz v2, :cond_b

    .line 533
    return v3

    .line 534
    :cond_8
    const-string/jumbo v2, "boolean"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_9

    .line 535
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v15

    if-eq v2, v15, :cond_b

    .line 536
    return v3

    .line 537
    :cond_9
    const-string/jumbo v2, "double"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_a

    .line 538
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v16

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v18

    cmpl-double v2, v16, v18

    if-eqz v2, :cond_b

    .line 539
    return v3

    .line 540
    :cond_a
    const-string/jumbo v2, "float"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_b

    .line 541
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v2

    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v15

    cmpl-float v2, v2, v15

    if-eqz v2, :cond_b

    .line 542
    return v3

    .line 544
    .end local v0    # "fname":Ljava/lang/String;
    :cond_b
    goto/16 :goto_1

    .line 545
    :cond_c
    invoke-virtual {v10, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 546
    .local v0, "myObj":Ljava/lang/Object;
    invoke-virtual {v11, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 547
    .local v2, "hisObj":Ljava/lang/Object;
    if-eqz v2, :cond_d

    if-nez v0, :cond_d

    .line 548
    return v3

    .line 549
    :cond_d
    if-nez v2, :cond_e

    if-eqz v0, :cond_e

    .line 550
    goto :goto_3

    .line 551
    :cond_e
    if-nez v2, :cond_f

    if-nez v0, :cond_f

    .line 552
    goto :goto_3

    .line 553
    :cond_f
    instance-of v15, v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v15, :cond_12

    :try_start_1
    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_12

    .line 556
    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    const-string v3, ""

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 557
    const/4 v3, 0x0

    goto :goto_3

    .line 558
    :cond_10
    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    move-object v15, v2

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_11

    .line 561
    const/4 v3, 0x0

    return v3

    .line 558
    :cond_11
    const/4 v3, 0x0

    goto :goto_1

    .line 562
    :cond_12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObject;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_13

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObject;->match(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 565
    const/4 v3, 0x0

    return v3

    .line 566
    :cond_13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroid/gov/nist/core/GenericObjectList;->isMySubclass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_14

    move-object v3, v0

    check-cast v3, Landroid/gov/nist/core/GenericObjectList;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/GenericObjectList;->match(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v3, :cond_14

    .line 569
    const/4 v3, 0x0

    return v3

    .line 566
    :cond_14
    const/4 v3, 0x0

    .line 574
    .end local v0    # "myObj":Ljava/lang/Object;
    .end local v2    # "hisObj":Ljava/lang/Object;
    :goto_1
    goto :goto_3

    .line 572
    :catch_0
    move-exception v0

    const/4 v3, 0x0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 573
    .local v0, "ex1":Ljava/lang/IllegalAccessException;
    :goto_2
    invoke-static {v0}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 503
    .end local v0    # "ex1":Ljava/lang/IllegalAccessException;
    .end local v10    # "f":Ljava/lang/reflect/Field;
    .end local v11    # "g":Ljava/lang/reflect/Field;
    .end local v12    # "modifier":I
    .end local v13    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v14    # "fieldName":Ljava/lang/String;
    :goto_3
    add-int/lit8 v9, v9, 0x1

    const/4 v2, 0x1

    goto/16 :goto_0

    .line 576
    .end local v9    # "i":I
    :cond_15
    const/4 v2, 0x1

    return v2
.end method

.method public merge(Ljava/lang/Object;)V
    .locals 10
    .param p1, "mergeObject"    # Ljava/lang/Object;

    .line 219
    if-nez p1, :cond_0

    .line 220
    return-void

    .line 222
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 225
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 227
    .local v0, "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 228
    .local v1, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_f

    .line 229
    aget-object v3, v1, v2

    .line 230
    .local v3, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    .line 231
    .local v4, "modifier":I
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 232
    goto/16 :goto_4

    .line 233
    :cond_1
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 234
    goto/16 :goto_4

    .line 235
    :cond_2
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isInterface(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 236
    goto/16 :goto_4

    .line 238
    :cond_3
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    .line 239
    .local v5, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    .line 242
    .local v6, "fname":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Class;->isPrimitive()Z

    move-result v7

    if-eqz v7, :cond_b

    .line 243
    const-string/jumbo v7, "int"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_4

    .line 244
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    .line 245
    .local v7, "intfield":I
    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 246
    .end local v7    # "intfield":I
    goto/16 :goto_3

    :cond_4
    const-string/jumbo v7, "short"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_5

    .line 247
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v7

    .line 248
    .local v7, "shortField":S
    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Field;->setShort(Ljava/lang/Object;S)V

    .line 249
    .end local v7    # "shortField":S
    goto/16 :goto_3

    :cond_5
    const-string/jumbo v7, "char"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_6

    .line 250
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v7

    .line 251
    .local v7, "charField":C
    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Field;->setChar(Ljava/lang/Object;C)V

    .line 252
    .end local v7    # "charField":C
    goto :goto_3

    :cond_6
    const-string/jumbo v7, "long"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_7

    .line 253
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v7

    .line 254
    .local v7, "longField":J
    invoke-virtual {v3, p0, v7, v8}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    .line 255
    .end local v7    # "longField":J
    goto :goto_3

    :cond_7
    const-string/jumbo v7, "boolean"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_8

    .line 256
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v7

    .line 257
    .local v7, "booleanField":Z
    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 258
    .end local v7    # "booleanField":Z
    goto :goto_3

    :cond_8
    const-string/jumbo v7, "double"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_9

    .line 259
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v7

    .line 260
    .local v7, "doubleField":D
    invoke-virtual {v3, p0, v7, v8}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V

    .end local v7    # "doubleField":D
    goto :goto_2

    .line 261
    :cond_9
    const-string/jumbo v7, "float"

    invoke-virtual {v6, v7}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_a

    .line 262
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v7

    .line 263
    .local v7, "floatField":F
    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 264
    .end local v7    # "floatField":F
    goto :goto_3

    .line 261
    :cond_a
    :goto_2
    goto :goto_3

    .line 266
    :cond_b
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 267
    .local v7, "obj":Ljava/lang/Object;
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 268
    .local v8, "mobj":Ljava/lang/Object;
    if-nez v8, :cond_c

    .line 269
    goto :goto_4

    .line 270
    :cond_c
    if-nez v7, :cond_d

    .line 271
    invoke-virtual {v3, p0, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 272
    goto :goto_4

    .line 274
    :cond_d
    instance-of v9, v7, Landroid/gov/nist/core/GenericObject;

    if-eqz v9, :cond_e

    .line 275
    move-object v9, v7

    check-cast v9, Landroid/gov/nist/core/GenericObject;

    .line 276
    .local v9, "gobj":Landroid/gov/nist/core/GenericObject;
    invoke-virtual {v9, v8}, Landroid/gov/nist/core/GenericObject;->merge(Ljava/lang/Object;)V

    .line 277
    .end local v9    # "gobj":Landroid/gov/nist/core/GenericObject;
    goto :goto_3

    .line 278
    :cond_e
    invoke-virtual {v3, p0, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .end local v7    # "obj":Ljava/lang/Object;
    .end local v8    # "mobj":Ljava/lang/Object;
    :goto_3
    goto :goto_4

    .line 281
    :catch_0
    move-exception v7

    .line 282
    .local v7, "ex1":Ljava/lang/IllegalAccessException;
    invoke-virtual {v7}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 283
    nop

    .line 228
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v4    # "modifier":I
    .end local v5    # "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "fname":Ljava/lang/String;
    .end local v7    # "ex1":Ljava/lang/IllegalAccessException;
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 286
    .end local v2    # "i":I
    :cond_f
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 287
    const-class v2, Landroid/gov/nist/core/GenericObject;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 288
    nop

    .line 290
    .end local v1    # "fields":[Ljava/lang/reflect/Field;
    return-void

    .line 289
    :cond_10
    goto/16 :goto_0

    .line 223
    .end local v0    # "myclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad override object"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMatcher(Landroid/gov/nist/core/Match;)V
    .locals 2
    .param p1, "matchExpression"    # Landroid/gov/nist/core/Match;

    .line 113
    if-eqz p1, :cond_0

    .line 115
    iput-object p1, p0, Landroid/gov/nist/core/GenericObject;->matchExpression:Landroid/gov/nist/core/Match;

    .line 116
    return-void

    .line 114
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null arg!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected sprint(C)V
    .locals 1
    .param p1, "charField"    # C

    .line 353
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 355
    return-void
.end method

.method protected sprint(D)V
    .locals 1
    .param p1, "doubleField"    # D

    .line 378
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 379
    return-void
.end method

.method protected sprint(F)V
    .locals 1
    .param p1, "floatField"    # F

    .line 386
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 387
    return-void
.end method

.method protected sprint(I)V
    .locals 1
    .param p1, "intField"    # I

    .line 338
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 339
    return-void
.end method

.method protected sprint(J)V
    .locals 1
    .param p1, "longField"    # J

    .line 362
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 363
    return-void
.end method

.method protected sprint(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 330
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 331
    return-void
.end method

.method protected sprint(Ljava/lang/String;)V
    .locals 2
    .param p1, "a"    # Ljava/lang/String;

    .line 308
    if-nez p1, :cond_0

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObject;->getIndentation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<null>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 311
    return-void

    .line 313
    :cond_0
    const-string/jumbo v0, "}"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    .line 314
    :cond_1
    iget v0, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    .line 316
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/gov/nist/core/GenericObject;->getIndentation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/core/GenericObject;->stringRepresentation:Ljava/lang/String;

    .line 319
    const-string/jumbo v0, "{"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "["

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 320
    :cond_3
    iget v0, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/gov/nist/core/GenericObject;->indentation:I

    .line 323
    :cond_4
    return-void
.end method

.method protected sprint(S)V
    .locals 1
    .param p1, "shortField"    # S

    .line 345
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 346
    return-void
.end method

.method protected sprint(Z)V
    .locals 1
    .param p1, "booleanField"    # Z

    .line 370
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/gov/nist/core/GenericObject;->sprint(Ljava/lang/String;)V

    .line 371
    return-void
.end method
