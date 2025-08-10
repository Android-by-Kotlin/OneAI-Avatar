.class public Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ContentLanguageParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 57
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentLanguage"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 50
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

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->debug:Z

    const-string v1, "ContentLanguageParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentLanguageList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentLanguageList;-><init>()V

    .line 72
    .local v0, "list":Landroid/gov/nist/javax/sip/header/ContentLanguageList;
    const/16 v2, 0x81b

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->headerName(I)V

    .line 74
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    .line 75
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xfff

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 78
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 79
    .local v2, "token":Landroid/gov/nist/core/Token;
    new-instance v5, Landroid/gov/nist/javax/sip/header/ContentLanguage;

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/gov/nist/javax/sip/header/ContentLanguage;-><init>(Ljava/lang/String;)V

    .line 80
    .local v5, "cl":Landroid/gov/nist/javax/sip/header/ContentLanguage;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 81
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/ContentLanguageList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 83
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_1

    .line 84
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 85
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 86
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 87
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 88
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v2, v6

    .line 89
    new-instance v6, Landroid/gov/nist/javax/sip/header/ContentLanguage;

    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/gov/nist/javax/sip/header/ContentLanguage;-><init>(Ljava/lang/String;)V

    move-object v5, v6

    .line 90
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 91
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/ContentLanguageList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 93
    .end local v2    # "token":Landroid/gov/nist/core/Token;
    .end local v5    # "cl":Landroid/gov/nist/javax/sip/header/ContentLanguage;
    :cond_1
    goto :goto_0

    .line 95
    :cond_2
    nop

    .line 99
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->debug:Z

    if-eqz v2, :cond_3

    .line 100
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 99
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 96
    :catch_0
    move-exception v2

    .line 97
    .local v2, "ex":Ljava/text/ParseException;
    :try_start_1
    invoke-virtual {v2}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    .end local v0    # "list":Landroid/gov/nist/javax/sip/header/ContentLanguageList;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .end local v2    # "ex":Ljava/text/ParseException;
    .restart local v0    # "list":Landroid/gov/nist/javax/sip/header/ContentLanguageList;
    :goto_2
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->debug:Z

    if-eqz v3, :cond_4

    .line 100
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentLanguageParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v2
.end method
