.class public Landroid/gov/nist/javax/sip/parser/StatusLineParser;
.super Landroid/gov/nist/javax/sip/parser/Parser;
.source "StatusLineParser.java"


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 2
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 45
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 46
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 47
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v1, "status_lineLexer"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "statusLine"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 42
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Lexer;

    const-string/jumbo v1, "status_lineLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sip/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 43
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/StatusLine;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 74
    const-string/jumbo v0, "parse"

    :try_start_0
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->debug:Z

    if-eqz v1, :cond_0

    .line 75
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->dbg_enter(Ljava/lang/String;)V

    .line 76
    :cond_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;-><init>()V

    .line 77
    .local v1, "retval":Landroid/gov/nist/javax/sip/header/StatusLine;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->sipVersion()Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "version":Ljava/lang/String;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/StatusLine;->setSipVersion(Ljava/lang/String;)V

    .line 79
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 80
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->statusCode()I

    move-result v3

    .line 81
    .local v3, "scode":I
    invoke-virtual {v1, v3}, Landroid/gov/nist/javax/sip/header/StatusLine;->setStatusCode(I)V

    .line 82
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->reasonPhrase()Ljava/lang/String;

    move-result-object v4

    .line 84
    .local v4, "rp":Ljava/lang/String;
    invoke-virtual {v1, v4}, Landroid/gov/nist/javax/sip/header/StatusLine;->setReasonPhrase(Ljava/lang/String;)V

    .line 85
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    nop

    .line 88
    sget-boolean v5, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->debug:Z

    if-eqz v5, :cond_1

    .line 89
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v1

    .line 88
    .end local v1    # "retval":Landroid/gov/nist/javax/sip/header/StatusLine;
    .end local v2    # "version":Ljava/lang/String;
    .end local v3    # "scode":I
    .end local v4    # "rp":Ljava/lang/String;
    :catchall_0
    move-exception v1

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->debug:Z

    if-eqz v2, :cond_2

    .line 89
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method

.method protected reasonPhrase()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected statusCode()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 51
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "scode":Ljava/lang/String;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->debug:Z

    const-string/jumbo v2, "statusCode"

    if-eqz v1, :cond_0

    .line 53
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->dbg_enter(Ljava/lang/String;)V

    .line 55
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .local v1, "retval":I
    nop

    .line 62
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->debug:Z

    if-eqz v3, :cond_1

    .line 63
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return v1

    .line 62
    .end local v1    # "retval":I
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 57
    :catch_0
    move-exception v1

    .line 58
    .local v1, "ex":Ljava/lang/NumberFormatException;
    :try_start_1
    new-instance v3, Ljava/text/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v5

    invoke-direct {v3, v4, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local v0    # "scode":Ljava/lang/String;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .end local v1    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "scode":Ljava/lang/String;
    :goto_0
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->debug:Z

    if-eqz v3, :cond_2

    .line 63
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
