.class public Landroid/gov/nist/javax/sip/parser/UnsupportedParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "UnsupportedParser.java"


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
    .param p1, "unsupported"    # Ljava/lang/String;

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

    .line 66
    new-instance v0, Landroid/gov/nist/javax/sip/header/UnsupportedList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/UnsupportedList;-><init>()V

    .line 67
    .local v0, "unsupportedList":Landroid/gov/nist/javax/sip/header/UnsupportedList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->debug:Z

    const-string/jumbo v2, "UnsupportedParser.parse"

    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    const/16 v1, 0x81c

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->headerName(I)V

    .line 73
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v4, 0xa

    if-eq v1, v4, :cond_2

    .line 74
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 75
    new-instance v1, Landroid/gov/nist/javax/sip/header/Unsupported;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Unsupported;-><init>()V

    .line 76
    .local v1, "unsupported":Landroid/gov/nist/javax/sip/header/Unsupported;
    const-string/jumbo v4, "Unsupported"

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/header/Unsupported;->setHeaderName(Ljava/lang/String;)V

    .line 79
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 80
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 81
    .local v4, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Unsupported;->setOptionTag(Ljava/lang/String;)V

    .line 82
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 84
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/UnsupportedList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 86
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_1

    .line 87
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 88
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 90
    new-instance v6, Landroid/gov/nist/javax/sip/header/Unsupported;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/Unsupported;-><init>()V

    move-object v1, v6

    .line 93
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 94
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v4, v6

    .line 95
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Unsupported;->setOptionTag(Ljava/lang/String;)V

    .line 96
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 98
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/UnsupportedList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 101
    .end local v1    # "unsupported":Landroid/gov/nist/javax/sip/header/Unsupported;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    goto :goto_0

    .line 103
    :cond_2
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->debug:Z

    if-eqz v1, :cond_3

    .line 104
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->dbg_leave(Ljava/lang/String;)V

    .line 107
    :cond_3
    return-object v0

    .line 103
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->debug:Z

    if-eqz v3, :cond_4

    .line 104
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/UnsupportedParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
