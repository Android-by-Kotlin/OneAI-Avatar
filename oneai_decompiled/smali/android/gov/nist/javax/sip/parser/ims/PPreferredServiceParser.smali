.class public Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "PPreferredServiceParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "pps"    # Ljava/lang/String;

    .line 54
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 94
    const-string v0, "3gpp-application"

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->debug:Z

    const-string/jumbo v2, "PPreferredServiceParser.parse"

    if-eqz v1, :cond_0

    .line 95
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->dbg_enter(Ljava/lang/String;)V

    .line 99
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x860

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 100
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 101
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 102
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 104
    new-instance v1, Landroid/gov/nist/javax/sip/header/ims/PPreferredService;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/header/ims/PPreferredService;-><init>()V

    .line 105
    .local v1, "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v3

    .line 106
    .local v3, "urn":Ljava/lang/String;
    const-string/jumbo v4, "urn:urn-7:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 108
    const-string v4, "3gpp-service"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v5, ""

    const/4 v6, 0x1

    if-eqz v4, :cond_2

    .line 110
    :try_start_1
    const-string v0, "3gpp-service."

    invoke-virtual {v3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v6

    .line 112
    .local v0, "serviceID":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 120
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/ims/PPreferredService;->setSubserviceIdentifiers(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 114
    :cond_1
    :try_start_2
    new-instance v4, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v5, "URN should atleast have one sub-service"

    invoke-direct {v4, v5}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "serviceID":Ljava/lang/String;
    .end local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .end local v3    # "urn":Ljava/lang/String;
    throw v4
    :try_end_2
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    .restart local v0    # "serviceID":Ljava/lang/String;
    .restart local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .restart local v3    # "urn":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 117
    .local v4, "e":Landroid/javax/sip/InvalidArgumentException;
    :try_start_3
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 118
    .end local v4    # "e":Landroid/javax/sip/InvalidArgumentException;
    nop

    .line 121
    .end local v0    # "serviceID":Ljava/lang/String;
    :goto_0
    goto :goto_2

    .line 122
    :cond_2
    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 124
    invoke-virtual {v3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v6

    .line 125
    .local v0, "appID":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 132
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/header/ims/PPreferredService;->setApplicationIdentifiers(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 127
    :cond_3
    :try_start_4
    new-instance v4, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v5, "URN should atleast have one sub-application"

    invoke-direct {v4, v5}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "appID":Ljava/lang/String;
    .end local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .end local v3    # "urn":Ljava/lang/String;
    throw v4
    :try_end_4
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 128
    .restart local v0    # "appID":Ljava/lang/String;
    .restart local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .restart local v3    # "urn":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 129
    .restart local v4    # "e":Landroid/javax/sip/InvalidArgumentException;
    :try_start_5
    invoke-virtual {v4}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 130
    .end local v4    # "e":Landroid/javax/sip/InvalidArgumentException;
    nop

    .line 133
    .end local v0    # "appID":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 137
    :cond_4
    :try_start_6
    new-instance v0, Landroid/javax/sip/InvalidArgumentException;

    const-string/jumbo v4, "URN is not well formed"

    invoke-direct {v0, v4}, Landroid/javax/sip/InvalidArgumentException;-><init>(Ljava/lang/String;)V

    .end local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .end local v3    # "urn":Ljava/lang/String;
    throw v0
    :try_end_6
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 139
    .restart local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .restart local v3    # "urn":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 140
    .local v0, "e":Landroid/javax/sip/InvalidArgumentException;
    :try_start_7
    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->printStackTrace()V

    .line 145
    .end local v0    # "e":Landroid/javax/sip/InvalidArgumentException;
    :cond_5
    :goto_2
    invoke-super {p0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 146
    nop

    .line 149
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->debug:Z

    if-eqz v0, :cond_6

    .line 150
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->dbg_enter(Ljava/lang/String;)V

    :cond_6
    return-object v1

    .line 149
    .end local v1    # "pps":Landroid/gov/nist/javax/sip/header/ims/PPreferredService;
    .end local v3    # "urn":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->debug:Z

    if-eqz v1, :cond_7

    .line 150
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/ims/PPreferredServiceParser;->dbg_enter(Ljava/lang/String;)V

    :cond_7
    throw v0
.end method
