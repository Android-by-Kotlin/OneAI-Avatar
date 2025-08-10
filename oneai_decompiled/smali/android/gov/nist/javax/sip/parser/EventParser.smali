.class public Landroid/gov/nist/javax/sip/parser/EventParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "EventParser.java"


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
    .param p1, "event"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

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

    .line 67
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/EventParser;->debug:Z

    const-string v1, "EventParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/EventParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    const/16 v0, 0x83f

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/EventParser;->headerName(I)V

    .line 72
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/EventParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 74
    new-instance v0, Landroid/gov/nist/javax/sip/header/Event;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/Event;-><init>()V

    .line 75
    .local v0, "event":Landroid/gov/nist/javax/sip/header/Event;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/EventParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 76
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/EventParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 77
    .local v2, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3

    .line 79
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/Event;->setEventType(Ljava/lang/String;)V

    .line 80
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 82
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/EventParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/EventParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    nop

    .line 90
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/EventParser;->debug:Z

    if-eqz v4, :cond_1

    .line 91
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/EventParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 90
    .end local v0    # "event":Landroid/gov/nist/javax/sip/header/Event;
    .end local v2    # "token":Landroid/gov/nist/core/Token;
    .end local v3    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v0

    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "ex":Ljava/text/ParseException;
    :try_start_1
    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/EventParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    .end local v0    # "ex":Ljava/text/ParseException;
    :goto_0
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/EventParser;->debug:Z

    if-eqz v2, :cond_2

    .line 91
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/EventParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
