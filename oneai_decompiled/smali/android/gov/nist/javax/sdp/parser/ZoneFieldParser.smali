.class public Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "ZoneFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "zoneField"    # Ljava/lang/String;

    .line 46
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 47
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 48
    return-void
.end method


# virtual methods
.method public getSign(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "tokenValue"    # Ljava/lang/String;

    .line 58
    const-string v0, "-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    return-object v0

    .line 61
    :cond_0
    const-string v0, "+"

    return-object v0
.end method

.method public getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;
    .locals 5
    .param p1, "tokenValue"    # Ljava/lang/String;

    .line 72
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;-><init>()V

    .line 73
    .local v0, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    const/4 v1, 0x0

    .line 74
    .local v1, "offset":Ljava/lang/String;
    const-string v2, "-"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/16 v3, 0x20

    if-eqz v2, :cond_0

    .line 75
    const/16 v2, 0x2d

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 76
    :cond_0
    const-string v2, "+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 77
    const/16 v2, 0x2b

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 79
    :cond_1
    move-object v1, p1

    .line 81
    :goto_0
    const-string/jumbo v2, "d"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 82
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 83
    const/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "t":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 86
    .end local v2    # "t":Ljava/lang/String;
    goto :goto_1

    :cond_2
    const-string/jumbo v2, "h"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 87
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 88
    const/16 v2, 0x68

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 89
    .restart local v2    # "t":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 90
    .end local v2    # "t":Ljava/lang/String;
    goto :goto_1

    :cond_3
    const-string/jumbo v2, "m"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 91
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 92
    const/16 v2, 0x6d

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 93
    .restart local v2    # "t":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 94
    .end local v2    # "t":Ljava/lang/String;
    goto :goto_1

    .line 95
    :cond_4
    const-string/jumbo v2, "s"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 97
    const/16 v2, 0x73

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 98
    .restart local v2    # "t":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 99
    .end local v2    # "t":Ljava/lang/String;
    goto :goto_1

    .line 100
    :cond_5
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 102
    :goto_1
    return-object v0
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 154
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->zoneField()Landroid/gov/nist/javax/sdp/fields/ZoneField;

    move-result-object v0

    return-object v0
.end method

.method public zoneField()Landroid/gov/nist/javax/sdp/fields/ZoneField;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 112
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ZoneField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ZoneField;-><init>()V

    .line 114
    .local v0, "zoneField":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x7a

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 115
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 116
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 117
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 121
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 122
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 123
    .local v1, "la":C
    const/16 v2, 0xa

    if-eq v1, v2, :cond_2

    const/16 v2, 0xd

    if-ne v1, v2, :cond_0

    .line 124
    goto :goto_1

    .line 125
    :cond_0
    new-instance v2, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;

    invoke-direct {v2}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;-><init>()V

    .line 127
    .local v2, "zoneAdjustment":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xfff

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 128
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 129
    .local v3, "time":Landroid/gov/nist/core/Token;
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 130
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    .line 131
    .local v5, "timeValue":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x12

    if-le v6, v7, :cond_1

    .line 132
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    .line 134
    :cond_1
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->setTime(J)V

    .line 136
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 137
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 138
    .local v4, "offset":Landroid/gov/nist/core/Token;
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 139
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->getSign(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 140
    .local v6, "sign":Ljava/lang/String;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;

    move-result-object v7

    .line 141
    .local v7, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->setSign(Ljava/lang/String;)V

    .line 142
    invoke-virtual {v2, v7}, Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;->setOffset(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V

    .line 144
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/ZoneField;->addZoneAdjustment(Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .end local v1    # "la":C
    .end local v2    # "zoneAdjustment":Landroid/gov/nist/javax/sdp/fields/ZoneAdjustment;
    .end local v3    # "time":Landroid/gov/nist/core/Token;
    .end local v4    # "offset":Landroid/gov/nist/core/Token;
    .end local v5    # "timeValue":Ljava/lang/String;
    .end local v6    # "sign":Ljava/lang/String;
    .end local v7    # "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    goto :goto_0

    .line 147
    :cond_2
    :goto_1
    return-object v0

    .line 148
    .end local v0    # "zoneField":Landroid/gov/nist/javax/sdp/fields/ZoneField;
    :catch_0
    move-exception v0

    .line 149
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ZoneFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
