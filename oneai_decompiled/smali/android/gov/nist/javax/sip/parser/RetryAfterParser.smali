.class public Landroid/gov/nist/javax/sip/parser/RetryAfterParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "RetryAfterParser.java"


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
    .param p1, "retryAfter"    # Ljava/lang/String;

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
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->debug:Z

    const-string/jumbo v1, "RetryAfterParser.parse"

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->dbg_enter(Ljava/lang/String;)V

    .line 72
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/RetryAfter;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RetryAfter;-><init>()V

    .line 74
    .local v0, "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    const/16 v2, 0x819

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->headerName(I)V

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    .local v2, "value":Ljava/lang/String;
    :try_start_1
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 80
    .local v3, "ds":I
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setRetryAfter(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    .end local v3    # "ds":I
    nop

    .line 87
    :try_start_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 88
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0x28

    if-ne v3, v5, :cond_1

    .line 89
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->comment()Ljava/lang/String;

    move-result-object v3

    .line 90
    .local v3, "comment":Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setComment(Ljava/lang/String;)V

    .line 92
    .end local v3    # "comment":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0x3b

    if-ne v3, v5, :cond_3

    .line 95
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 96
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 97
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 98
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 99
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    move-object v2, v6

    .line 100
    const-string/jumbo v6, "duration"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    const/16 v7, 0x3d

    if-eqz v6, :cond_2

    .line 101
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 102
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 103
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v2, v5

    .line 105
    :try_start_3
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 106
    .local v5, "duration":I
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setDuration(I)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    .end local v5    # "duration":I
    goto :goto_1

    .line 109
    :catch_0
    move-exception v4

    .line 110
    .local v4, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_4
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    throw v5

    .line 107
    .end local v4    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    :catch_1
    move-exception v4

    .line 108
    .local v4, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    throw v5

    .line 113
    .end local v4    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    :cond_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 114
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 115
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 116
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 117
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v5

    .line 118
    .local v5, "secondToken":Landroid/gov/nist/core/Token;
    invoke-virtual {v5}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    .line 119
    .local v6, "secondValue":Ljava/lang/String;
    invoke-virtual {v0, v2, v6}, Landroid/gov/nist/javax/sip/header/RetryAfter;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .end local v5    # "secondToken":Landroid/gov/nist/core/Token;
    .end local v6    # "secondValue":Ljava/lang/String;
    :goto_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 122
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    goto/16 :goto_0

    .line 124
    .end local v2    # "value":Ljava/lang/String;
    :cond_3
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->debug:Z

    if-eqz v2, :cond_4

    .line 125
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->dbg_leave(Ljava/lang/String;)V

    .line 128
    :cond_4
    return-object v0

    .line 83
    .restart local v2    # "value":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 84
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_5
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    throw v4

    .line 81
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    :catch_3
    move-exception v3

    .line 82
    .local v3, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 124
    .end local v2    # "value":Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "retryAfter":Landroid/gov/nist/javax/sip/header/RetryAfter;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->debug:Z

    if-eqz v3, :cond_5

    .line 125
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/RetryAfterParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v2
.end method
