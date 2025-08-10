.class public Landroid/gov/nist/javax/sip/parser/AuthorizationParser;
.super Landroid/gov/nist/javax/sip/parser/ChallengeParser;
.source "AuthorizationParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 56
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "authorization"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 65
    const-string/jumbo v0, "parse"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AuthorizationParser;->dbg_enter(Ljava/lang/String;)V

    .line 67
    const/16 v1, 0x817

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/AuthorizationParser;->headerName(I)V

    .line 68
    new-instance v1, Landroid/gov/nist/javax/sip/header/Authorization;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Authorization;-><init>()V

    .line 69
    .local v1, "auth":Landroid/gov/nist/javax/sip/header/Authorization;
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->parse(Landroid/gov/nist/javax/sip/header/AuthenticationHeader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    nop

    .line 72
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AuthorizationParser;->dbg_leave(Ljava/lang/String;)V

    return-object v1

    .end local v1    # "auth":Landroid/gov/nist/javax/sip/header/Authorization;
    :catchall_0
    move-exception v1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AuthorizationParser;->dbg_leave(Ljava/lang/String;)V

    throw v1
.end method
