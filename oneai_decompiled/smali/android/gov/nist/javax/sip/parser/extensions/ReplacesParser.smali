.class public Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "ReplacesParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 36
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "callID"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 64
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "Replaces: 12345th5z8z\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Replaces: 12345th5z8z;to-tag=tozght6-45;from-tag=fromzght789-337-2\n"

    aput-object v2, v0, v1

    .line 69
    .local v0, "to":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 70
    new-instance v2, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;-><init>(Ljava/lang/String;)V

    .line 71
    .local v2, "tp":Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/extensions/Replaces;

    .line 72
    .local v3, "t":Landroid/gov/nist/javax/sip/header/extensions/Replaces;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Parsing => "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v0, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 73
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "==> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 74
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "callId "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->getCallId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from-tag="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->getFromTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to-tag="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->getToTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    .end local v2    # "tp":Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;
    .end local v3    # "t":Landroid/gov/nist/javax/sip/header/extensions/Replaces;
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 78
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 45
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->debug:Z

    const-string/jumbo v1, "parse"

    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->dbg_enter(Ljava/lang/String;)V

    .line 48
    :cond_0
    const/16 v0, 0x857

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->headerName(I)V

    .line 50
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/Replaces;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;-><init>()V

    .line 51
    .local v0, "replaces":Landroid/gov/nist/javax/sip/header/extensions/Replaces;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 52
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->byteStringNoSemicolon()Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "callId":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 54
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 55
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/extensions/Replaces;->setCallId(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    nop

    .line 58
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->debug:Z

    if-eqz v3, :cond_1

    .line 59
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 58
    .end local v0    # "replaces":Landroid/gov/nist/javax/sip/header/extensions/Replaces;
    .end local v2    # "callId":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->debug:Z

    if-eqz v2, :cond_2

    .line 59
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/extensions/ReplacesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
