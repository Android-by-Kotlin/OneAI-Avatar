.class public Landroid/gov/nist/javax/sip/Utils;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/UtilsExt;


# static fields
.field private static callIDCounter:I

.field private static counter:J

.field private static digesterPool:[Ljava/security/MessageDigest;

.field private static digesterPoolsSize:I

.field private static instance:Landroid/gov/nist/javax/sip/Utils;

.field private static rand:Ljava/util/Random;

.field private static signature:Ljava/lang/String;

.field private static final toHex:[C


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 51
    const/16 v0, 0x14

    sput v0, Landroid/gov/nist/javax/sip/Utils;->digesterPoolsSize:I

    .line 53
    sget v0, Landroid/gov/nist/javax/sip/Utils;->digesterPoolsSize:I

    new-array v0, v0, [Ljava/security/MessageDigest;

    sput-object v0, Landroid/gov/nist/javax/sip/Utils;->digesterPool:[Ljava/security/MessageDigest;

    .line 57
    const-wide/16 v0, 0x0

    sput-wide v0, Landroid/gov/nist/javax/sip/Utils;->counter:J

    .line 63
    new-instance v0, Landroid/gov/nist/javax/sip/Utils;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/Utils;-><init>()V

    sput-object v0, Landroid/gov/nist/javax/sip/Utils;->instance:Landroid/gov/nist/javax/sip/Utils;

    .line 69
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Landroid/gov/nist/javax/sip/Utils;->toHex:[C

    .line 74
    const/4 v0, 0x0

    .local v0, "q":I
    :goto_0
    :try_start_0
    sget v1, Landroid/gov/nist/javax/sip/Utils;->digesterPoolsSize:I

    if-ge v0, v1, :cond_0

    .line 75
    sget-object v1, Landroid/gov/nist/javax/sip/Utils;->digesterPool:[Ljava/security/MessageDigest;

    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    aput-object v2, v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 78
    .end local v0    # "q":I
    :cond_0
    nop

    .line 79
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    sput-object v0, Landroid/gov/nist/javax/sip/Utils;->rand:Ljava/util/Random;

    .line 80
    sget-object v0, Landroid/gov/nist/javax/sip/Utils;->rand:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    rem-int/lit16 v0, v0, 0x3e8

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Landroid/gov/nist/javax/sip/Utils;->toHexString([B)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/Utils;->signature:Ljava/lang/String;

    .line 81
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not intialize Digester "

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Landroid/gov/nist/javax/sip/Utils;
    .locals 1

    .line 85
    sget-object v0, Landroid/gov/nist/javax/sip/Utils;->instance:Landroid/gov/nist/javax/sip/Utils;

    return-object v0
.end method

.method public static getQuotedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\""

    const-string/jumbo v3, "\\\""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSignature()Ljava/lang/String;
    .locals 1

    .line 214
    sget-object v0, Landroid/gov/nist/javax/sip/Utils;->signature:Ljava/lang/String;

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;

    .line 218
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 219
    .local v0, "branchIds":Ljava/util/HashSet;
    const/16 v1, 0x64

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    .line 220
    .local v2, "e":Ljava/util/concurrent/Executor;
    const/4 v3, 0x0

    .local v3, "q":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 221
    new-instance v4, Landroid/gov/nist/javax/sip/Utils$1;

    invoke-direct {v4, v0}, Landroid/gov/nist/javax/sip/Utils$1;-><init>(Ljava/util/HashSet;)V

    invoke-interface {v2, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 220
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 236
    .end local v3    # "q":I
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Done!!"

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 238
    return-void
.end method

.method protected static reduceString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "input"    # Ljava/lang/String;

    .line 126
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "newString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 128
    .local v1, "len":I
    const-string v2, ""

    .line 129
    .local v2, "retval":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 130
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x20

    if-eq v4, v5, :cond_1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x9

    if-ne v4, v5, :cond_0

    .line 131
    goto :goto_1

    .line 133
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 129
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 135
    .end local v3    # "i":I
    :cond_2
    return-object v2
.end method

.method public static toHexString([B)Ljava/lang/String;
    .locals 6
    .param p0, "b"    # [B

    .line 97
    const/4 v0, 0x0

    .line 98
    .local v0, "pos":I
    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    .line 99
    .local v1, "c":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 100
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "pos":I
    .local v3, "pos":I
    sget-object v4, Landroid/gov/nist/javax/sip/Utils;->toHex:[C

    aget-byte v5, p0, v2

    shr-int/lit8 v5, v5, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    aput-char v4, v1, v0

    .line 101
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "pos":I
    .restart local v0    # "pos":I
    sget-object v4, Landroid/gov/nist/javax/sip/Utils;->toHex:[C

    aget-byte v5, p0, v2

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    aput-char v4, v1, v3

    .line 99
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 103
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method public static toUpperCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 148
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public generateBranchId()Ljava/lang/String;
    .locals 7

    .line 195
    sget-object v0, Landroid/gov/nist/javax/sip/Utils;->rand:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    sget-wide v2, Landroid/gov/nist/javax/sip/Utils;->counter:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Landroid/gov/nist/javax/sip/Utils;->counter:J

    add-long/2addr v0, v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 196
    .local v0, "num":J
    sget v2, Landroid/gov/nist/javax/sip/Utils;->digesterPoolsSize:I

    int-to-long v2, v2

    rem-long v2, v0, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    long-to-int v2, v2

    .line 197
    .local v2, "hash":I
    sget-object v3, Landroid/gov/nist/javax/sip/Utils;->digesterPool:[Ljava/security/MessageDigest;

    aget-object v3, v3, v2

    .line 198
    .local v3, "digester":Ljava/security/MessageDigest;
    monitor-enter v3

    .line 199
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v4

    .line 201
    .local v4, "bid":[B
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "z9hG4bK-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Landroid/gov/nist/javax/sip/Utils;->signature:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v4}, Landroid/gov/nist/javax/sip/Utils;->toHexString([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    monitor-exit v3

    return-object v5

    .line 203
    .end local v4    # "bid":[B
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public generateCallIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "address"    # Ljava/lang/String;

    .line 156
    sget-object v0, Landroid/gov/nist/javax/sip/Utils;->rand:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    .line 157
    .local v0, "random":J
    sget v2, Landroid/gov/nist/javax/sip/Utils;->digesterPoolsSize:I

    int-to-long v2, v2

    rem-long v2, v0, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    long-to-int v2, v2

    .line 158
    .local v2, "hash":I
    sget-object v3, Landroid/gov/nist/javax/sip/Utils;->digesterPool:[Ljava/security/MessageDigest;

    aget-object v3, v3, v2

    .line 160
    .local v3, "md":Ljava/security/MessageDigest;
    monitor-enter v3

    .line 161
    :try_start_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    add-long/2addr v4, v6

    sget v6, Landroid/gov/nist/javax/sip/Utils;->callIDCounter:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Landroid/gov/nist/javax/sip/Utils;->callIDCounter:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    add-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    .line 163
    .local v4, "date":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v5

    .line 165
    .local v5, "cid":[B
    invoke-static {v5}, Landroid/gov/nist/javax/sip/Utils;->toHexString([B)Ljava/lang/String;

    move-result-object v6

    .line 166
    .local v6, "cidString":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "@"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    monitor-exit v3

    return-object v7

    .line 167
    .end local v4    # "date":Ljava/lang/String;
    .end local v5    # "cid":[B
    .end local v6    # "cidString":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public declared-synchronized generateTag()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    .line 182
    :try_start_0
    sget-object v0, Landroid/gov/nist/javax/sip/Utils;->rand:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 182
    .end local p0    # "this":Landroid/gov/nist/javax/sip/Utils;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public responseBelongsToUs(Landroid/gov/nist/javax/sip/message/SIPResponse;)Z
    .locals 4
    .param p1, "response"    # Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 207
    invoke-virtual {p1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTopmostVia()Landroid/gov/nist/javax/sip/header/Via;

    move-result-object v0

    .line 208
    .local v0, "topmostVia":Landroid/gov/nist/javax/sip/header/Via;
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/Via;->getBranch()Ljava/lang/String;

    move-result-object v1

    .line 209
    .local v1, "branch":Ljava/lang/String;
    if-eqz v1, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "z9hG4bK-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/gov/nist/javax/sip/Utils;->signature:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method
