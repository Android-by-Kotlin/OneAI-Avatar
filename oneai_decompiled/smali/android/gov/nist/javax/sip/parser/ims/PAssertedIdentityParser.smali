.class public Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "PAssertedIdentityParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 1
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 63
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->allowParameters:Z

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "assertedIdentity"    # Ljava/lang/String;

    .line 57
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->allowParameters:Z

    .line 60
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

    .line 71
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->debug:Z

    const-string v1, "AssertedIdentityParser.parse"

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->dbg_enter(Ljava/lang/String;)V

    .line 74
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityList;-><init>()V

    .line 78
    .local v0, "assertedIdList":Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityList;
    const/16 v2, 0x849

    :try_start_0
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->headerName(I)V

    .line 80
    new-instance v2, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;-><init>()V

    .line 81
    .local v2, "pai":Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;
    const-string/jumbo v3, "P-Asserted-Identity"

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;->setHeaderName(Ljava/lang/String;)V

    .line 83
    invoke-super {p0, v2}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 84
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 86
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 87
    :goto_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_1

    .line 89
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 92
    new-instance v3, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;

    invoke-direct {v3}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;-><init>()V

    move-object v2, v3

    .line 93
    invoke-super {p0, v2}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 94
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentityList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 96
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    goto :goto_0

    .line 98
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 99
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    nop

    .line 106
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->debug:Z

    if-eqz v3, :cond_2

    .line 107
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 106
    .end local v2    # "pai":Landroid/gov/nist/javax/sip/header/ims/PAssertedIdentity;
    :catchall_0
    move-exception v2

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->debug:Z

    if-eqz v3, :cond_3

    .line 107
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedIdentityParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v2
.end method
