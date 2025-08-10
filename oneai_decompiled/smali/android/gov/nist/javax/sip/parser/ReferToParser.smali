.class public Landroid/gov/nist/javax/sip/parser/ReferToParser;
.super Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.source "ReferToParser.java"


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
    .param p1, "referTo"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;-><init>(Ljava/lang/String;)V

    .line 49
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

    .line 64
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "Refer-To: <sip:dave@denver.example.org?Replaces=12345%40192.168.118.3%3Bto-tag%3D12345%3Bfrom-tag%3D5FFE-3994>\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Refer-To: <sip:+1-650-555-2222@ss1.wcom.com;user=phone>;tag=5617\n"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "Refer-To: T. A. Watson <sip:watson@bell-telephone.com>\n"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "Refer-To: LittleGuy <sip:UserB@there.com>\n"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "Refer-To: sip:mranga@120.6.55.9\n"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "Refer-To: sip:mranga@129.6.55.9 ; tag=696928473514.129.6.55.9\n"

    aput-object v2, v0, v1

    .line 73
    .local v0, "to":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 74
    new-instance v2, Landroid/gov/nist/javax/sip/parser/ReferToParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/ReferToParser;-><init>(Ljava/lang/String;)V

    .line 75
    .local v2, "tp":Landroid/gov/nist/javax/sip/parser/ReferToParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/ReferToParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/ReferTo;

    .line 76
    .local v3, "t":Landroid/gov/nist/javax/sip/header/ReferTo;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/ReferTo;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 73
    .end local v2    # "tp":Landroid/gov/nist/javax/sip/parser/ReferToParser;
    .end local v3    # "t":Landroid/gov/nist/javax/sip/header/ReferTo;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 79
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

    .line 56
    const/16 v0, 0x842

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ReferToParser;->headerName(I)V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sip/header/ReferTo;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ReferTo;-><init>()V

    .line 58
    .local v0, "referTo":Landroid/gov/nist/javax/sip/header/ReferTo;
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V

    .line 59
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ReferToParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 60
    return-object v0
.end method
