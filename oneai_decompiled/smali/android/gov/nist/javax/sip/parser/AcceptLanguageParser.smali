.class public Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "AcceptLanguageParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 75
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "acceptLanguage"    # Ljava/lang/String;

    .line 67
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 68
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

    .line 84
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;-><init>()V

    .line 85
    .local v0, "acceptLanguageList":Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->debug:Z

    const-string v2, "AcceptLanguageParser.parse"

    if-eqz v1, :cond_0

    .line 86
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->dbg_enter(Ljava/lang/String;)V

    .line 89
    :cond_0
    const/16 v1, 0x82f

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->headerName(I)V

    .line 91
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/AcceptLanguage;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/AcceptLanguage;-><init>()V

    .line 93
    .local v1, "acceptLanguage":Landroid/gov/nist/javax/sip/header/AcceptLanguage;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 96
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 97
    .local v3, "value":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/AcceptLanguage;->setLanguageRange(Ljava/lang/String;)V

    .line 98
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 99
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x3b

    if-ne v6, v7, :cond_1

    .line 100
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 101
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 102
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v7, 0x71

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 103
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 104
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v7, 0x3d

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 105
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 106
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 107
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v3, v6

    .line 109
    :try_start_1
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    .line 110
    .local v6, "fl":F
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/AcceptLanguage;->setQValue(F)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    .end local v6    # "fl":F
    nop

    .line 116
    :try_start_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_1

    .line 113
    :catch_0
    move-exception v4

    .line 114
    .local v4, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "acceptLanguageList":Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
    throw v5

    .line 111
    .end local v4    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "acceptLanguageList":Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
    :catch_1
    move-exception v4

    .line 112
    .local v4, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "acceptLanguageList":Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
    throw v5

    .line 119
    .end local v3    # "value":Landroid/gov/nist/core/Token;
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "acceptLanguageList":Landroid/gov/nist/javax/sip/header/AcceptLanguageList;
    :cond_1
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/AcceptLanguageList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 120
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_2

    .line 121
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 122
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 125
    .end local v1    # "acceptLanguage":Landroid/gov/nist/javax/sip/header/AcceptLanguage;
    goto/16 :goto_0

    .line 127
    :cond_2
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->debug:Z

    if-eqz v1, :cond_3

    .line 128
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->dbg_leave(Ljava/lang/String;)V

    .line 131
    :cond_3
    return-object v0

    .line 127
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->debug:Z

    if-eqz v3, :cond_4

    .line 128
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptLanguageParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
