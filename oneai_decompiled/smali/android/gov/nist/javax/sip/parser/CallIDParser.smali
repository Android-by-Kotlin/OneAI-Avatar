.class public Landroid/gov/nist/javax/sip/parser/CallIDParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "CallIDParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 54
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "callID"    # Ljava/lang/String;

    .line 46
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 47
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

    .line 63
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->debug:Z

    const-string/jumbo v1, "parse"

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/CallIDParser;->dbg_enter(Ljava/lang/String;)V

    .line 66
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x828

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 67
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 68
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 69
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 71
    new-instance v0, Landroid/gov/nist/javax/sip/header/CallID;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/CallID;-><init>()V

    .line 73
    .local v0, "callID":Landroid/gov/nist/javax/sip/header/CallID;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 74
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/CallIDParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "rest":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/header/CallID;->setCallId(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    nop

    .line 78
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/CallIDParser;->debug:Z

    if-eqz v3, :cond_1

    .line 79
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/CallIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 78
    .end local v0    # "callID":Landroid/gov/nist/javax/sip/header/CallID;
    .end local v2    # "rest":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/CallIDParser;->debug:Z

    if-eqz v2, :cond_2

    .line 79
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/CallIDParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
