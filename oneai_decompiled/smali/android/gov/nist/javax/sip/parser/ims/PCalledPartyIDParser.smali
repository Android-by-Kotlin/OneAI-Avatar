.class public Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "PCalledPartyIDParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 62
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "calledPartyID"    # Ljava/lang/String;

    .line 57
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 58
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

    .line 69
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->debug:Z

    const-string/jumbo v1, "PCalledPartyIDParser.parse"

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->dbg_enter(Ljava/lang/String;)V

    .line 73
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x850

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 74
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 75
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 76
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;-><init>()V

    .line 79
    .local v0, "calledPartyID":Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    nop

    .line 84
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->debug:Z

    if-eqz v2, :cond_1

    .line 85
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 84
    .end local v0    # "calledPartyID":Landroid/gov/nist/javax/sip/header/ims/PCalledPartyID;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->debug:Z

    if-eqz v2, :cond_2

    .line 85
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PCalledPartyIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
