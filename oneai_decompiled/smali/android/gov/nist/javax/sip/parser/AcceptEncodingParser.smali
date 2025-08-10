.class public Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "AcceptEncodingParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 78
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "acceptEncoding"    # Ljava/lang/String;

    .line 70
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 71
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 87
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptEncodingList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptEncodingList;-><init>()V

    .line 88
    .local v0, "acceptEncodingList":Landroid/gov/nist/javax/sip/header/AcceptEncodingList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->debug:Z

    const-string v2, "AcceptEncodingParser.parse"

    if-eqz v1, :cond_0

    .line 89
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->dbg_enter(Ljava/lang/String;)V

    .line 92
    :cond_0
    const/16 v1, 0x813

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->headerName(I)V

    .line 94
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v1

    if-nez v1, :cond_1

    .line 95
    new-instance v1, Landroid/gov/nist/javax/sip/header/AcceptEncoding;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;-><init>()V

    .line 96
    .local v1, "acceptEncoding":Landroid/gov/nist/javax/sip/header/AcceptEncoding;
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AcceptEncodingList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 97
    nop

    .end local v1    # "acceptEncoding":Landroid/gov/nist/javax/sip/header/AcceptEncoding;
    goto/16 :goto_4

    .line 99
    :cond_1
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/AcceptEncoding;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;-><init>()V

    .line 100
    .restart local v1    # "acceptEncoding":Landroid/gov/nist/javax/sip/header/AcceptEncoding;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_4

    .line 101
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 102
    .local v3, "value":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->setEncoding(Ljava/lang/String;)V

    .line 104
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x3b

    if-ne v6, v7, :cond_4

    .line 105
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 106
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 107
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v6

    .line 108
    .local v6, "pname":Landroid/gov/nist/core/Token;
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 109
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->lookAhead()C

    move-result v7

    const/16 v8, 0x3d

    if-ne v7, v8, :cond_3

    .line 110
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v8}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 111
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 112
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v7

    move-object v3, v7

    .line 113
    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "q"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_2

    .line 115
    :try_start_1
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    .line 116
    .local v7, "qv":F
    invoke-virtual {v1, v7}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->setQValue(F)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    .end local v7    # "qv":F
    goto :goto_2

    .line 119
    :catch_0
    move-exception v4

    .line 120
    .local v4, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_2
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "acceptEncodingList":Landroid/gov/nist/javax/sip/header/AcceptEncodingList;
    throw v5

    .line 117
    .end local v4    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "acceptEncodingList":Landroid/gov/nist/javax/sip/header/AcceptEncodingList;
    :catch_1
    move-exception v4

    .line 118
    .local v4, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "acceptEncodingList":Landroid/gov/nist/javax/sip/header/AcceptEncodingList;
    throw v5

    .line 123
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "acceptEncodingList":Landroid/gov/nist/javax/sip/header/AcceptEncodingList;
    :cond_2
    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    :goto_2
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_3

    .line 126
    :cond_3
    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v1, v7, v8}, Landroid/gov/nist/javax/sip/header/AcceptEncoding;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .end local v6    # "pname":Landroid/gov/nist/core/Token;
    :goto_3
    goto/16 :goto_1

    .line 129
    .end local v3    # "value":Landroid/gov/nist/core/Token;
    :cond_4
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AcceptEncodingList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 130
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_5

    .line 131
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 132
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 134
    .end local v1    # "acceptEncoding":Landroid/gov/nist/javax/sip/header/AcceptEncoding;
    goto/16 :goto_0

    .line 136
    :cond_5
    :goto_4
    nop

    .line 138
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->debug:Z

    if-eqz v1, :cond_6

    .line 139
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    return-object v0

    .line 138
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->debug:Z

    if-eqz v3, :cond_7

    .line 139
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptEncodingParser;->dbg_leave(Ljava/lang/String;)V

    :cond_7
    throw v1
.end method
