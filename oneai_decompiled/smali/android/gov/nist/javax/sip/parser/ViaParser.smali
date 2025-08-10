.class public Landroid/gov/nist/javax/sip/parser/ViaParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ViaParser.java"


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "via"    # Ljava/lang/String;

    .line 44
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method private parseVia(Landroid/gov/nist/javax/sip/header/Via;)V
    .locals 12
    .param p1, "v"    # Landroid/gov/nist/javax/sip/header/Via;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 56
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0xfff

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 57
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v0

    .line 59
    .local v0, "protocolName":Landroid/gov/nist/core/Token;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 61
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 62
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 63
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 64
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 65
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 67
    .local v2, "protocolVersion":Landroid/gov/nist/core/Token;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 70
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 71
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 72
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 73
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 75
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 76
    .local v1, "transport":Landroid/gov/nist/core/Token;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    new-instance v3, Landroid/gov/nist/javax/sip/header/Protocol;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/Protocol;-><init>()V

    .line 79
    .local v3, "protocol":Landroid/gov/nist/javax/sip/header/Protocol;
    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/Protocol;->setProtocolName(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/Protocol;->setProtocolVersion(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/gov/nist/javax/sip/header/Protocol;->setTransport(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p1, v3}, Landroid/gov/nist/javax/sip/header/Via;->setSentProtocol(Landroid/gov/nist/javax/sip/header/Protocol;)V

    .line 85
    new-instance v4, Landroid/gov/nist/core/HostNameParser;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/ViaParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/gov/nist/core/HostNameParser;-><init>(Landroid/gov/nist/core/LexerCore;)V

    .line 86
    .local v4, "hnp":Landroid/gov/nist/core/HostNameParser;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/HostNameParser;->hostPort(Z)Landroid/gov/nist/core/HostPort;

    move-result-object v6

    .line 87
    .local v6, "hostPort":Landroid/gov/nist/core/HostPort;
    invoke-virtual {p1, v6}, Landroid/gov/nist/javax/sip/header/Via;->setSentBy(Landroid/gov/nist/core/HostPort;)V

    .line 90
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 93
    :goto_0
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v7

    const/16 v9, 0x3b

    if-ne v7, v9, :cond_2

    .line 94
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 95
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 96
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/ViaParser;->nameValue()Landroid/gov/nist/core/NameValue;

    move-result-object v7

    .line 97
    .local v7, "nameValue":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v7}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v8

    .line 98
    .local v8, "name":Ljava/lang/String;
    const-string/jumbo v9, "branch"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 99
    invoke-virtual {v7}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 100
    .local v9, "branchId":Ljava/lang/String;
    if-eqz v9, :cond_0

    goto :goto_1

    .line 101
    :cond_0
    new-instance v5, Ljava/text/ParseException;

    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v10

    const-string/jumbo v11, "null branch Id"

    invoke-direct {v5, v11, v10}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 104
    .end local v9    # "branchId":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-virtual {p1, v7}, Landroid/gov/nist/javax/sip/header/Via;->setParameter(Landroid/gov/nist/core/NameValue;)V

    .line 105
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 106
    .end local v7    # "nameValue":Landroid/gov/nist/core/NameValue;
    .end local v8    # "name":Ljava/lang/String;
    goto :goto_0

    .line 111
    :cond_2
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v8}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v7

    const/16 v9, 0x28

    if-ne v7, v9, :cond_6

    .line 112
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v9, "charLexer"

    invoke-virtual {v7, v9}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 113
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 114
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .local v7, "comment":Ljava/lang/StringBuilder;
    :goto_2
    iget-object v9, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v8}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v9

    .line 117
    .local v9, "ch":C
    const/16 v10, 0x29

    if-ne v9, v10, :cond_3

    .line 118
    iget-object v8, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 119
    goto :goto_3

    .line 120
    :cond_3
    const/16 v10, 0x5c

    if-ne v9, v10, :cond_4

    .line 122
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v10

    .line 123
    .local v10, "tok":Landroid/gov/nist/core/Token;
    invoke-virtual {v10}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    iget-object v11, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 125
    iget-object v11, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v10

    .line 126
    invoke-virtual {v10}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    iget-object v11, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 128
    .end local v10    # "tok":Landroid/gov/nist/core/Token;
    goto :goto_4

    :cond_4
    const/16 v10, 0xa

    if-ne v9, v10, :cond_5

    .line 129
    nop

    .line 135
    .end local v9    # "ch":C
    :goto_3
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/gov/nist/javax/sip/header/Via;->setComment(Ljava/lang/String;)V

    goto :goto_5

    .line 131
    .restart local v9    # "ch":C
    :cond_5
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    iget-object v10, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 134
    .end local v9    # "ch":C
    :goto_4
    goto :goto_2

    .line 138
    .end local v7    # "comment":Ljava/lang/StringBuilder;
    :cond_6
    :goto_5
    return-void
.end method


# virtual methods
.method protected nameValue()Landroid/gov/nist/core/NameValue;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 145
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    const-string/jumbo v1, "nameValue"

    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_enter(Ljava/lang/String;)V

    .line 149
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xfff

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 150
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v0

    .line 152
    .local v0, "name":Landroid/gov/nist/core/Token;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    const/4 v3, 0x0

    .line 157
    .local v3, "quoted":Z
    const/4 v4, 0x0

    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    .line 159
    .local v5, "la":C
    const/16 v7, 0x3d

    if-ne v5, v7, :cond_5

    .line 160
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 161
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 162
    const/4 v7, 0x0

    .line 163
    .local v7, "str":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "received"

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_1

    .line 166
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->byteStringNoSemicolon()Ljava/lang/String;

    move-result-object v2

    .end local v7    # "str":Ljava/lang/String;
    .local v2, "str":Ljava/lang/String;
    goto :goto_0

    .line 168
    .end local v2    # "str":Ljava/lang/String;
    .restart local v7    # "str":Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v8, 0x22

    if-ne v6, v8, :cond_2

    .line 169
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->quotedString()Ljava/lang/String;

    move-result-object v2

    .line 170
    .end local v7    # "str":Ljava/lang/String;
    .restart local v2    # "str":Ljava/lang/String;
    const/4 v3, 0x1

    goto :goto_0

    .line 172
    .end local v2    # "str":Ljava/lang/String;
    .restart local v7    # "str":Ljava/lang/String;
    :cond_2
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 173
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 174
    .local v2, "value":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    move-object v2, v6

    .line 177
    .end local v7    # "str":Ljava/lang/String;
    .local v2, "str":Ljava/lang/String;
    :goto_0
    new-instance v6, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 179
    .local v6, "nv":Landroid/gov/nist/core/NameValue;
    if-eqz v3, :cond_3

    .line 180
    invoke-virtual {v6}, Landroid/gov/nist/core/NameValue;->setQuotedValue()V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    :cond_3
    nop

    .line 191
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    if-eqz v4, :cond_4

    .line 192
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v6

    .line 183
    .end local v2    # "str":Ljava/lang/String;
    .end local v6    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_5
    :try_start_2
    new-instance v2, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6, v4}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    if-eqz v4, :cond_6

    .line 192
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    return-object v2

    .line 186
    .end local v3    # "quoted":Z
    .end local v5    # "la":C
    :catch_0
    move-exception v2

    .line 187
    .local v2, "ex":Ljava/text/ParseException;
    :try_start_3
    new-instance v3, Landroid/gov/nist/core/NameValue;

    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v4}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 191
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    if-eqz v4, :cond_7

    .line 192
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_leave(Ljava/lang/String;)V

    :cond_7
    return-object v3

    .line 191
    .end local v0    # "name":Landroid/gov/nist/core/Token;
    .end local v2    # "ex":Ljava/text/ParseException;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    if-eqz v2, :cond_8

    .line 192
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_leave(Ljava/lang/String;)V

    :cond_8
    throw v0
.end method

.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 198
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    const-string/jumbo v1, "parse"

    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_enter(Ljava/lang/String;)V

    .line 201
    :cond_0
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ViaList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ViaList;-><init>()V

    .line 203
    .local v0, "viaList":Landroid/gov/nist/javax/sip/header/ViaList;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x810

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 204
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 205
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 206
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 209
    :goto_0
    new-instance v2, Landroid/gov/nist/javax/sip/header/Via;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/Via;-><init>()V

    .line 210
    .local v2, "v":Landroid/gov/nist/javax/sip/header/Via;
    invoke-direct {p0, v2}, Landroid/gov/nist/javax/sip/parser/ViaParser;->parseVia(Landroid/gov/nist/javax/sip/header/Via;)V

    .line 211
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ViaList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 212
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 213
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0x2c

    if-ne v3, v5, :cond_1

    .line 214
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 215
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 217
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_3

    .line 218
    nop

    .line 220
    .end local v2    # "v":Landroid/gov/nist/javax/sip/header/Via;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ViaParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 221
    nop

    .line 223
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    if-eqz v2, :cond_2

    .line 224
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 219
    :cond_3
    goto :goto_0

    .line 223
    .end local v0    # "viaList":Landroid/gov/nist/javax/sip/header/ViaList;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ViaParser;->debug:Z

    if-eqz v2, :cond_4

    .line 224
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ViaParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v0
.end method
