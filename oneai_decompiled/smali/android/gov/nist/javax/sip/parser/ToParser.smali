.class public Landroid/gov/nist/javax/sip/parser/ToParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "ToParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 52
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

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

    .line 57
    const/16 v0, 0x80f

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ToParser;->headerName(I)V

    .line 58
    new-instance v0, Landroid/gov/nist/javax/sip/header/To;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/To;-><init>()V

    .line 59
    .local v0, "to":Landroid/gov/nist/javax/sip/header/To;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 60
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 61
    return-object v0
.end method
