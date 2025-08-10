.class public Landroid/gov/nist/javax/sip/parser/AllowEventsParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "AllowEventsParser.java"


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
    .param p1, "allowEvents"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

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
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->debug:Z

    const-string v1, "AllowEventsParser.parse"

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/AllowEventsList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AllowEventsList;-><init>()V

    .line 72
    .local v0, "list":Landroid/gov/nist/javax/sip/header/AllowEventsList;
    const/16 v2, 0x841

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->headerName(I)V

    .line 74
    new-instance v2, Landroid/gov/nist/javax/sip/header/AllowEvents;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/AllowEvents;-><init>()V

    .line 75
    .local v2, "allowEvents":Landroid/gov/nist/javax/sip/header/AllowEvents;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xfff

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 76
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 77
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/gov/nist/javax/sip/header/AllowEvents;->setEventType(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AllowEventsList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 80
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 81
    :goto_0
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    const/16 v6, 0x2c

    if-ne v5, v6, :cond_1

    .line 82
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 83
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 85
    new-instance v5, Landroid/gov/nist/javax/sip/header/AllowEvents;

    invoke-direct {v5}, Landroid/gov/nist/javax/sip/header/AllowEvents;-><init>()V

    move-object v2, v5

    .line 86
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 87
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v5

    move-object v3, v5

    .line 88
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/gov/nist/javax/sip/header/AllowEvents;->setEventType(Ljava/lang/String;)V

    .line 90
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AllowEventsList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 91
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_0

    .line 93
    :cond_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    nop

    .line 98
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->debug:Z

    if-eqz v4, :cond_2

    .line 99
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 98
    .end local v2    # "allowEvents":Landroid/gov/nist/javax/sip/header/AllowEvents;
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->debug:Z

    if-eqz v3, :cond_3

    .line 99
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AllowEventsParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v2
.end method
