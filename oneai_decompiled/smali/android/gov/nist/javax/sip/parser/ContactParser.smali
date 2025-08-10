.class public Landroid/gov/nist/javax/sip/parser/ContactParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "ContactParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 50
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 51
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "contact"    # Ljava/lang/String;

    .line 46
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 47
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 56
    const/16 v0, 0x827

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ContactParser;->headerName(I)V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContactList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContactList;-><init>()V

    .line 59
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ContactList;
    :goto_0
    new-instance v1, Landroid/gov/nist/javax/sip/header/Contact;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/Contact;-><init>()V

    .line 60
    .local v1, "contact":Landroid/gov/nist/javax/sip/header/Contact;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    const/16 v5, 0x2a

    if-ne v2, v5, :cond_2

    .line 61
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 62
    .local v2, "next":C
    const/16 v7, 0x20

    if-eq v2, v7, :cond_1

    const/16 v7, 0x9

    if-eq v2, v7, :cond_1

    const/16 v7, 0xd

    if-eq v2, v7, :cond_1

    if-ne v2, v4, :cond_0

    goto :goto_1

    .line 66
    :cond_0
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    goto :goto_2

    .line 63
    :cond_1
    :goto_1
    iget-object v7, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 64
    invoke-virtual {v1, v6}, Landroid/gov/nist/javax/sip/header/Contact;->setWildCardFlag(Z)V

    .line 68
    .end local v2    # "next":C
    :goto_2
    goto :goto_3

    .line 69
    :cond_2
    invoke-super {p0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 71
    :goto_3
    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ContactList;->add(Landroid/gov/nist/javax/sip/header/SIPHeader;)Z

    .line 72
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 73
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 74
    .local v2, "la":C
    const/16 v3, 0x2c

    if-ne v2, v3, :cond_3

    .line 75
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 76
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ContactParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 81
    .end local v1    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    .end local v2    # "la":C
    goto :goto_0

    .line 77
    .restart local v1    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    .restart local v2    # "la":C
    :cond_3
    if-eq v2, v4, :cond_5

    if-nez v2, :cond_4

    .line 78
    goto :goto_4

    .line 80
    :cond_4
    const-string/jumbo v3, "unexpected char"

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ContactParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v3

    throw v3

    .line 82
    .end local v1    # "contact":Landroid/gov/nist/javax/sip/header/Contact;
    .end local v2    # "la":C
    :cond_5
    :goto_4
    return-object v0
.end method
