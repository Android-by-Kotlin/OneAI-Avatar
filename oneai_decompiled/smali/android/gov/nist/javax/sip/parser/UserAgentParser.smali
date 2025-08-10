.class public Landroid/gov/nist/javax/sip/parser/UserAgentParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "UserAgentParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 61
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 52
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

    .line 136
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "User-Agent: Softphone/Beta1.5 \n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "User-Agent:Nist/Beta1 (beta version) \n"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "User-Agent: Nist UA (beta version)\n"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "User-Agent: Nist1.0/Beta2 Ubi/vers.1.0 (very cool) \n"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "User-Agent: SJphone/1.60.299a/L (SJ Labs)\n"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "User-Agent: sipXecs/3.5.11 sipXecs/sipxbridge (Linux)\n"

    aput-object v2, v0, v1

    .line 141
    .local v0, "userAgent":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    new-instance v2, Landroid/gov/nist/javax/sip/parser/UserAgentParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;-><init>(Ljava/lang/String;)V

    .line 142
    .local v2, "parser":Landroid/gov/nist/javax/sip/parser/UserAgentParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/UserAgent;

    .line 143
    .local v3, "ua":Landroid/gov/nist/javax/sip/header/UserAgent;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/UserAgent;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 141
    .end local v2    # "parser":Landroid/gov/nist/javax/sip/parser/UserAgentParser;
    .end local v3    # "ua":Landroid/gov/nist/javax/sip/header/UserAgent;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 73
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->debug:Z

    const-string/jumbo v1, "UserAgentParser.parse"

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->dbg_enter(Ljava/lang/String;)V

    .line 75
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/UserAgent;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/UserAgent;-><init>()V

    .line 77
    .local v0, "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    const/16 v2, 0x811

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->headerName(I)V

    .line 78
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_7

    .line 87
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    if-eq v2, v4, :cond_5

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    if-eqz v2, :cond_5

    .line 89
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v5, 0x28

    if-ne v2, v5, :cond_1

    .line 90
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->comment()Ljava/lang/String;

    move-result-object v2

    .line 91
    .local v2, "comment":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/UserAgent;->addProductToken(Ljava/lang/String;)V

    .line 92
    .end local v2    # "comment":Ljava/lang/String;
    goto :goto_2

    .line 97
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/Lexer;->SPorHT()V

    .line 100
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->byteStringNoSlash()Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "product":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 103
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .local v5, "productSb":Ljava/lang/StringBuilder;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->peekNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v6

    const/16 v7, 0x2f

    if-ne v6, v7, :cond_3

    .line 107
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 110
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v6

    invoke-virtual {v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->SPorHT()V

    .line 112
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->byteStringNoSlash()Ljava/lang/String;

    move-result-object v6

    .line 114
    .local v6, "productVersion":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 116
    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 114
    :cond_2
    const-string v3, "Expected product version"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    .end local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    throw v3

    .line 121
    .end local v6    # "productVersion":Ljava/lang/String;
    .restart local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    :cond_3
    :goto_1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/gov/nist/javax/sip/header/UserAgent;->addProductToken(Ljava/lang/String;)V

    .line 124
    .end local v2    # "product":Ljava/lang/String;
    .end local v5    # "productSb":Ljava/lang/StringBuilder;
    :goto_2
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto/16 :goto_0

    .line 101
    .restart local v2    # "product":Ljava/lang/String;
    :cond_4
    const-string v3, "Expected product string"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    .end local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    .end local v2    # "product":Ljava/lang/String;
    .restart local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    :cond_5
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->debug:Z

    if-eqz v2, :cond_6

    .line 128
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->dbg_leave(Ljava/lang/String;)V

    .line 131
    :cond_6
    return-object v0

    .line 79
    :cond_7
    :try_start_1
    const-string/jumbo v2, "empty header"

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    .end local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    .restart local v0    # "userAgent":Landroid/gov/nist/javax/sip/header/UserAgent;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->debug:Z

    if-eqz v3, :cond_8

    .line 128
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/UserAgentParser;->dbg_leave(Ljava/lang/String;)V

    :cond_8
    throw v2
.end method
