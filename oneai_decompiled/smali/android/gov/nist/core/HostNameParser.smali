.class public Landroid/gov/nist/core/HostNameParser;
.super Landroid/gov/nist/core/ParserCore;
.source "HostNameParser.java"


# static fields
.field private static final VALID_DOMAIN_LABEL_CHAR:[C

.field private static stripAddressScopeZones:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    const/4 v0, 0x0

    sput-boolean v0, Landroid/gov/nist/core/HostNameParser;->stripAddressScopeZones:Z

    .line 61
    const-string/jumbo v0, "android.gov.nist.core.STRIP_ADDR_SCOPES"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Landroid/gov/nist/core/HostNameParser;->stripAddressScopeZones:Z

    .line 76
    const/4 v0, 0x4

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Landroid/gov/nist/core/HostNameParser;->VALID_DOMAIN_LABEL_CHAR:[C

    return-void

    nop

    :array_0
    .array-data 2
        -0x3s
        0x2ds
        0x2es
        0x5fs
    .end array-data
.end method

.method public constructor <init>(Landroid/gov/nist/core/LexerCore;)V
    .locals 1
    .param p1, "lexer"    # Landroid/gov/nist/core/LexerCore;

    .line 71
    invoke-direct {p0}, Landroid/gov/nist/core/ParserCore;-><init>()V

    .line 72
    iput-object p1, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 73
    const-string/jumbo v0, "charLexer"

    invoke-virtual {p1, v0}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "hname"    # Ljava/lang/String;

    .line 64
    invoke-direct {p0}, Landroid/gov/nist/core/ParserCore;-><init>()V

    .line 65
    new-instance v0, Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/core/LexerCore;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 66
    return-void
.end method

.method private isIPv6Address(Ljava/lang/String;)Z
    .locals 10
    .param p1, "uriHeader"    # Ljava/lang/String;

    .line 220
    move-object v0, p1

    .line 221
    .local v0, "hostName":Ljava/lang/String;
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 222
    .local v1, "indexOfComma":I
    const/4 v2, 0x0

    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 223
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 227
    :cond_0
    const/16 v4, 0x3f

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 231
    .local v4, "hostEnd":I
    const/16 v5, 0x3b

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 232
    .local v5, "semiColonIndex":I
    if-eq v4, v3, :cond_1

    if-eq v5, v3, :cond_2

    if-le v4, v5, :cond_2

    .line 234
    :cond_1
    move v4, v5

    .line 238
    :cond_2
    if-ne v4, v3, :cond_3

    .line 239
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    .line 242
    :cond_3
    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 244
    .local v6, "host":Ljava/lang/String;
    const/16 v7, 0x3a

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 246
    .local v8, "firstColonIndex":I
    if-ne v8, v3, :cond_4

    .line 247
    return v2

    .line 249
    :cond_4
    add-int/lit8 v9, v8, 0x1

    invoke-virtual {v6, v7, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    .line 251
    .local v7, "secondColonIndex":I
    if-ne v7, v3, :cond_5

    .line 252
    return v2

    .line 254
    :cond_5
    const/4 v2, 0x1

    return v2
.end method

.method public static main([Ljava/lang/String;)V
    .locals 8
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 322
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "foo.bar.com:1234"

    aput-object v2, v0, v1

    const-string/jumbo v1, "proxima.chaplin.bt.co.uk"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    const-string v3, "129.6.55.181:2345"

    aput-object v3, v0, v1

    const/4 v1, 0x3

    const-string v3, ":1234"

    aput-object v3, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v3, "foo.bar.com:         1234"

    aput-object v3, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v3, "foo.bar.com     :      1234   "

    aput-object v3, v0, v1

    const/4 v1, 0x6

    const-string v3, "MIK_S:1234"

    aput-object v3, v0, v1

    .line 333
    .local v0, "hostNames":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 335
    :try_start_0
    new-instance v3, Landroid/gov/nist/core/HostNameParser;

    aget-object v4, v0, v1

    invoke-direct {v3, v4}, Landroid/gov/nist/core/HostNameParser;-><init>(Ljava/lang/String;)V

    .line 336
    .local v3, "hnp":Landroid/gov/nist/core/HostNameParser;
    invoke-virtual {v3, v2}, Landroid/gov/nist/core/HostNameParser;->hostPort(Z)Landroid/gov/nist/core/HostPort;

    move-result-object v4

    .line 337
    .local v4, "hp":Landroid/gov/nist/core/HostPort;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Landroid/gov/nist/core/HostPort;->encode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    .end local v3    # "hnp":Landroid/gov/nist/core/HostNameParser;
    .end local v4    # "hp":Landroid/gov/nist/core/HostPort;
    goto :goto_1

    .line 338
    :catch_0
    move-exception v3

    .line 339
    .local v3, "ex":Ljava/text/ParseException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "exception text = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 333
    .end local v3    # "ex":Ljava/text/ParseException;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 343
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method protected consumeDomainLabel()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 80
    sget-boolean v0, Landroid/gov/nist/core/HostNameParser;->debug:Z

    const-string/jumbo v1, "domainLabel"

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_enter(Ljava/lang/String;)V

    .line 83
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    sget-object v2, Landroid/gov/nist/core/HostNameParser;->VALID_DOMAIN_LABEL_CHAR:[C

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->consumeValidChars([C)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    sget-boolean v0, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v0, :cond_1

    .line 86
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    .line 88
    :cond_1
    return-void

    .line 85
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v2, :cond_2

    .line 86
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method

.method public host()Landroid/gov/nist/core/Host;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 166
    sget-boolean v0, Landroid/gov/nist/core/HostNameParser;->debug:Z

    const-string/jumbo v1, "host"

    if-eqz v0, :cond_0

    .line 167
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_enter(Ljava/lang/String;)V

    .line 172
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    const/16 v2, 0x5b

    if-ne v0, v2, :cond_1

    .line 173
    invoke-virtual {p0}, Landroid/gov/nist/core/HostNameParser;->ipv6Reference()Ljava/lang/String;

    move-result-object v0

    .local v0, "hostname":Ljava/lang/String;
    goto :goto_0

    .line 176
    .end local v0    # "hostname":Ljava/lang/String;
    :cond_1
    iget-object v0, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/gov/nist/core/HostNameParser;->isIPv6Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 178
    iget-object v0, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v0

    .line 179
    .local v0, "startPtr":I
    iget-object v2, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x2

    new-array v3, v3, [C

    fill-array-data v3, :array_0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->consumeValidChars([C)V

    .line 181
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v4

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    .line 185
    .local v0, "hostname":Ljava/lang/String;
    goto :goto_0

    .line 188
    .end local v0    # "hostname":Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v0

    .line 189
    .local v0, "startPtr":I
    invoke-virtual {p0}, Landroid/gov/nist/core/HostNameParser;->consumeDomainLabel()V

    .line 190
    iget-object v2, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    .line 193
    .local v0, "hostname":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_4

    .line 198
    new-instance v2, Landroid/gov/nist/core/Host;

    invoke-direct {v2, v0}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    sget-boolean v3, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v3, :cond_3

    .line 201
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v2

    .line 194
    :cond_4
    :try_start_1
    new-instance v2, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Missing host name"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v4

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 200
    .end local v0    # "hostname":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v2, :cond_5

    .line 201
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v0

    nop

    :array_0
    .array-data 2
        -0x3s
        0x3as
    .end array-data
.end method

.method public hostPort(Z)Landroid/gov/nist/core/HostPort;
    .locals 8
    .param p1, "allowWS"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 264
    sget-boolean v0, Landroid/gov/nist/core/HostNameParser;->debug:Z

    const-string/jumbo v1, "hostPort"

    if-eqz v0, :cond_0

    .line 265
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_enter(Ljava/lang/String;)V

    .line 267
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/gov/nist/core/HostNameParser;->host()Landroid/gov/nist/core/Host;

    move-result-object v0

    .line 268
    .local v0, "host":Landroid/gov/nist/core/Host;
    new-instance v2, Landroid/gov/nist/core/HostPort;

    invoke-direct {v2}, Landroid/gov/nist/core/HostPort;-><init>()V

    .line 269
    .local v2, "hp":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v2, v0}, Landroid/gov/nist/core/HostPort;->setHost(Landroid/gov/nist/core/Host;)V

    .line 271
    if-eqz p1, :cond_1

    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 272
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 273
    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 274
    .local v3, "la":C
    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 277
    :sswitch_0
    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 278
    if-eqz p1, :cond_2

    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    :cond_2
    :try_start_1
    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v4

    .line 281
    .local v4, "port":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/gov/nist/core/HostPort;->setPort(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 286
    .end local v4    # "port":Ljava/lang/String;
    goto :goto_1

    .line 282
    :catch_0
    move-exception v4

    .line 283
    .local v4, "nfe":Ljava/lang/NumberFormatException;
    :try_start_2
    new-instance v5, Ljava/text/ParseException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " :Error parsing port "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v7

    invoke-direct {v5, v6, v7}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "allowWS":Z
    throw v5

    .line 302
    .end local v4    # "nfe":Ljava/lang/NumberFormatException;
    .restart local p1    # "allowWS":Z
    :sswitch_1
    sget-boolean v5, Landroid/gov/nist/core/HostNameParser;->stripAddressScopeZones:Z

    if-eqz v5, :cond_3

    .line 303
    goto :goto_1

    .line 300
    :sswitch_2
    goto :goto_1

    .line 307
    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    goto :goto_1

    .line 308
    :cond_4
    new-instance v5, Ljava/text/ParseException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " Illegal character in hostname:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v6, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v6

    invoke-direct {v5, v4, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "allowWS":Z
    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 314
    .end local v3    # "la":C
    .restart local p1    # "allowWS":Z
    :cond_5
    :goto_1
    nop

    .line 316
    sget-boolean v3, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v3, :cond_6

    .line 317
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    return-object v2

    .line 316
    .end local v0    # "host":Landroid/gov/nist/core/Host;
    .end local v2    # "hp":Landroid/gov/nist/core/HostPort;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v2, :cond_7

    .line 317
    invoke-virtual {p0, v1}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_7
    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_2
        0xa -> :sswitch_2
        0xd -> :sswitch_2
        0x20 -> :sswitch_2
        0x25 -> :sswitch_1
        0x2c -> :sswitch_2
        0x2f -> :sswitch_2
        0x3a -> :sswitch_0
        0x3b -> :sswitch_2
        0x3e -> :sswitch_2
        0x3f -> :sswitch_2
    .end sparse-switch
.end method

.method protected ipv6Reference()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .local v0, "retval":Ljava/lang/StringBuilder;
    sget-boolean v1, Landroid/gov/nist/core/HostNameParser;->debug:Z

    const-string/jumbo v2, "ipv6Reference"

    if-eqz v1, :cond_0

    .line 93
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/HostNameParser;->dbg_enter(Ljava/lang/String;)V

    .line 97
    :cond_0
    :try_start_0
    sget-boolean v1, Landroid/gov/nist/core/HostNameParser;->stripAddressScopeZones:Z

    const/16 v3, 0x5b

    const/16 v4, 0x3a

    const/16 v5, 0x2e

    const/4 v6, 0x0

    const/16 v7, 0x5d

    const/4 v8, 0x1

    if-eqz v1, :cond_8

    .line 98
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 99
    iget-object v1, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 102
    .local v1, "la":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isHexDigit(C)Z

    move-result v9

    if-nez v9, :cond_7

    if-eq v1, v5, :cond_7

    if-eq v1, v4, :cond_7

    if-ne v1, v3, :cond_1

    goto :goto_1

    .line 106
    :cond_1
    if-ne v1, v7, :cond_3

    .line 107
    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v8}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    sget-boolean v4, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v4, :cond_2

    .line 161
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v3

    .line 110
    :cond_3
    const/16 v3, 0x25

    if-ne v1, v3, :cond_c

    .line 112
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v8}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 114
    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v3

    .line 116
    .local v3, "rest":Ljava/lang/String;
    if-eqz v3, :cond_c

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_6

    .line 123
    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 125
    .local v4, "stripLen":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_5

    .line 130
    iget-object v5, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 131
    const-string/jumbo v5, "]"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 160
    sget-boolean v6, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v6, :cond_4

    .line 161
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v5

    .line 127
    :cond_5
    goto :goto_4

    .line 118
    .end local v4    # "stripLen":I
    :cond_6
    goto :goto_4

    .line 104
    .end local v3    # "rest":Ljava/lang/String;
    :cond_7
    :goto_1
    :try_start_2
    iget-object v9, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v8}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    .end local v1    # "la":C
    goto :goto_0

    .line 140
    :cond_8
    :goto_2
    iget-object v1, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 142
    iget-object v1, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 143
    .restart local v1    # "la":C
    invoke-static {v1}, Landroid/gov/nist/core/LexerCore;->isHexDigit(C)Z

    move-result v9

    if-nez v9, :cond_b

    if-eq v1, v5, :cond_b

    if-eq v1, v4, :cond_b

    if-ne v1, v3, :cond_9

    goto :goto_3

    .line 147
    :cond_9
    if-ne v1, v7, :cond_c

    .line 148
    iget-object v3, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v8}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 150
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    sget-boolean v4, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v4, :cond_a

    .line 161
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_a
    return-object v3

    .line 145
    :cond_b
    :goto_3
    :try_start_3
    iget-object v9, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v8}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 153
    .end local v1    # "la":C
    goto :goto_2

    .line 156
    :cond_c
    :goto_4
    new-instance v1, Ljava/text/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Illegal Host name "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/core/HostNameParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v4

    invoke-direct {v1, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local v0    # "retval":Ljava/lang/StringBuilder;
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 160
    .restart local v0    # "retval":Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/core/HostNameParser;->debug:Z

    if-eqz v3, :cond_d

    .line 161
    invoke-virtual {p0, v2}, Landroid/gov/nist/core/HostNameParser;->dbg_leave(Ljava/lang/String;)V

    :cond_d
    throw v1
.end method
