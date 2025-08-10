.class public Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "ErrorInfoParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 57
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorInfo"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 50
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

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->debug:Z

    const-string v1, "ErrorInfoParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ErrorInfoList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ErrorInfoList;-><init>()V

    .line 72
    .local v0, "list":Landroid/gov/nist/javax/sip/header/ErrorInfoList;
    const/16 v2, 0x80a

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->headerName(I)V

    .line 74
    :cond_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    .line 76
    :goto_0
    new-instance v2, Landroid/gov/nist/javax/sip/header/ErrorInfo;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/ErrorInfo;-><init>()V

    .line 77
    .local v2, "errorInfo":Landroid/gov/nist/javax/sip/header/ErrorInfo;
    const-string v4, "Error-Info"

    invoke-virtual {v2, v4}, Landroid/gov/nist/javax/sip/header/ErrorInfo;->setHeaderName(Ljava/lang/String;)V

    .line 79
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 80
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0x3c

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 81
    new-instance v4, Landroid/gov/nist/javax/sip/parser/URLParser;

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    check-cast v5, Landroid/gov/nist/javax/sip/parser/Lexer;

    invoke-direct {v4, v5}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 82
    .local v4, "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v5

    .line 83
    .local v5, "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    invoke-virtual {v2, v5}, Landroid/gov/nist/javax/sip/header/ErrorInfo;->setErrorInfo(Landroid/javax/sip/address/URI;)V

    .line 84
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v7, 0x3e

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 85
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    invoke-super {p0, v2}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 88
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ErrorInfoList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 90
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v6

    const/16 v7, 0x2c

    if-ne v6, v7, :cond_1

    .line 91
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    nop

    .end local v2    # "errorInfo":Landroid/gov/nist/javax/sip/header/ErrorInfo;
    .end local v4    # "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v5    # "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    goto :goto_0

    .line 96
    :cond_2
    nop

    .line 98
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->debug:Z

    if-eqz v2, :cond_3

    .line 99
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 98
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->debug:Z

    if-eqz v3, :cond_4

    .line 99
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ErrorInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v2
.end method
