.class public Landroid/gov/nist/javax/sip/parser/AlertInfoParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "AlertInfoParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 60
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "alertInfo"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 70
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->debug:Z

    const-string v1, "AlertInfoParser.parse"

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->dbg_enter(Ljava/lang/String;)V

    .line 72
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/AlertInfoList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AlertInfoList;-><init>()V

    .line 75
    .local v0, "list":Landroid/gov/nist/javax/sip/header/AlertInfoList;
    const/16 v2, 0x80d

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->headerName(I)V

    .line 76
    const/4 v2, 0x0

    .line 78
    .local v2, "lineCount":I
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0xa

    if-eq v3, v5, :cond_3

    const/16 v3, 0x14

    if-ge v2, v3, :cond_3

    .line 80
    :goto_1
    new-instance v3, Landroid/gov/nist/javax/sip/header/AlertInfo;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/AlertInfo;-><init>()V

    .line 81
    .local v3, "alertInfo":Landroid/gov/nist/javax/sip/header/AlertInfo;
    const-string v5, "Alert-Info"

    invoke-virtual {v3, v5}, Landroid/gov/nist/javax/sip/header/AlertInfo;->setHeaderName(Ljava/lang/String;)V

    .line 84
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    const/16 v6, 0x3c

    if-ne v5, v6, :cond_1

    .line 86
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 87
    new-instance v5, Landroid/gov/nist/javax/sip/parser/URLParser;

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    check-cast v6, Landroid/gov/nist/javax/sip/parser/Lexer;

    invoke-direct {v5, v6}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 88
    .local v5, "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v6

    .line 89
    .local v6, "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    invoke-virtual {v3, v6}, Landroid/gov/nist/javax/sip/header/AlertInfo;->setAlertInfo(Landroid/javax/sip/address/URI;)V

    .line 90
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v8, 0x3e

    invoke-virtual {v7, v8}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    goto :goto_2

    .line 95
    .end local v5    # "urlParser":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v6    # "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    :cond_1
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->byteStringNoSemicolon()Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, "alertInfoStr":Ljava/lang/String;
    invoke-virtual {v3, v5}, Landroid/gov/nist/javax/sip/header/AlertInfo;->setAlertInfo(Ljava/lang/String;)V

    .line 99
    .end local v5    # "alertInfoStr":Ljava/lang/String;
    :goto_2
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 101
    invoke-super {p0, v3}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 102
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/AlertInfoList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 104
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    const/16 v6, 0x2c

    if-ne v5, v6, :cond_2

    .line 105
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    nop

    .end local v3    # "alertInfo":Landroid/gov/nist/javax/sip/header/AlertInfo;
    goto :goto_1

    .line 108
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 110
    :cond_3
    nop

    .line 112
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->debug:Z

    if-eqz v3, :cond_4

    .line 113
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v0

    .line 112
    .end local v2    # "lineCount":I
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->debug:Z

    if-eqz v3, :cond_5

    .line 113
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AlertInfoParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v2
.end method
