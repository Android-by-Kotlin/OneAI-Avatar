.class public Landroid/gov/nist/javax/sip/parser/AcceptParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "AcceptParser.java"


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
    .param p1, "accept"    # Ljava/lang/String;

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

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->debug:Z

    const-string v1, "AcceptParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AcceptParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/AcceptList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AcceptList;-><init>()V

    .line 72
    .local v0, "list":Landroid/gov/nist/javax/sip/header/AcceptList;
    const/16 v2, 0x814

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AcceptParser;->headerName(I)V

    .line 74
    new-instance v2, Landroid/gov/nist/javax/sip/header/Accept;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/Accept;-><init>()V

    .line 75
    .local v2, "accept":Landroid/gov/nist/javax/sip/header/Accept;
    const-string v3, "Accept"

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/Accept;->setHeaderName(Ljava/lang/String;)V

    .line 77
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v3

    const/16 v4, 0x2f

    const/16 v5, 0xfff

    if-eqz v3, :cond_1

    .line 79
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 80
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 81
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/Accept;->setContentType(Ljava/lang/String;)V

    .line 82
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 83
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 84
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v3, v6

    .line 85
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/Accept;->setContentSubType(Ljava/lang/String;)V

    .line 86
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    invoke-super {p0, v2}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 89
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AcceptList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 91
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v6, 0x2c

    if-ne v3, v6, :cond_3

    .line 92
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 93
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 95
    new-instance v3, Landroid/gov/nist/javax/sip/header/Accept;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/Accept;-><init>()V

    move-object v2, v3

    .line 96
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 97
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 98
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 99
    .restart local v3    # "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/Accept;->setContentType(Ljava/lang/String;)V

    .line 100
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 101
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 102
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v6

    move-object v3, v6

    .line 103
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/gov/nist/javax/sip/header/Accept;->setContentSubType(Ljava/lang/String;)V

    .line 104
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AcceptParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 105
    invoke-super {p0, v2}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 107
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :cond_2
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AcceptList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 109
    :cond_3
    nop

    .line 111
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AcceptParser;->debug:Z

    if-eqz v3, :cond_4

    .line 112
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AcceptParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v0

    .line 111
    .end local v2    # "accept":Landroid/gov/nist/javax/sip/header/Accept;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AcceptParser;->debug:Z

    if-eqz v3, :cond_5

    .line 112
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AcceptParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v2
.end method
