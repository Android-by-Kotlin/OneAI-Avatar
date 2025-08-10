.class public Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "PPreferredIdentityParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "preferredIdentity"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 65
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->debug:Z

    const-string/jumbo v1, "PreferredIdentityParser.parse"

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->dbg_enter(Ljava/lang/String;)V

    .line 69
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x84a

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 70
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 71
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 72
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 74
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;-><init>()V

    .line 75
    .local v0, "p":Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    nop

    .line 78
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->debug:Z

    if-eqz v2, :cond_1

    .line 79
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 78
    .end local v0    # "p":Landroid/gov/nist/javax/sip/header/ims/PPreferredIdentity;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->debug:Z

    if-eqz v2, :cond_2

    .line 79
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PPreferredIdentityParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
