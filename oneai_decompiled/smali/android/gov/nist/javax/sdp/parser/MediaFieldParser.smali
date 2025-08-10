.class public Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "MediaFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "mediaField"    # Ljava/lang/String;

    .line 46
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 47
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 48
    return-void
.end method


# virtual methods
.method public mediaField()Landroid/gov/nist/javax/sdp/fields/MediaField;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 51
    sget-boolean v0, Landroid/gov/nist/core/Debug;->parserDebug:Z

    const-string/jumbo v1, "mediaField"

    if-eqz v0, :cond_0

    .line 52
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->dbg_enter(Ljava/lang/String;)V

    .line 54
    :cond_0
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/MediaField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/MediaField;-><init>()V

    .line 56
    .local v0, "mediaField":Landroid/gov/nist/javax/sdp/fields/MediaField;
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x6d

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 57
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 58
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 59
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 61
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 62
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 63
    .local v2, "media":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setMedia(Ljava/lang/String;)V

    .line 64
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 66
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 67
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 68
    .local v4, "port":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setPort(I)V

    .line 70
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 74
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v5

    const/16 v6, 0xa

    const/4 v7, 0x1

    if-eqz v5, :cond_1

    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v7}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v5, v6, :cond_1

    .line 75
    nop

    .line 123
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->dbg_leave(Ljava/lang/String;)V

    return-object v0

    .line 77
    :cond_1
    :try_start_1
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v8, 0x0

    invoke-virtual {v5, v8}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    const/16 v9, 0x2f

    if-ne v5, v9, :cond_2

    .line 79
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v7}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 80
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 81
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v5

    .line 82
    .local v5, "portsNumber":Landroid/gov/nist/core/Token;
    invoke-virtual {v5}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v0, v10}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setNports(I)V

    .line 84
    iget-object v10, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    .end local v5    # "portsNumber":Landroid/gov/nist/core/Token;
    :cond_2
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 88
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v5

    .line 89
    .local v5, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v5}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v10

    .line 90
    .local v10, "transport":Ljava/lang/String;
    :goto_0
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11, v8}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v11

    if-ne v11, v9, :cond_3

    .line 91
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11, v7}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 92
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 93
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v11

    .line 94
    .local v11, "transportTemp":Landroid/gov/nist/core/Token;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v11}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    move-object v10, v12

    .line 95
    .end local v11    # "transportTemp":Landroid/gov/nist/core/Token;
    goto :goto_0

    .line 96
    :cond_3
    invoke-virtual {v0, v10}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setProto(Ljava/lang/String;)V

    .line 97
    iget-object v7, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 100
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 101
    .local v7, "formatList":Ljava/util/Vector;
    :goto_1
    iget-object v9, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 102
    iget-object v9, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v9, v8}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v9

    .line 103
    .local v9, "la":C
    if-eq v9, v6, :cond_6

    const/16 v11, 0xd

    if-ne v9, v11, :cond_4

    .line 104
    goto :goto_2

    .line 105
    :cond_4
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 107
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 108
    iget-object v11, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v11}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v11

    .line 109
    .local v11, "tok":Landroid/gov/nist/core/Token;
    iget-object v12, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v12}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 110
    invoke-virtual {v11}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 111
    .local v12, "format":Ljava/lang/String;
    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 112
    invoke-virtual {v7, v12}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 113
    .end local v9    # "la":C
    .end local v11    # "tok":Landroid/gov/nist/core/Token;
    .end local v12    # "format":Ljava/lang/String;
    :cond_5
    goto :goto_1

    .line 114
    :cond_6
    :goto_2
    invoke-virtual {v0, v7}, Landroid/gov/nist/javax/sdp/fields/MediaField;->setFormats(Ljava/util/Vector;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    nop

    .line 123
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->dbg_leave(Ljava/lang/String;)V

    return-object v0

    .end local v0    # "mediaField":Landroid/gov/nist/javax/sdp/fields/MediaField;
    .end local v2    # "media":Landroid/gov/nist/core/Token;
    .end local v4    # "port":Landroid/gov/nist/core/Token;
    .end local v5    # "token":Landroid/gov/nist/core/Token;
    .end local v7    # "formatList":Ljava/util/Vector;
    .end local v10    # "transport":Ljava/lang/String;
    :catchall_0
    move-exception v0

    goto :goto_3

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 121
    new-instance v2, Ljava/text/ParseException;

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v4

    invoke-direct {v2, v3, v4}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 123
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->dbg_leave(Ljava/lang/String;)V

    throw v0
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/MediaFieldParser;->mediaField()Landroid/gov/nist/javax/sdp/fields/MediaField;

    move-result-object v0

    return-object v0
.end method
