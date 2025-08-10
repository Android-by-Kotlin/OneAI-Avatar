.class public Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "PrivacyParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 71
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "privacyType"    # Ljava/lang/String;

    .line 66
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 67
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

    .line 127
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "Privacy: none\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Privacy: none;id;user\n"

    aput-object v2, v0, v1

    .line 133
    .local v0, "rou":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 134
    new-instance v2, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;-><init>(Ljava/lang/String;)V

    .line 136
    .local v2, "rp":Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;

    .line 137
    .local v3, "list":Landroid/gov/nist/javax/sip/header/ims/PrivacyList;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 133
    .end local v2    # "rp":Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;
    .end local v3    # "list":Landroid/gov/nist/javax/sip/header/ims/PrivacyList;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 139
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 77
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->debug:Z

    const-string/jumbo v1, "PrivacyParser.parse"

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->dbg_enter(Ljava/lang/String;)V

    .line 80
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;-><init>()V

    .line 84
    .local v0, "privacyList":Landroid/gov/nist/javax/sip/header/ims/PrivacyList;
    const/16 v2, 0x84e

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->headerName(I)V

    .line 86
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    .line 87
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 89
    new-instance v2, Landroid/gov/nist/javax/sip/header/ims/Privacy;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/ims/Privacy;-><init>()V

    .line 90
    .local v2, "privacy":Landroid/gov/nist/javax/sip/header/ims/Privacy;
    const-string/jumbo v4, "Privacy"

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/header/ims/Privacy;->setHeaderName(Ljava/lang/String;)V

    .line 92
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 93
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 94
    .local v4, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/ims/Privacy;->setPrivacy(Ljava/lang/String;)V

    .line 95
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 96
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 99
    :goto_1
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x3b

    if-ne v6, v7, :cond_1

    .line 101
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 102
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 103
    new-instance v6, Landroid/gov/nist/javax/sip/header/ims/Privacy;

    invoke-direct {v6}, Landroid/gov/nist/javax/sip/header/ims/Privacy;-><init>()V

    move-object v2, v6

    .line 104
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 105
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v4, v6

    .line 106
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/ims/Privacy;->setPrivacy(Ljava/lang/String;)V

    .line 107
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 109
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ims/PrivacyList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 111
    .end local v2    # "privacy":Landroid/gov/nist/javax/sip/header/ims/Privacy;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    goto :goto_0

    .line 113
    :cond_2
    nop

    .line 117
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->debug:Z

    if-eqz v2, :cond_3

    .line 118
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 117
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->debug:Z

    if-eqz v3, :cond_4

    .line 118
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PrivacyParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v2
.end method
