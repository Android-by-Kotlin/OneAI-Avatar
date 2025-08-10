.class public Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "PMediaAuthorizationParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 65
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "mediaAuthorization"    # Ljava/lang/String;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 61
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

    .line 75
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;-><init>()V

    .line 77
    .local v0, "mediaAuthorizationList":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->debug:Z

    const-string v2, "MediaAuthorizationParser.parse"

    if-eqz v1, :cond_0

    .line 78
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->dbg_enter(Ljava/lang/String;)V

    .line 83
    :cond_0
    const/16 v1, 0x852

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->headerName(I)V

    .line 85
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;-><init>()V

    .line 86
    .local v1, "mediaAuthorization":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;
    const-string/jumbo v3, "P-Media-Authorization"

    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->setHeaderName(Ljava/lang/String;)V

    .line 88
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0xa

    if-eq v3, v5, :cond_2

    .line 90
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 91
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .local v3, "token":Landroid/gov/nist/core/Token;
    :try_start_1
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;->setMediaAuthorizationToken(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    nop

    .line 97
    :try_start_2
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 99
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 100
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v4

    const/16 v5, 0x2c

    if-ne v4, v5, :cond_1

    .line 102
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 103
    new-instance v4, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;

    invoke-direct {v4}, Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;-><init>()V

    move-object v1, v4

    .line 105
    :cond_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 106
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    goto :goto_0

    .line 94
    .restart local v3    # "token":Landroid/gov/nist/core/Token;
    :catch_0
    move-exception v4

    .line 95
    .local v4, "e":Landroid/javax/sip/InvalidArgumentException;
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "mediaAuthorizationList":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;
    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 108
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    .end local v4    # "e":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "mediaAuthorizationList":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorizationList;
    :cond_2
    nop

    .line 113
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->debug:Z

    if-eqz v3, :cond_3

    .line 114
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 113
    .end local v1    # "mediaAuthorization":Landroid/gov/nist/javax/sip/header/ims/PMediaAuthorization;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->debug:Z

    if-eqz v3, :cond_4

    .line 114
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PMediaAuthorizationParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
