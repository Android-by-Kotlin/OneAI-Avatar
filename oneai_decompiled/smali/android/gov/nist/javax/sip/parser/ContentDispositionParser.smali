.class public Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "ContentDispositionParser.java"


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
    .param p1, "contentDisposition"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 50
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

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->debug:Z

    const-string v1, "ContentDispositionParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    const/16 v0, 0x834

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->headerName(I)V

    .line 73
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContentDisposition;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContentDisposition;-><init>()V

    .line 74
    .local v0, "cd":Landroid/gov/nist/javax/sip/header/ContentDisposition;
    const-string v2, "Content-Disposition"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ContentDisposition;->setHeaderName(Ljava/lang/String;)V

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 79
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 80
    .local v2, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/ContentDisposition;->setDispositionType(Ljava/lang/String;)V

    .line 81
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 82
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 84
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    nop

    .line 91
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->debug:Z

    if-eqz v3, :cond_1

    .line 92
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 91
    .end local v0    # "cd":Landroid/gov/nist/javax/sip/header/ContentDisposition;
    .end local v2    # "token":Landroid/gov/nist/core/Token;
    :catchall_0
    move-exception v0

    goto :goto_0

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "ex":Ljava/text/ParseException;
    :try_start_1
    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .end local v0    # "ex":Ljava/text/ParseException;
    :goto_0
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->debug:Z

    if-eqz v2, :cond_2

    .line 92
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ContentDispositionParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
