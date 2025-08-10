.class public Landroid/gov/nist/javax/sip/parser/InReplyToParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "InReplyToParser.java"


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
    .param p1, "inReplyTo"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->debug:Z

    const-string v1, "InReplyToParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/InReplyToList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/InReplyToList;-><init>()V

    .line 72
    .local v0, "list":Landroid/gov/nist/javax/sip/header/InReplyToList;
    const/16 v2, 0x80b

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->headerName(I)V

    .line 74
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_4

    .line 75
    new-instance v2, Landroid/gov/nist/javax/sip/header/InReplyTo;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/InReplyTo;-><init>()V

    .line 76
    .local v2, "inReplyTo":Landroid/gov/nist/javax/sip/header/InReplyTo;
    const-string v4, "In-Reply-To"

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/header/InReplyTo;->setHeaderName(Ljava/lang/String;)V

    .line 78
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 79
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 80
    .local v4, "token":Landroid/gov/nist/core/Token;
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v7, "@"

    const/16 v8, 0xffe

    const/16 v9, 0x40

    if-ne v6, v9, :cond_1

    .line 81
    :try_start_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v9}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 82
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v8}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 83
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    .line 84
    .local v6, "secToken":Landroid/gov/nist/core/Token;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/gov/nist/javax/sip/header/InReplyTo;->setCallId(Ljava/lang/String;)V

    .line 86
    .end local v6    # "secToken":Landroid/gov/nist/core/Token;
    goto :goto_1

    .line 87
    :cond_1
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/InReplyTo;->setCallId(Ljava/lang/String;)V

    .line 90
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 92
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/InReplyToList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 94
    :goto_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v10, 0x2c

    if-ne v6, v10, :cond_3

    .line 95
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v10}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 96
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 98
    new-instance v6, Landroid/gov/nist/javax/sip/header/InReplyTo;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/InReplyTo;-><init>()V

    move-object v2, v6

    .line 100
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 101
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v4, v6

    .line 102
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    if-ne v6, v9, :cond_2

    .line 103
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v9}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 104
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v8}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 105
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    .line 106
    .restart local v6    # "secToken":Landroid/gov/nist/core/Token;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/gov/nist/javax/sip/header/InReplyTo;->setCallId(Ljava/lang/String;)V

    .line 110
    .end local v6    # "secToken":Landroid/gov/nist/core/Token;
    goto :goto_3

    .line 111
    :cond_2
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/InReplyTo;->setCallId(Ljava/lang/String;)V

    .line 114
    :goto_3
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/InReplyToList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 116
    .end local v2    # "inReplyTo":Landroid/gov/nist/javax/sip/header/InReplyTo;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    :cond_3
    goto/16 :goto_0

    .line 118
    :cond_4
    nop

    .line 120
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->debug:Z

    if-eqz v2, :cond_5

    .line 121
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    return-object v0

    .line 120
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->debug:Z

    if-eqz v3, :cond_6

    .line 121
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/InReplyToParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v2
.end method
