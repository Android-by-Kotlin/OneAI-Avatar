.class public Landroid/gov/nist/javax/sip/parser/MinExpiresParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "MinExpiresParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "minExpires"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 52
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 68
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->debug:Z

    const-string v1, "MinExpiresParser.parse"

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->dbg_enter(Ljava/lang/String;)V

    .line 70
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/MinExpires;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/MinExpires;-><init>()V

    .line 72
    .local v0, "minExpires":Landroid/gov/nist/javax/sip/header/MinExpires;
    const/16 v2, 0x83e

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->headerName(I)V

    .line 74
    const-string v2, "Min-Expires"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/MinExpires;->setHeaderName(Ljava/lang/String;)V

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .local v2, "number":Ljava/lang/String;
    :try_start_1
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/MinExpires;->setExpires(I)V
    :try_end_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    nop

    .line 82
    :try_start_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 84
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 86
    nop

    .line 88
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->debug:Z

    if-eqz v3, :cond_1

    .line 89
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 79
    :catch_0
    move-exception v3

    .line 80
    .local v3, "ex":Landroid/javax/sip/InvalidArgumentException;
    :try_start_3
    invoke-virtual {v3}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "minExpires":Landroid/gov/nist/javax/sip/header/MinExpires;
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 88
    .end local v2    # "number":Ljava/lang/String;
    .end local v3    # "ex":Landroid/javax/sip/InvalidArgumentException;
    .restart local v0    # "minExpires":Landroid/gov/nist/javax/sip/header/MinExpires;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->debug:Z

    if-eqz v3, :cond_2

    .line 89
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/MinExpiresParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method
