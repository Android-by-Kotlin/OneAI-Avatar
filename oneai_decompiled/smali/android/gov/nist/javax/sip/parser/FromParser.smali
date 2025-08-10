.class public Landroid/gov/nist/javax/sip/parser/FromParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "FromParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .line 44
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 45
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
    new-instance v0, Landroid/gov/nist/javax/sip/header/From;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/From;-><init>()V

    .line 53
    .local v0, "from":Landroid/gov/nist/javax/sip/header/From;
    const/16 v1, 0x80e

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/FromParser;->headerName(I)V

    .line 54
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 55
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/FromParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 56
    return-object v0
.end method
