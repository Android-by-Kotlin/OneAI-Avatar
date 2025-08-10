.class public Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "ServiceRouteParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 58
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "serviceRoute"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 55
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

    .line 72
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;-><init>()V

    .line 74
    .local v0, "serviceRouteList":Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->debug:Z

    const-string/jumbo v2, "ServiceRouteParser.parse"

    if-eqz v1, :cond_0

    .line 75
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->dbg_enter(Ljava/lang/String;)V

    .line 78
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x848

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 79
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 80
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 81
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;-><init>()V

    .line 84
    .local v1, "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 85
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 86
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v5, 0x2c

    if-ne v3, v5, :cond_1

    .line 88
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 89
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    .end local v1    # "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    goto :goto_0

    .line 90
    .restart local v1    # "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v4, 0xa

    if-ne v3, v4, :cond_3

    .line 91
    nop

    .line 95
    .end local v1    # "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    nop

    .line 97
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->debug:Z

    if-eqz v1, :cond_2

    .line 98
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 93
    .restart local v1    # "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    :cond_3
    :try_start_1
    const-string/jumbo v3, "unexpected char"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    .end local v0    # "serviceRouteList":Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    .end local v1    # "serviceRoute":Landroid/gov/nist/javax/sip/header/ims/ServiceRoute;
    .restart local v0    # "serviceRouteList":Landroid/gov/nist/javax/sip/header/ims/ServiceRouteList;
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->debug:Z

    if-eqz v3, :cond_4

    .line 98
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/ServiceRouteParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
