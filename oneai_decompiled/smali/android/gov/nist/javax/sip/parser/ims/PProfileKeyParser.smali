.class public Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "PProfileKeyParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 43
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "profilekey"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 49
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

    .line 52
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->debug:Z

    const-string/jumbo v1, "PProfileKey.parse"

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->dbg_enter(Ljava/lang/String;)V

    .line 56
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x85e

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 57
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 58
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 59
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 61
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PProfileKey;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PProfileKey;-><init>()V

    .line 62
    .local v0, "p":Landroid/gov/nist/javax/sip/header/ims/PProfileKey;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    nop

    .line 66
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->debug:Z

    if-eqz v2, :cond_1

    .line 67
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 66
    .end local v0    # "p":Landroid/gov/nist/javax/sip/header/ims/PProfileKey;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->debug:Z

    if-eqz v2, :cond_2

    .line 67
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PProfileKeyParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
