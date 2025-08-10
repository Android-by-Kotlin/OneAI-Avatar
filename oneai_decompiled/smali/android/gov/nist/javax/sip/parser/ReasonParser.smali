.class public Landroid/gov/nist/javax/sip/parser/ReasonParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "ReasonParser.java"


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
    .param p1, "reason"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 66
    new-instance v0, Landroid/gov/nist/javax/sip/header/ReasonList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ReasonList;-><init>()V

    .line 67
    .local v0, "reasonList":Landroid/gov/nist/javax/sip/header/ReasonList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ReasonParser;->debug:Z

    const-string/jumbo v2, "ReasonParser.parse"

    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ReasonParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    const/16 v1, 0x83b

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ReasonParser;->headerName(I)V

    .line 72
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 73
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v4, 0xa

    if-eq v1, v4, :cond_2

    .line 74
    new-instance v1, Landroid/gov/nist/javax/sip/header/Reason;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Reason;-><init>()V

    .line 75
    .local v1, "reason":Landroid/gov/nist/javax/sip/header/Reason;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xfff

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 76
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 77
    .local v4, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    .line 79
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v1, v5}, Landroid/gov/nist/javax/sip/header/Reason;->setProtocol(Ljava/lang/String;)V

    .line 80
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 81
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ReasonList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 82
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v6, 0x2c

    if-ne v3, v6, :cond_1

    .line 83
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 84
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_1

    .line 86
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ReasonParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .end local v1    # "reason":Landroid/gov/nist/javax/sip/header/Reason;
    .end local v4    # "token":Landroid/gov/nist/core/Token;
    .end local v5    # "value":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .line 90
    :cond_2
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ReasonParser;->debug:Z

    if-eqz v1, :cond_3

    .line 91
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ReasonParser;->dbg_leave(Ljava/lang/String;)V

    .line 94
    :cond_3
    return-object v0

    .line 90
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ReasonParser;->debug:Z

    if-eqz v3, :cond_4

    .line 91
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ReasonParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
