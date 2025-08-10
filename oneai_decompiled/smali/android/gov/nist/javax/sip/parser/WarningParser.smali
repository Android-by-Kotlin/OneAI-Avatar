.class public Landroid/gov/nist/javax/sip/parser/WarningParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "WarningParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 64
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "warning"    # Ljava/lang/String;

    .line 54
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 75
    new-instance v0, Landroid/gov/nist/javax/sip/header/WarningList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/WarningList;-><init>()V

    .line 76
    .local v0, "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/WarningParser;->debug:Z

    const-string/jumbo v2, "WarningParser.parse"

    if-eqz v1, :cond_0

    .line 77
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/WarningParser;->dbg_enter(Ljava/lang/String;)V

    .line 80
    :cond_0
    const/16 v1, 0x81e

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/WarningParser;->headerName(I)V

    .line 82
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v4, 0xa

    if-eq v1, v4, :cond_4

    .line 83
    new-instance v1, Landroid/gov/nist/javax/sip/header/Warning;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Warning;-><init>()V

    .line 84
    .local v1, "warning":Landroid/gov/nist/javax/sip/header/Warning;
    const-string/jumbo v4, "Warning"

    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/header/Warning;->setHeaderName(Ljava/lang/String;)V

    .line 87
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 88
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .local v4, "token":Landroid/gov/nist/core/Token;
    :try_start_1
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 91
    .local v6, "code":I
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Warning;->setCode(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    .end local v6    # "code":I
    nop

    .line 97
    :try_start_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 100
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 101
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v4, v6

    .line 103
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v7, ":"

    const/16 v8, 0x3a

    if-ne v6, v8, :cond_1

    .line 104
    :try_start_3
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v8}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 105
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 106
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    .line 107
    .local v6, "token2":Landroid/gov/nist/core/Token;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/gov/nist/javax/sip/header/Warning;->setAgent(Ljava/lang/String;)V

    .line 109
    .end local v6    # "token2":Landroid/gov/nist/core/Token;
    goto :goto_1

    .line 110
    :cond_1
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Warning;->setAgent(Ljava/lang/String;)V

    .line 113
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 116
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->quotedString()Ljava/lang/String;

    move-result-object v6

    .line 117
    .local v6, "text":Ljava/lang/String;
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Warning;->setText(Ljava/lang/String;)V

    .line 118
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 120
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/WarningList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 122
    :goto_2
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v9

    const/16 v10, 0x2c

    if-ne v9, v10, :cond_3

    .line 123
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v10}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 124
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 126
    new-instance v9, Landroid/gov/nist/javax/sip/header/Warning;

    invoke-direct {v9}, Landroid/gov/nist/javax/sip/header/Warning;-><init>()V

    move-object v1, v9

    .line 129
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 130
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 132
    .local v9, "tok":Landroid/gov/nist/core/Token;
    :try_start_4
    invoke-virtual {v9}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 133
    .local v10, "code":I
    invoke-virtual {v1, v10}, Landroid/gov/nist/javax/sip/header/Warning;->setCode(I)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 138
    .end local v10    # "code":I
    nop

    .line 139
    :try_start_5
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 142
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 143
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v10

    move-object v9, v10

    .line 147
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v10

    if-ne v10, v8, :cond_2

    .line 148
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10, v8}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 149
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 150
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v10

    .line 151
    .local v10, "token2":Landroid/gov/nist/core/Token;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v10}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v11}, Landroid/gov/nist/javax/sip/header/Warning;->setAgent(Ljava/lang/String;)V

    .line 153
    .end local v10    # "token2":Landroid/gov/nist/core/Token;
    goto :goto_3

    .line 154
    :cond_2
    invoke-virtual {v9}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/gov/nist/javax/sip/header/Warning;->setAgent(Ljava/lang/String;)V

    .line 157
    :goto_3
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 160
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->quotedString()Ljava/lang/String;

    move-result-object v10

    move-object v6, v10

    .line 161
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Warning;->setText(Ljava/lang/String;)V

    .line 162
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/WarningParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 164
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/WarningList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 165
    nop

    .end local v9    # "tok":Landroid/gov/nist/core/Token;
    goto/16 :goto_2

    .line 136
    .restart local v9    # "tok":Landroid/gov/nist/core/Token;
    :catch_0
    move-exception v3

    .line 137
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/WarningParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    throw v5

    .line 134
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    :catch_1
    move-exception v3

    .line 135
    .local v3, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/WarningParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    throw v5

    .line 167
    .end local v1    # "warning":Landroid/gov/nist/javax/sip/header/Warning;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    .end local v6    # "text":Ljava/lang/String;
    .end local v9    # "tok":Landroid/gov/nist/core/Token;
    .restart local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    :cond_3
    goto/16 :goto_0

    .line 94
    .restart local v1    # "warning":Landroid/gov/nist/javax/sip/header/Warning;
    .restart local v4    # "token":Landroid/gov/nist/core/Token;
    :catch_2
    move-exception v3

    .line 95
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/WarningParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    throw v5

    .line 92
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    :catch_3
    move-exception v3

    .line 93
    .local v3, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/WarningParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 169
    .end local v1    # "warning":Landroid/gov/nist/javax/sip/header/Warning;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    .restart local v0    # "warningList":Landroid/gov/nist/javax/sip/header/WarningList;
    :cond_4
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/WarningParser;->debug:Z

    if-eqz v1, :cond_5

    .line 170
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/WarningParser;->dbg_leave(Ljava/lang/String;)V

    .line 173
    :cond_5
    return-object v0

    .line 169
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/WarningParser;->debug:Z

    if-eqz v3, :cond_6

    .line 170
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/WarningParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v1
.end method
