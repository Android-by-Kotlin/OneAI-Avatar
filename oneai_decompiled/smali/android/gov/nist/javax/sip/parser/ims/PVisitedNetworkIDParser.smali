.class public Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "PVisitedNetworkIDParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 72
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "networkID"    # Ljava/lang/String;

    .line 67
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 69
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 81
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;-><init>()V

    .line 83
    .local v0, "visitedNetworkIDList":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->debug:Z

    const-string/jumbo v2, "VisitedNetworkIDParser.parse"

    if-eqz v1, :cond_0

    .line 84
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->dbg_enter(Ljava/lang/String;)V

    .line 87
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x84b

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 88
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 89
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;-><init>()V

    .line 96
    .local v1, "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0x22

    if-ne v3, v5, :cond_1

    .line 97
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->parseQuotedString(Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;)V

    goto :goto_1

    .line 99
    :cond_1
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->parseToken(Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;)V

    .line 101
    :goto_1
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 103
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 104
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 105
    .local v3, "la":C
    const/16 v4, 0x2c

    if-ne v3, v4, :cond_2

    .line 106
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 107
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    .end local v1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .end local v3    # "la":C
    goto :goto_0

    .line 108
    .restart local v1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .restart local v3    # "la":C
    :cond_2
    const/16 v4, 0xa

    if-ne v3, v4, :cond_4

    .line 109
    nop

    .line 113
    .end local v1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .end local v3    # "la":C
    nop

    .line 115
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->debug:Z

    if-eqz v1, :cond_3

    .line 116
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 111
    .restart local v1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .restart local v3    # "la":C
    :cond_4
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "unexpected char = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "visitedNetworkIDList":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    .end local v1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .end local v3    # "la":C
    .restart local v0    # "visitedNetworkIDList":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkIDList;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->debug:Z

    if-eqz v3, :cond_5

    .line 116
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v1
.end method

.method protected parseQuotedString(Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;)V
    .locals 6
    .param p1, "visitedNetworkID"    # Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 123
    const-string/jumbo v0, "parseQuotedString.parse"

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->debug:Z

    if-eqz v1, :cond_0

    .line 124
    const-string/jumbo v1, "parseQuotedString"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->dbg_enter(Ljava/lang/String;)V

    .line 128
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .local v1, "retval":Ljava/lang/StringBuilder;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_5

    .line 132
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 135
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v2

    .line 136
    .local v2, "next":C
    if-ne v2, v3, :cond_2

    .line 138
    nop

    .line 150
    .end local v2    # "next":C
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->setVisitedNetworkID(Ljava/lang/String;)V

    .line 151
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    .end local v1    # "retval":Ljava/lang/StringBuilder;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->debug:Z

    if-eqz v1, :cond_1

    .line 157
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->dbg_leave(Ljava/lang/String;)V

    .line 160
    :cond_1
    return-void

    .line 139
    .restart local v1    # "retval":Ljava/lang/StringBuilder;
    .restart local v2    # "next":C
    :cond_2
    if-eqz v2, :cond_4

    .line 141
    const/16 v5, 0x5c

    if-ne v2, v5, :cond_3

    .line 142
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 143
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getNextChar()C

    move-result v5

    move v2, v5

    .line 144
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 146
    :cond_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 148
    .end local v2    # "next":C
    :goto_1
    goto :goto_0

    .line 140
    .restart local v2    # "next":C
    :cond_4
    new-instance v3, Ljava/text/ParseException;

    const-string/jumbo v5, "unexpected EOL"

    invoke-direct {v3, v5, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    throw v3

    .line 131
    .end local v2    # "next":C
    .restart local p1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    :cond_5
    const-string/jumbo v2, "unexpected char"

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    .end local p1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 156
    .end local v1    # "retval":Ljava/lang/StringBuilder;
    .restart local p1    # "visitedNetworkID":Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    :catchall_0
    move-exception v1

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->debug:Z

    if-eqz v2, :cond_6

    .line 157
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v1
.end method

.method protected parseToken(Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;)V
    .locals 2
    .param p1, "visitedNetworkID"    # Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 166
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0xfff

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 167
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PVisitedNetworkIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v0

    .line 169
    .local v0, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/header/ims/PVisitedNetworkID;->setVisitedNetworkID(Landroid/gov/nist/core/Token;)V

    .line 170
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 172
    return-void
.end method
