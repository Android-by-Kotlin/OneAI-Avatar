.class public Landroid/gov/nist/javax/sip/parser/ProxyAuthenticateParser;
.super Landroid/gov/nist/javax/sip/parser/ChallengeParser;
.source "ProxyAuthenticateParser.java"


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
    .param p1, "proxyAuthenticate"    # Ljava/lang/String;

    .line 47
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;-><init>(Ljava/lang/String;)V

    .line 48
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 64
    const/16 v0, 0x822

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ProxyAuthenticateParser;->headerName(I)V

    .line 65
    new-instance v0, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;-><init>()V

    .line 66
    .local v0, "proxyAuthenticate":Landroid/gov/nist/javax/sip/header/ProxyAuthenticate;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ChallengeParser;->parse(Landroid/gov/nist/javax/sip/header/AuthenticationHeader;)V

    .line 67
    return-object v0
.end method
