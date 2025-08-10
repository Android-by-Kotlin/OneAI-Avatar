.class public Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "ReferencesParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 28
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "references"    # Ljava/lang/String;

    .line 20
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 21
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 38
    const-string/jumbo v0, "ReferencesParser.parse"

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->debug:Z

    if-eqz v1, :cond_0

    .line 39
    const-string/jumbo v1, "ReasonParser.parse"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->dbg_enter(Ljava/lang/String;)V

    .line 42
    :cond_0
    const/16 v1, 0x862

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->headerName(I)V

    .line 43
    new-instance v1, Landroid/gov/nist/javax/sip/header/extensions/References;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/extensions/References;-><init>()V

    .line 44
    .local v1, "references":Landroid/gov/nist/javax/sip/header/extensions/References;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 46
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->byteStringNoSemicolon()Ljava/lang/String;

    move-result-object v2

    .line 48
    .local v2, "callId":Ljava/lang/String;
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/header/extensions/References;->setCallId(Ljava/lang/String;)V

    .line 49
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    nop

    .line 52
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->debug:Z

    if-eqz v3, :cond_1

    .line 53
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v1

    .line 52
    .end local v1    # "references":Landroid/gov/nist/javax/sip/header/extensions/References;
    .end local v2    # "callId":Ljava/lang/String;
    :catchall_0
    move-exception v1

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->debug:Z

    if-eqz v2, :cond_2

    .line 53
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/extensions/ReferencesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v1
.end method
