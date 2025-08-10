.class public Landroid/gov/nist/javax/sip/parser/ExpiresParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "ExpiresParser.java"


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
    .param p1, "text"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 50
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

    .line 64
    new-instance v0, Landroid/gov/nist/javax/sip/header/Expires;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Expires;-><init>()V

    .line 65
    .local v0, "expires":Landroid/gov/nist/javax/sip/header/Expires;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->debug:Z

    const-string/jumbo v2, "parse"

    if-eqz v1, :cond_0

    .line 66
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->dbg_enter(Ljava/lang/String;)V

    .line 68
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x82a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 69
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 70
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 71
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 72
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextId()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .local v1, "nextId":Ljava/lang/String;
    :try_start_1
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 75
    .local v3, "delta":I
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/Expires;->setExpires(I)V

    .line 76
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    nop

    .line 84
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->debug:Z

    if-eqz v4, :cond_1

    .line 85
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 80
    .end local v3    # "delta":I
    :catch_0
    move-exception v3

    .line 81
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_2
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "expires":Landroid/gov/nist/javax/sip/header/Expires;
    throw v4

    .line 78
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "expires":Landroid/gov/nist/javax/sip/header/Expires;
    :catch_1
    move-exception v3

    .line 79
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string/jumbo v4, "bad integer format"

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "expires":Landroid/gov/nist/javax/sip/header/Expires;
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    .end local v1    # "nextId":Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "expires":Landroid/gov/nist/javax/sip/header/Expires;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->debug:Z

    if-eqz v3, :cond_2

    .line 85
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ExpiresParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
