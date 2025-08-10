.class public Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "SessionExpiresParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 30
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .line 22
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 23
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 8
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 66
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "Session-Expires: 30\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Session-Expires: 45;refresher=uac\n"

    aput-object v2, v0, v1

    .line 71
    .local v0, "to":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 72
    new-instance v2, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;-><init>(Ljava/lang/String;)V

    .line 73
    .local v2, "tp":Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;

    .line 74
    .local v3, "t":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 75
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\ntime="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->getExpires()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 76
    const-string/jumbo v4, "refresher"

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 77
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "refresher="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 71
    .end local v2    # "tp":Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;
    .end local v3    # "t":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    .end local v1    # "i":I
    :cond_1
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 37
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;-><init>()V

    .line 38
    .local v0, "se":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->debug:Z

    const-string/jumbo v2, "parse"

    if-eqz v1, :cond_0

    .line 39
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->dbg_enter(Ljava/lang/String;)V

    .line 41
    :cond_0
    const/16 v1, 0x855

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->headerName(I)V

    .line 43
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextId()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .local v1, "nextId":Ljava/lang/String;
    :try_start_1
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 47
    .local v3, "delta":I
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;->setExpires(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .end local v3    # "delta":I
    nop

    .line 54
    :try_start_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 55
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    nop

    .line 59
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->debug:Z

    if-eqz v3, :cond_1

    .line 60
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 50
    :catch_0
    move-exception v3

    .line 51
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_3
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "se":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    throw v4

    .line 48
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "se":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    :catch_1
    move-exception v3

    .line 49
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string/jumbo v4, "bad integer format"

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "se":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    .end local v1    # "nextId":Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "se":Landroid/gov/nist/javax/sip/header/extensions/SessionExpires;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->debug:Z

    if-eqz v3, :cond_2

    .line 60
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/extensions/SessionExpiresParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
