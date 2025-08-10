.class public Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ProxyRequireParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "require"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 49
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

    .line 65
    new-instance v0, Landroid/gov/nist/javax/sip/header/ProxyRequireList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ProxyRequireList;-><init>()V

    .line 66
    .local v0, "list":Landroid/gov/nist/javax/sip/header/ProxyRequireList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->debug:Z

    const-string/jumbo v2, "ProxyRequireParser.parse"

    if-eqz v1, :cond_0

    .line 67
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->dbg_enter(Ljava/lang/String;)V

    .line 70
    :cond_0
    const/16 v1, 0x81a

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->headerName(I)V

    .line 72
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v4, 0xa

    if-eq v1, v4, :cond_2

    .line 73
    new-instance v1, Landroid/gov/nist/javax/sip/header/ProxyRequire;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ProxyRequire;-><init>()V

    .line 74
    .local v1, "r":Landroid/gov/nist/javax/sip/header/ProxyRequire;
    const-string/jumbo v4, "Proxy-Require"

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/header/ProxyRequire;->setHeaderName(Ljava/lang/String;)V

    .line 77
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 78
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 79
    .local v4, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/ProxyRequire;->setOptionTag(Ljava/lang/String;)V

    .line 80
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 82
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ProxyRequireList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 84
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_1

    .line 85
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 86
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 88
    new-instance v6, Landroid/gov/nist/javax/sip/header/ProxyRequire;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/ProxyRequire;-><init>()V

    move-object v1, v6

    .line 91
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 92
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v4, v6

    .line 93
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/ProxyRequire;->setOptionTag(Ljava/lang/String;)V

    .line 94
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 96
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ProxyRequireList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 99
    .end local v1    # "r":Landroid/gov/nist/javax/sip/header/ProxyRequire;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    goto :goto_0

    .line 101
    :cond_2
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->debug:Z

    if-eqz v1, :cond_3

    .line 102
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->dbg_leave(Ljava/lang/String;)V

    .line 105
    :cond_3
    return-object v0

    .line 101
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->debug:Z

    if-eqz v3, :cond_4

    .line 102
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ProxyRequireParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
