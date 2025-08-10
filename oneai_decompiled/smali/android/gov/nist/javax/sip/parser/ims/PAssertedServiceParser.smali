.class public Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "PAssertedServiceParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "pas"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 54
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

    .line 57
    const-string v0, "3gpp-application"

    const-string v1, "3gpp-service"

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->debug:Z

    const-string/jumbo v3, "PAssertedServiceParser.parse"

    if-eqz v2, :cond_0

    .line 58
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->dbg_enter(Ljava/lang/String;)V

    .line 61
    :cond_0
    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0x861

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 62
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 63
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0x3a

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 64
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 66
    new-instance v2, Landroid/gov/nist/javax/sip/header/ims/PAssertedService;

    invoke-direct {v2}, Landroid/gov/nist/javax/sip/header/ims/PAssertedService;-><init>()V

    .line 67
    .local v2, "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v4

    .line 68
    .local v4, "urn":Ljava/lang/String;
    const-string/jumbo v5, "urn:urn-7:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 70
    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v6, ""

    const/4 v7, 0x1

    if-eqz v5, :cond_2

    .line 72
    :try_start_1
    const-string v0, "3gpp-service."

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v7

    .line 74
    .local v0, "serviceID":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 82
    invoke-virtual {v4, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v7

    invoke-virtual {v2, v1}, Landroid/gov/nist/javax/sip/header/ims/PAssertedService;->setSubserviceIdentifiers(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 76
    :cond_1
    :try_start_2
    new-instance v1, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v5, "URN should atleast have one sub-service"

    invoke-direct {v1, v5}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "serviceID":Ljava/lang/String;
    .end local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .end local v4    # "urn":Ljava/lang/String;
    throw v1
    :try_end_2
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    .restart local v0    # "serviceID":Ljava/lang/String;
    .restart local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .restart local v4    # "urn":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 79
    .local v1, "e":Landroid/javax/sip/InvalidArgumentException;
    :try_start_3
    invoke-virtual {v1}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 80
    .end local v1    # "e":Landroid/javax/sip/InvalidArgumentException;
    nop

    .line 83
    .end local v0    # "serviceID":Ljava/lang/String;
    :goto_0
    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 86
    const-string v1, "3gpp-application."

    invoke-virtual {v4, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v7

    .line 87
    .local v1, "appID":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 94
    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v7

    invoke-virtual {v2, v0}, Landroid/gov/nist/javax/sip/header/ims/PAssertedService;->setApplicationIdentifiers(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 89
    :cond_3
    :try_start_4
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v5, "URN should atleast have one sub-application"

    invoke-direct {v0, v5}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local v1    # "appID":Ljava/lang/String;
    .end local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .end local v4    # "urn":Ljava/lang/String;
    throw v0
    :try_end_4
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    .restart local v1    # "appID":Ljava/lang/String;
    .restart local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .restart local v4    # "urn":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 91
    .local v0, "e":Landroid/javax/sip/InvalidArgumentException;
    :try_start_5
    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 92
    .end local v0    # "e":Landroid/javax/sip/InvalidArgumentException;
    nop

    .line 95
    .end local v1    # "appID":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 99
    :cond_4
    :try_start_6
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v1, "URN is not well formed"

    invoke-direct {v0, v1}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .end local v4    # "urn":Ljava/lang/String;
    throw v0
    :try_end_6
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 101
    .restart local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .restart local v4    # "urn":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 102
    .restart local v0    # "e":Landroid/javax/sip/InvalidArgumentException;
    :try_start_7
    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 107
    .end local v0    # "e":Landroid/javax/sip/InvalidArgumentException;
    :cond_5
    :goto_2
    invoke-super {p0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 108
    nop

    .line 111
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->debug:Z

    if-eqz v0, :cond_6

    .line 112
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->dbg_enter(Ljava/lang/String;)V

    :cond_6
    return-object v2

    .line 111
    .end local v2    # "pps":Landroid/gov/nist/javax/sip/header/ims/PAssertedService;
    .end local v4    # "urn":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->debug:Z

    if-eqz v1, :cond_7

    .line 112
    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sip/parser/ims/PAssertedServiceParser;->dbg_enter(Ljava/lang/String;)V

    :cond_7
    throw v0
.end method
