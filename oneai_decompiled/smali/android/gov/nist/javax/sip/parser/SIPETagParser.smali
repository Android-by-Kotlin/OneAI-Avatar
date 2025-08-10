.class public Landroid/gov/nist/javax/sip/parser/SIPETagParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "SIPETagParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 58
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "etag"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 51
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
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->debug:Z

    const-string/jumbo v1, "SIPEtag.parse"

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/SIPETag;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/SIPETag;-><init>()V

    .line 73
    .local v0, "sipEtag":Landroid/gov/nist/javax/sip/header/SIPETag;
    const/16 v2, 0x844

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->headerName(I)V

    .line 75
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 79
    .local v2, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/SIPETag;->setETag(Ljava/lang/String;)V

    .line 81
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 82
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    nop

    .line 86
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->debug:Z

    if-eqz v3, :cond_1

    .line 87
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 86
    .end local v2    # "token":Landroid/gov/nist/core/Token;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->debug:Z

    if-eqz v3, :cond_2

    .line 87
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/SIPETagParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v2
.end method
