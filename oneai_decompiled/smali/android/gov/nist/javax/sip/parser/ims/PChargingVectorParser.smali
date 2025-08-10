.class public Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "PChargingVectorParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/TokenTypes;


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 59
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "chargingVector"    # Ljava/lang/String;

    .line 53
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 55
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

    .line 68
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->debug:Z

    const-string/jumbo v1, "parse"

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->dbg_enter(Ljava/lang/String;)V

    .line 71
    :cond_0
    const/16 v0, 0x84d

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->headerName(I)V

    .line 72
    new-instance v0, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .local v0, "chargingVector":Landroid/gov/nist/javax/sip/header/ims/PChargingVector;
    :goto_0
    :try_start_1
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v4, 0xa

    if-eq v2, v4, :cond_2

    .line 76
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->parseParameter(Landroid/gov/nist/javax/sip/header/ims/PChargingVector;)V

    .line 77
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 78
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 79
    .local v2, "la":C
    if-eq v2, v4, :cond_2

    if-nez v2, :cond_1

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 82
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    .end local v2    # "la":C
    goto :goto_0

    .line 87
    :cond_2
    :goto_1
    nop

    .line 90
    :try_start_2
    invoke-super {p0, v0}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    .line 91
    const-string/jumbo v2, "icid-value"

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_4

    .line 93
    nop

    .line 95
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->debug:Z

    if-eqz v2, :cond_3

    .line 96
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 92
    :cond_4
    :try_start_3
    new-instance v2, Ljava/text/ParseException;

    const-string v4, "Missing a required Parameter : icid-value"

    invoke-direct {v2, v4, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 85
    :catch_0
    move-exception v2

    .line 86
    .local v2, "ex":Ljava/text/ParseException;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    .end local v0    # "chargingVector":Landroid/gov/nist/javax/sip/header/ims/PChargingVector;
    .end local v2    # "ex":Ljava/text/ParseException;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->debug:Z

    if-eqz v2, :cond_5

    .line 96
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v0
.end method

.method protected parseParameter(Landroid/gov/nist/javax/sip/header/ims/PChargingVector;)V
    .locals 3
    .param p1, "chargingVector"    # Landroid/gov/nist/javax/sip/header/ims/PChargingVector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 102
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->debug:Z

    const-string/jumbo v1, "parseParameter"

    if-eqz v0, :cond_0

    .line 103
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->dbg_enter(Ljava/lang/String;)V

    .line 105
    :cond_0
    const/16 v0, 0x3d

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v0

    .line 106
    .local v0, "nv":Landroid/gov/nist/core/NameValue;
    invoke-virtual {p1, v0}, Landroid/gov/nist/javax/sip/header/ims/PChargingVector;->setParameter(Landroid/gov/nist/core/NameValue;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    .end local v0    # "nv":Landroid/gov/nist/core/NameValue;
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->debug:Z

    if-eqz v0, :cond_1

    .line 109
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->dbg_leave(Ljava/lang/String;)V

    .line 114
    :cond_1
    return-void

    .line 108
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->debug:Z

    if-eqz v2, :cond_2

    .line 109
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/ims/PChargingVectorParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    throw v0
.end method
