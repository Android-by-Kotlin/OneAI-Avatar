.class public Landroid/gov/nist/javax/sip/parser/SupportedParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "SupportedParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "supported"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 52
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 68
    new-instance v0, Landroid/gov/nist/javax/sip/header/SupportedList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/SupportedList;-><init>()V

    .line 69
    .local v0, "supportedList":Landroid/gov/nist/javax/sip/header/SupportedList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/SupportedParser;->debug:Z

    const-string/jumbo v2, "SupportedParser.parse"

    if-eqz v1, :cond_0

    .line 70
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SupportedParser;->dbg_enter(Ljava/lang/String;)V

    .line 75
    :cond_0
    const/16 v1, 0x814

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SupportedParser;->headerName(I)V

    .line 77
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    new-instance v1, Landroid/gov/nist/javax/sip/header/Supported;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Supported;-><init>()V

    .line 79
    .local v1, "supported":Landroid/gov/nist/javax/sip/header/Supported;
    const-string/jumbo v3, "Supported"

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/Supported;->setHeaderName(Ljava/lang/String;)V

    .line 81
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0xa

    const/16 v6, 0xfff

    if-eq v3, v5, :cond_1

    .line 83
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 84
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 85
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sip/header/Supported;->setOptionTag(Ljava/lang/String;)V

    .line 86
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 89
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/SupportedList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 91
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0x2c

    if-ne v3, v5, :cond_2

    .line 92
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 93
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 95
    new-instance v3, Landroid/gov/nist/javax/sip/header/Supported;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/Supported;-><init>()V

    move-object v1, v3

    .line 98
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 99
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 100
    .restart local v3    # "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sip/header/Supported;->setOptionTag(Ljava/lang/String;)V

    .line 101
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/SupportedParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 103
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/SupportedList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 106
    .end local v1    # "supported":Landroid/gov/nist/javax/sip/header/Supported;
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :cond_2
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/SupportedParser;->debug:Z

    if-eqz v1, :cond_3

    .line 107
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SupportedParser;->dbg_leave(Ljava/lang/String;)V

    .line 110
    :cond_3
    return-object v0

    .line 106
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/SupportedParser;->debug:Z

    if-eqz v3, :cond_4

    .line 107
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SupportedParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
