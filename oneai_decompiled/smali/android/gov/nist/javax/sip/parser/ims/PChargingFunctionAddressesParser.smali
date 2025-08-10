.class public Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "PChargingFunctionAddressesParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 80
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "charging"    # Ljava/lang/String;

    .line 73
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 76
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

    .line 148
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "P-Charging-Function-Addresses: ccf=\"test str\"; ecf=token\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "P-Charging-Function-Addresses: ccf=192.1.1.1; ccf=192.1.1.2; ecf=192.1.1.3; ecf=192.1.1.4\n"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "P-Charging-Function-Addresses: ccf=[5555::b99:c88:d77:e66]; ccf=[5555::a55:b44:c33:d22]; ecf=[5555::1ff:2ee:3dd:4cc]; ecf=[5555::6aa:7bb:8cc:9dd]\n"

    aput-object v2, v0, v1

    .line 157
    .local v0, "r":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 160
    new-instance v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;-><init>(Ljava/lang/String;)V

    .line 163
    .local v2, "parser":Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "original = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 165
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v3

    check-cast v3, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;

    .line 166
    .local v3, "chargAddr":Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "encoded = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 157
    .end local v2    # "parser":Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;
    .end local v3    # "chargAddr":Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 170
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 89
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->debug:Z

    const-string/jumbo v1, "parse"

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->dbg_enter(Ljava/lang/String;)V

    .line 92
    :cond_0
    const/16 v0, 0x84c

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->headerName(I)V

    .line 93
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .local v0, "chargingFunctionAddresses":Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
    :goto_0
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    .line 98
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->parseParameter(Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;)V

    .line 99
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 100
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 101
    .local v2, "la":C
    if-eq v2, v4, :cond_2

    if-nez v2, :cond_1

    .line 102
    goto :goto_1

    .line 104
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 105
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    .end local v2    # "la":C
    goto :goto_0

    .line 109
    :cond_2
    :goto_1
    nop

    .line 112
    :try_start_2
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 113
    nop

    .line 115
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->debug:Z

    if-eqz v2, :cond_3

    .line 116
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 107
    :catch_0
    move-exception v2

    .line 108
    .local v2, "ex":Ljava/text/ParseException;
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 115
    .end local v0    # "chargingFunctionAddresses":Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
    .end local v2    # "ex":Ljava/text/ParseException;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->debug:Z

    if-eqz v2, :cond_4

    .line 116
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    throw v0
.end method

.method protected parseParameter(Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;)V
    .locals 3
    .param p1, "chargingFunctionAddresses"    # Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 122
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->debug:Z

    const-string/jumbo v1, "parseParameter"

    if-eqz v0, :cond_0

    .line 123
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->dbg_enter(Ljava/lang/String;)V

    .line 126
    :cond_0
    const/16 v0, 0x3d

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 129
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingFunctionAddresses;->setMultiParameter(Landroid/gov/nist/core/NameValue;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->debug:Z

    if-eqz v0, :cond_1

    .line 133
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->dbg_leave(Ljava/lang/String;)V

    .line 138
    :cond_1
    return-void

    .line 132
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->debug:Z

    if-eqz v2, :cond_2

    .line 133
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingFunctionAddressesParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
