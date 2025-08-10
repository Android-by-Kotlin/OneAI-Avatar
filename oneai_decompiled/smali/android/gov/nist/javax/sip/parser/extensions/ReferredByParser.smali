.class public Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "ReferredByParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 29
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "referBy"    # Ljava/lang/String;

    .line 25
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 41
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "Referred-By: <sip:dave@denver.example.org?Replaces=12345%40192.168.118.3%3Bto-tag%3D12345%3Bfrom-tag%3D5FFE-3994>\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Referred-By: <sip:+1-650-555-2222@ss1.wcom.com;user=phone>;tag=5617\n"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "Referred-By: T. A. Watson <sip:watson@bell-telephone.com>\n"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "Referred-By: LittleGuy <sip:UserB@there.com>\n"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "Referred-By: sip:mranga@120.6.55.9\n"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "Referred-By: sip:mranga@129.6.55.9 ; tag=696928473514.129.6.55.9\n"

    aput-object v2, v0, v1

    .line 50
    .local v0, "to":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 51
    new-instance v2, Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;-><init>(Ljava/lang/String;)V

    .line 52
    .local v2, "tp":Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;

    .line 53
    .local v3, "t":Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 50
    .end local v2    # "tp":Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;
    .end local v3    # "t":Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 56
    .end local v1    # "i":I
    :cond_0
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

    .line 33
    const/16 v0, 0x854

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;->headerName(I)V

    .line 34
    new-instance v0, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;-><init>()V

    .line 35
    .local v0, "referBy":Landroid/gov/nist/javax/sip/header/extensions/ReferredBy;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 36
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/extensions/ReferredByParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 37
    return-object v0
.end method
