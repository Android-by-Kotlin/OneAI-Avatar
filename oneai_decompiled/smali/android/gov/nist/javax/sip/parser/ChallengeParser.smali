.class public abstract Landroid/gov/nist/javax/sip/parser/ChallengeParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ChallengeParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 58
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 59
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "challenge"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 51
    return-void
.end method


# virtual methods
.method public parse(Landroid/gov/nist/javax/sip/header/AuthenticationHeader;)V
    .locals 4
    .param p1, "header"    # Landroid/gov/nist/javax/sip/header/AuthenticationHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 89
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0xfff

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v0

    .line 91
    .local v0, "type":Landroid/gov/nist/core/Token;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 92
    invoke-virtual {v0}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setScheme(Ljava/lang/String;)V

    .line 96
    :goto_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v3, 0xa

    if-eq v1, v3, :cond_1

    .line 97
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->parseParameter(Landroid/gov/nist/javax/sip/header/AuthenticationHeader;)V

    .line 98
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 99
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 100
    .local v1, "la":C
    if-eq v1, v3, :cond_1

    if-nez v1, :cond_0

    .line 101
    goto :goto_1

    .line 102
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 103
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .end local v1    # "la":C
    goto :goto_0

    .line 107
    :cond_1
    :goto_1
    nop

    .line 108
    return-void

    .line 105
    :catch_0
    move-exception v1

    .line 106
    .local v1, "ex":Ljava/text/ParseException;
    throw v1
.end method

.method protected parseParameter(Landroid/gov/nist/javax/sip/header/AuthenticationHeader;)V
    .locals 3
    .param p1, "header"    # Landroid/gov/nist/javax/sip/header/AuthenticationHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 68
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->debug:Z

    const-string/jumbo v1, "parseParameter"

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    const/16 v0, 0x3d

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 72
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/header/AuthenticationHeader;->setParameter(Landroid/gov/nist/core/NameValue;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->debug:Z

    if-eqz v0, :cond_1

    .line 75
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->dbg_leave(Ljava/lang/String;)V

    .line 78
    :cond_1
    return-void

    .line 74
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->debug:Z

    if-eqz v2, :cond_2

    .line 75
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
