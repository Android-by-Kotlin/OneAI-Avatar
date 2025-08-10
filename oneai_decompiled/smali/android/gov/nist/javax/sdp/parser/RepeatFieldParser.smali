.class public Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "RepeatFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "repeatField"    # Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 47
    return-void
.end method


# virtual methods
.method public getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;
    .locals 4
    .param p1, "tokenValue"    # Ljava/lang/String;

    .line 55
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/TypedTime;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/TypedTime;-><init>()V

    .line 57
    .local v0, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    const-string/jumbo v1, "d"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const/16 v3, 0x20

    if-eqz v2, :cond_0

    .line 58
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 59
    const/16 v1, 0x64

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 62
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    :cond_0
    const-string/jumbo v1, "h"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 63
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 64
    const/16 v1, 0x68

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 65
    .restart local v1    # "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 66
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    :cond_1
    const-string/jumbo v1, "m"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 67
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 68
    const/16 v1, 0x6d

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 69
    .restart local v1    # "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 70
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    .line 71
    :cond_2
    const-string/jumbo v1, "s"

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setUnit(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 73
    const/16 v1, 0x73

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 74
    .restart local v1    # "t":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 75
    .end local v1    # "t":Ljava/lang/String;
    goto :goto_0

    .line 76
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/TypedTime;->setTime(I)V

    .line 78
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

    .line 126
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->repeatField()Landroid/gov/nist/javax/sdp/fields/RepeatField;

    move-result-object v0

    return-object v0
.end method

.method public repeatField()Landroid/gov/nist/javax/sdp/fields/RepeatField;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 87
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x72

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 88
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 89
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 92
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/RepeatField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/RepeatField;-><init>()V

    .line 94
    .local v0, "repeatField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xfff

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 95
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 96
    .local v1, "repeatInterval":Landroid/gov/nist/core/Token;
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 97
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;

    move-result-object v3

    .line 98
    .local v3, "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->setRepeatInterval(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V

    .line 100
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 101
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 102
    .local v4, "activeDuration":Landroid/gov/nist/core/Token;
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 103
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;

    move-result-object v5

    move-object v3, v5

    .line 104
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->setActiveDuration(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V

    .line 108
    :goto_0
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 109
    iget-object v5, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    .line 110
    .local v5, "la":C
    const/16 v6, 0xa

    if-eq v5, v6, :cond_1

    const/16 v6, 0xd

    if-ne v5, v6, :cond_0

    .line 111
    goto :goto_1

    .line 112
    :cond_0
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 113
    iget-object v6, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    .line 114
    .local v6, "offsets":Landroid/gov/nist/core/Token;
    iget-object v7, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 115
    invoke-virtual {v6}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->getTypedTime(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/TypedTime;

    move-result-object v7

    move-object v3, v7

    .line 116
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/RepeatField;->addOffset(Landroid/gov/nist/javax/sdp/fields/TypedTime;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .end local v5    # "la":C
    .end local v6    # "offsets":Landroid/gov/nist/core/Token;
    goto :goto_0

    .line 119
    :cond_1
    :goto_1
    return-object v0

    .line 120
    .end local v0    # "repeatField":Landroid/gov/nist/javax/sdp/fields/RepeatField;
    .end local v1    # "repeatInterval":Landroid/gov/nist/core/Token;
    .end local v3    # "typedTime":Landroid/gov/nist/javax/sdp/fields/TypedTime;
    .end local v4    # "activeDuration":Landroid/gov/nist/core/Token;
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/RepeatFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
