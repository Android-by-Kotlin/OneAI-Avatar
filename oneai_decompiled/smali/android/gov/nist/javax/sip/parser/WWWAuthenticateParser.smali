.class public Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;
.super Landroid/gov/nist/javax/sip/parser/ChallengeParser;
.source "WWWAuthenticateParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 55
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "wwwAuthenticate"    # Ljava/lang/String;

    .line 47
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;-><init>(Ljava/lang/String;)V

    .line 48
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

    .line 64
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->debug:Z

    const-string/jumbo v1, "parse"

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->dbg_enter(Ljava/lang/String;)V

    .line 67
    :cond_0
    const/16 v0, 0x830

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->headerName(I)V

    .line 68
    new-instance v0, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/WWWAuthenticate;-><init>()V

    .line 69
    .local v0, "wwwAuthenticate":Landroid/gov/nist/javax/sip/header/WWWAuthenticate;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->parse(Landroid/gov/nist/javax/sip/header/AuthenticationHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    nop

    .line 72
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->debug:Z

    if-eqz v2, :cond_1

    .line 73
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 72
    .end local v0    # "wwwAuthenticate":Landroid/gov/nist/javax/sip/header/WWWAuthenticate;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->debug:Z

    if-eqz v2, :cond_2

    .line 73
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/WWWAuthenticateParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
