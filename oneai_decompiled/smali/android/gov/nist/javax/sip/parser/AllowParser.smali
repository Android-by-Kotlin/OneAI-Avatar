.class public Landroid/gov/nist/javax/sip/parser/AllowParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "AllowParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "allow"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 49
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
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/AllowParser;->debug:Z

    const-string v1, "AllowParser.parse"

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AllowParser;->dbg_enter(Ljava/lang/String;)V

    .line 68
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/AllowList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/AllowList;-><init>()V

    .line 71
    .local v0, "list":Landroid/gov/nist/javax/sip/header/AllowList;
    const/16 v2, 0x815

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/AllowParser;->headerName(I)V

    .line 73
    new-instance v2, Landroid/gov/nist/javax/sip/header/Allow;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/Allow;-><init>()V

    .line 74
    .local v2, "allow":Landroid/gov/nist/javax/sip/header/Allow;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AllowList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 75
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 76
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xfff

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v3

    .line 77
    .local v3, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/gov/nist/javax/sip/header/Allow;->setMethod(Ljava/lang/String;)V

    .line 78
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 79
    :goto_0
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    const/16 v6, 0x2c

    if-ne v5, v6, :cond_1

    .line 80
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 81
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 83
    new-instance v5, Landroid/gov/nist/javax/sip/header/Allow;

    invoke-direct {v5}, Landroid/gov/nist/javax/sip/header/Allow;-><init>()V

    move-object v2, v5

    .line 84
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v5

    move-object v3, v5

    .line 85
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/gov/nist/javax/sip/header/Allow;->setMethod(Ljava/lang/String;)V

    .line 86
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/AllowList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 87
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_0

    .line 90
    .end local v3    # "token":Landroid/gov/nist/core/Token;
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/AllowParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    nop

    .line 93
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AllowParser;->debug:Z

    if-eqz v3, :cond_2

    .line 94
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AllowParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 93
    .end local v2    # "allow":Landroid/gov/nist/javax/sip/header/Allow;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/AllowParser;->debug:Z

    if-eqz v3, :cond_3

    .line 94
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AllowParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v2
.end method
