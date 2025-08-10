.class public Landroid/gov/nist/javax/sip/parser/TimeStampParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "TimeStampParser.java"


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
    .param p1, "timeStamp"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->debug:Z

    const-string/jumbo v1, "TimeStampParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/TimeStamp;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/TimeStamp;-><init>()V

    .line 71
    .local v0, "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    const/16 v2, 0x837

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->headerName(I)V

    .line 73
    const-string/jumbo v2, "Timestamp"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setHeaderName(Ljava/lang/String;)V

    .line 75
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .local v2, "firstNumber":Ljava/lang/String;
    :try_start_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v5, "."

    const/16 v6, 0x2e

    if-ne v3, v6, :cond_1

    .line 81
    :try_start_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 82
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v3

    .line 84
    .local v3, "secondNumber":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 85
    .local v7, "s":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    .line 86
    .local v8, "ts":F
    invoke-virtual {v0, v8}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setTimeStamp(F)V

    .line 87
    .end local v3    # "secondNumber":Ljava/lang/String;
    .end local v7    # "s":Ljava/lang/String;
    .end local v8    # "ts":F
    goto :goto_0

    .line 88
    :cond_1
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    .line 89
    .local v7, "ts":J
    invoke-virtual {v0, v7, v8}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setTime(J)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    .end local v7    # "ts":J
    :goto_0
    nop

    .line 99
    :try_start_3
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 100
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v7, 0xa

    if-eq v3, v7, :cond_3

    .line 101
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v2, v3

    .line 105
    :try_start_4
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    if-ne v3, v6, :cond_2

    .line 106
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 107
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v3

    .line 109
    .restart local v3    # "secondNumber":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 110
    .local v4, "s":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    .line 111
    .local v5, "ts":F
    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setDelay(F)V

    .line 112
    .end local v3    # "secondNumber":Ljava/lang/String;
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "ts":F
    goto :goto_1

    .line 113
    :cond_2
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 114
    .local v3, "ts":I
    int-to-float v4, v3

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/header/TimeStamp;->setDelay(F)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 122
    .end local v3    # "ts":I
    :goto_1
    goto :goto_2

    .line 120
    :catch_0
    move-exception v3

    .line 121
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_5
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    throw v4

    .line 118
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :catch_1
    move-exception v3

    .line 119
    .local v3, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 126
    .end local v2    # "firstNumber":Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :cond_3
    :goto_2
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->debug:Z

    if-eqz v2, :cond_4

    .line 127
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->dbg_leave(Ljava/lang/String;)V

    .line 130
    :cond_4
    return-object v0

    .line 95
    .restart local v2    # "firstNumber":Ljava/lang/String;
    :catch_2
    move-exception v3

    .line 96
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_6
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    throw v4

    .line 93
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :catch_3
    move-exception v3

    .line 94
    .local v3, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v3}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 126
    .end local v2    # "firstNumber":Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "timeStamp":Landroid/gov/nist/javax/sip/header/TimeStamp;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->debug:Z

    if-eqz v3, :cond_5

    .line 127
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/TimeStampParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v2
.end method
