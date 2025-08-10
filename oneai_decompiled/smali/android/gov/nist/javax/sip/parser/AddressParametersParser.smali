.class public Landroid/gov/nist/javax/sip/parser/AddressParametersParser;
.super Landroid/gov/nist/javax/sip/parser/ParametersParser;
.source "AddressParametersParser.java"


# instance fields
.field protected allowParameters:Z


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 1
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 45
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->allowParameters:Z

    .line 46
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "buffer"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;-><init>(Ljava/lang/String;)V

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->allowParameters:Z

    .line 50
    return-void
.end method


# virtual methods
.method protected parse(Landroid/gov/nist/javax/sip/header/AddressParametersHeader;)V
    .locals 7
    .param p1, "addressParametersHeader"    # Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 54
    const-string v0, "AddressParametersParser.parse"

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->dbg_enter(Ljava/lang/String;)V

    .line 56
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/parser/AddressParser;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/gov/nist/javax/sip/parser/AddressParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 57
    .local v1, "addressParser":Landroid/gov/nist/javax/sip/parser/AddressParser;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/parser/AddressParser;->address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v3

    .line 58
    .local v3, "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    invoke-virtual {p1, v3}, Landroid/gov/nist/javax/sip/header/AddressParametersHeader;->setAddress(Landroid/javax/sip/address/Address;)V

    .line 59
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 60
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v4

    .line 61
    .local v4, "la":C
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v4, :cond_0

    const/16 v5, 0xa

    if-eq v4, v5, :cond_0

    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->startsId()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 66
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parseNameValueList(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V

    goto :goto_1

    .line 70
    :cond_0
    iget-boolean v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->allowParameters:Z

    if-nez v5, :cond_2

    .line 71
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 72
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v5, 0x3b

    if-eq v2, v5, :cond_1

    goto :goto_0

    .line 73
    :cond_1
    new-instance v2, Ljava/text/ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "is not valid. This header doesn\'t allow parameters"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v6

    invoke-direct {v2, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .end local p1    # "addressParametersHeader":Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
    throw v2

    .line 76
    .restart local p1    # "addressParametersHeader":Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/parser/ParametersParser;->parse(Landroid/gov/nist/javax/sip/header/ParametersHeader;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .end local v1    # "addressParser":Landroid/gov/nist/javax/sip/parser/AddressParser;
    .end local v3    # "addr":Landroid/gov/nist/javax/sip/address/AddressImpl;
    .end local v4    # "la":C
    :goto_1
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->dbg_leave(Ljava/lang/String;)V

    .line 83
    nop

    .line 84
    return-void

    .line 82
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 79
    :catch_0
    move-exception v1

    .line 80
    .local v1, "ex":Ljava/text/ParseException;
    nop

    .end local p1    # "addressParametersHeader":Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .end local v1    # "ex":Ljava/text/ParseException;
    .restart local p1    # "addressParametersHeader":Landroid/gov/nist/javax/sip/header/AddressParametersHeader;
    :goto_2
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/AddressParametersParser;->dbg_leave(Ljava/lang/String;)V

    throw v1
.end method
