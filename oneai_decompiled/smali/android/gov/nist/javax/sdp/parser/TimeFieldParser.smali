.class public Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "TimeFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "timeField"    # Ljava/lang/String;

    .line 43
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 44
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 45
    return-void
.end method

.method private getTime()J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 81
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "startTime":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x12

    if-le v1, v2, :cond_0

    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    move-object v0, v1

    .line 84
    :cond_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v1

    .line 85
    .end local v0    # "startTime":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 86
    .local v0, "ex":Ljava/lang/NumberFormatException;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;
    .locals 4
    .param p1, "tokenValue"    # Ljava/lang/String;

    .line 53
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;-><init>()V

    .line 55
    .local v0, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    const-string/jumbo v1, "d"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const/16 v3, 0x20

    if-eqz v2, :cond_0

    .line 56
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 57
    const/16 v1, 0x64

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 60
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    :cond_0
    const-string/jumbo v1, "h"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 61
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 62
    const/16 v1, 0x68

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 63
    .restart local v1    # "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 64
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    :cond_1
    const-string/jumbo v1, "m"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 65
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 66
    const/16 v1, 0x6d

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 67
    .restart local v1    # "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 68
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    .line 69
    :cond_2
    const-string/jumbo v1, "s"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 71
    const/16 v1, 0x73

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 72
    .restart local v1    # "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 73
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    .line 74
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 76
    :goto_0
    return-object v0
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 117
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->timeField()Landroid/gov/nist/javax/sdp/fields/TimeField;

    move-result-object v0

    return-object v0
.end method

.method public timeField()Landroid/gov/nist/javax/sdp/fields/TimeField;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 96
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x74

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 97
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 98
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 99
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 101
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TimeField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TimeField;-><init>()V

    .line 103
    .local v0, "timeField":Landroid/gov/nist/javax/sdp/fields/TimeField;
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->getTime()J

    move-result-wide v1

    .line 104
    .local v1, "st":J
    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStartTime(J)V

    .line 105
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 107
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->getTime()J

    move-result-wide v3

    move-wide v1, v3

    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/gov/nist/javax/sdp/fields/TimeField;->setStopTime(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    return-object v0

    .line 111
    .end local v0    # "timeField":Landroid/gov/nist/javax/sdp/fields/TimeField;
    .end local v1    # "st":J
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/TimeFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
