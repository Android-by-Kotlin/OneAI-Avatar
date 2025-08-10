.class public Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ContentEncodingParser.java"


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
    .param p1, "contentEncoding"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 52
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

    .line 69
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->debug:Z

    const-string v1, "ContentEncodingParser.parse"

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentEncodingList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentEncodingList;-><init>()V

    .line 74
    .local v0, "list":Landroid/gov/nist/javax/sip/header/ContentEncodingList;
    const/16 v2, 0x823

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->headerName(I)V

    .line 76
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    .line 77
    new-instance v2, Landroid/gov/nist/javax/sip/header/ContentEncoding;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/ContentEncoding;-><init>()V

    .line 78
    .local v2, "cl":Landroid/gov/nist/javax/sip/header/ContentEncoding;
    const-string v4, "Content-Encoding"

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/header/ContentEncoding;->setHeaderName(Ljava/lang/String;)V

    .line 80
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 81
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 83
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 84
    .local v4, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/ContentEncoding;->setEncoding(Ljava/lang/String;)V

    .line 86
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ContentEncodingList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 89
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_1

    .line 90
    new-instance v6, Landroid/gov/nist/javax/sip/header/ContentEncoding;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/ContentEncoding;-><init>()V

    move-object v2, v6

    .line 91
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 92
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 93
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 94
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 95
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v4, v6

    .line 96
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/ContentEncoding;->setEncoding(Ljava/lang/String;)V

    .line 97
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 98
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ContentEncodingList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 100
    .end local v2    # "cl":Landroid/gov/nist/javax/sip/header/ContentEncoding;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    goto :goto_0

    .line 102
    :cond_2
    nop

    .line 106
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->debug:Z

    if-eqz v2, :cond_3

    .line 107
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 106
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 103
    :catch_0
    move-exception v2

    .line 104
    .local v2, "ex":Ljava/text/ParseException;
    :try_start_1
    invoke-virtual {v2}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    .end local v0    # "list":Landroid/gov/nist/javax/sip/header/ContentEncodingList;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    .end local v2    # "ex":Ljava/text/ParseException;
    .restart local v0    # "list":Landroid/gov/nist/javax/sip/header/ContentEncodingList;
    :goto_2
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->debug:Z

    if-eqz v3, :cond_4

    .line 107
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentEncodingParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v2
.end method
