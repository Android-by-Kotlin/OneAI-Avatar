.class public Landroid/gov/nist/javax/sip/parser/RecordRouteParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "RecordRouteParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 54
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "recordRoute"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 51
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

    .line 63
    new-instance v0, Landroid/gov/nist/javax/sip/header/RecordRouteList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/RecordRouteList;-><init>()V

    .line 65
    .local v0, "recordRouteList":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->debug:Z

    const-string/jumbo v2, "RecordRouteParser.parse"

    if-eqz v1, :cond_0

    .line 66
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x82c

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 70
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 71
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 72
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 74
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/RecordRoute;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/RecordRoute;-><init>()V

    .line 75
    .local v1, "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 76
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/RecordRouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 77
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 79
    .local v3, "la":C
    const/16 v4, 0x2c

    if-ne v3, v4, :cond_1

    .line 80
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 81
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    .end local v1    # "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v3    # "la":C
    goto :goto_0

    .line 82
    .restart local v1    # "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .restart local v3    # "la":C
    :cond_1
    const/16 v4, 0xa

    if-ne v3, v4, :cond_3

    .line 83
    nop

    .line 87
    .end local v1    # "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v3    # "la":C
    nop

    .line 89
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->debug:Z

    if-eqz v1, :cond_2

    .line 90
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 85
    .restart local v1    # "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .restart local v3    # "la":C
    :cond_3
    :try_start_1
    const-string/jumbo v4, "unexpected char"

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "recordRouteList":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    .end local v1    # "recordRoute":Landroid/gov/nist/javax/sip/header/RecordRoute;
    .end local v3    # "la":C
    .restart local v0    # "recordRouteList":Landroid/gov/nist/javax/sip/header/RecordRouteList;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->debug:Z

    if-eqz v3, :cond_4

    .line 90
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/RecordRouteParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
