.class public Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "OriginFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "originField"    # Ljava/lang/String;

    .line 39
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 40
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 41
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 112
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "o=- 45ec4ba1.1 45ec4ba1 in ip4 10.1.80.200\r\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "o=- 4322650003578 0 IN IP4 192.53.18.122\r\n"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "o=4855 12345678901234567890 12345678901234567890 IN IP4 166.35.224.216\n"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "o=mh/andley 2890844526 2890842807 IN IP4 126.16.64.4\n"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "o=UserB 2890844527 2890844527 IN IP4 everywhere.com\n"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "o=UserA 2890844526 2890844526 IN IP4 here.com\n"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "o=IFAXTERMINAL01 2890844527 2890844527 IN IP4 ift.here.com\n"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "o=GATEWAY1 2890844527 2890844527 IN IP4 gatewayone.wcom.com\n"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "o=- 2890844527 2890844527 IN IP4 gatewayone.wcom.com\n"

    aput-object v2, v0, v1

    .line 123
    .local v0, "origin":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 124
    new-instance v2, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;-><init>(Ljava/lang/String;)V

    .line 126
    .local v2, "originFieldParser":Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->originField()Landroid/gov/nist/javax/sdp/fields/OriginField;

    move-result-object v3

    .line 127
    .local v3, "originField":Landroid/gov/nist/javax/sdp/fields/OriginField;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "toParse :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v0, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 128
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sdp/fields/OriginField;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 123
    .end local v2    # "originFieldParser":Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;
    .end local v3    # "originField":Landroid/gov/nist/javax/sdp/fields/OriginField;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 131
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public originField()Landroid/gov/nist/javax/sdp/fields/OriginField;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 45
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/OriginField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/OriginField;-><init>()V

    .line 47
    .local v0, "originField":Landroid/gov/nist/javax/sdp/fields/OriginField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x6f

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 48
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 49
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 50
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 52
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xffd

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 53
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 54
    .local v1, "userName":Landroid/gov/nist/core/Token;
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setUsername(Ljava/lang/String;)V

    .line 55
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 57
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 59
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 61
    .local v2, "sessionId":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 63
    .local v4, "sessId":Ljava/lang/String;
    const/16 v5, 0x12

    :try_start_1
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessId(J)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 68
    goto :goto_0

    .line 64
    :catch_0
    move-exception v6

    .line 65
    .local v6, "ex":Ljava/lang/NumberFormatException;
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v5, :cond_0

    .line 66
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v5

    invoke-virtual {v4, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    move-object v4, v7

    .line 67
    :cond_0
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessionId(Ljava/lang/String;)V

    .line 69
    .end local v6    # "ex":Ljava/lang/NumberFormatException;
    :goto_0
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 71
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 72
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    .line 74
    .local v6, "sessionVersion":Landroid/gov/nist/core/Token;
    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 76
    .local v7, "sessVer":Ljava/lang/String;
    :try_start_3
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessVersion(J)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 82
    goto :goto_1

    .line 77
    :catch_1
    move-exception v8

    .line 78
    .local v8, "ex":Ljava/lang/NumberFormatException;
    :try_start_4
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-le v9, v5, :cond_1

    .line 79
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v5

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    move-object v7, v5

    .line 80
    :cond_1
    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setSessVersion(Ljava/lang/String;)V

    .line 83
    .end local v8    # "ex":Ljava/lang/NumberFormatException;
    :goto_1
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 86
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v5

    .line 87
    .local v5, "networkType":Landroid/gov/nist/core/Token;
    invoke-virtual {v5}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setNettype(Ljava/lang/String;)V

    .line 88
    iget-object v8, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 90
    iget-object v8, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 91
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 92
    .local v3, "addressType":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddrtype(Ljava/lang/String;)V

    .line 93
    iget-object v8, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 95
    iget-object v8, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v8}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v8

    .line 96
    .local v8, "host":Ljava/lang/String;
    new-instance v9, Landroid/gov/nist/core/HostNameParser;

    invoke-direct {v9, v8}, Landroid/gov/nist/core/HostNameParser;-><init>(Ljava/lang/String;)V

    .line 97
    .local v9, "hostNameParser":Landroid/gov/nist/core/HostNameParser;
    invoke-virtual {v9}, Landroid/gov/nist/core/HostNameParser;->host()Landroid/gov/nist/core/Host;

    move-result-object v10

    .line 98
    .local v10, "h":Landroid/gov/nist/core/Host;
    invoke-virtual {v0, v10}, Landroid/gov/nist/javax/sdp/fields/OriginField;->setAddress(Landroid/gov/nist/core/Host;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 100
    return-object v0

    .line 101
    .end local v0    # "originField":Landroid/gov/nist/javax/sdp/fields/OriginField;
    .end local v1    # "userName":Landroid/gov/nist/core/Token;
    .end local v2    # "sessionId":Landroid/gov/nist/core/Token;
    .end local v3    # "addressType":Landroid/gov/nist/core/Token;
    .end local v4    # "sessId":Ljava/lang/String;
    .end local v5    # "networkType":Landroid/gov/nist/core/Token;
    .end local v6    # "sessionVersion":Landroid/gov/nist/core/Token;
    .end local v7    # "sessVer":Ljava/lang/String;
    .end local v8    # "host":Ljava/lang/String;
    .end local v9    # "hostNameParser":Landroid/gov/nist/core/HostNameParser;
    .end local v10    # "h":Landroid/gov/nist/core/Host;
    :catch_2
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 103
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 108
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/OriginFieldParser;->originField()Landroid/gov/nist/javax/sdp/fields/OriginField;

    move-result-object v0

    return-object v0
.end method
