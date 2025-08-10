.class public Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "ConnectionFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "connectionField"    # Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 46
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 47
    return-void
.end method


# virtual methods
.method public connectionAddress(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    .locals 6
    .param p1, "address"    # Ljava/lang/String;

    .line 50
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;-><init>()V

    .line 52
    .local v0, "connectionAddress":Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 54
    .local v2, "begin":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 55
    new-instance v4, Landroid/gov/nist/core/Host;

    const/4 v5, 0x0

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setAddress(Landroid/gov/nist/core/Host;)V

    .line 57
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 58
    .local v1, "middle":I
    if-eq v1, v3, :cond_0

    .line 59
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 60
    .local v3, "ttl":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setTtl(I)V

    .line 62
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "addressNumber":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setPort(I)V

    .line 65
    .end local v3    # "ttl":Ljava/lang/String;
    .end local v4    # "addressNumber":Ljava/lang/String;
    goto :goto_0

    .line 66
    :cond_0
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 67
    .restart local v3    # "ttl":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setTtl(I)V

    .line 69
    .end local v1    # "middle":I
    .end local v3    # "ttl":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 70
    :cond_1
    new-instance v1, Landroid/gov/nist/core/Host;

    invoke-direct {v1, p1}, Landroid/gov/nist/core/Host;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;->setAddress(Landroid/gov/nist/core/Host;)V

    .line 72
    :goto_1
    return-object v0
.end method

.method public connectionField()Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 77
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x63

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 78
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 79
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 80
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 82
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;-><init>()V

    .line 84
    .local v0, "connectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xfff

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 85
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 86
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 87
    .local v1, "token":Landroid/gov/nist/core/Token;
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setNettype(Ljava/lang/String;)V

    .line 89
    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 90
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 91
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v2

    move-object v1, v2

    .line 92
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddressType(Ljava/lang/String;)V

    .line 93
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 94
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getRest()Ljava/lang/String;

    move-result-object v2

    .line 95
    .local v2, "rest":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->connectionAddress(Ljava/lang/String;)Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;

    move-result-object v3

    .line 98
    .local v3, "connectionAddress":Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sdp/fields/ConnectionField;->setAddress(Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    return-object v0

    .line 101
    .end local v0    # "connectionField":Landroid/gov/nist/javax/sdp/fields/ConnectionField;
    .end local v1    # "token":Landroid/gov/nist/core/Token;
    .end local v2    # "rest":Ljava/lang/String;
    .end local v3    # "connectionAddress":Landroid/gov/nist/javax/sdp/fields/ConnectionAddress;
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 107
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/ConnectionFieldParser;->connectionField()Landroid/gov/nist/javax/sdp/fields/ConnectionField;

    move-result-object v0

    return-object v0
.end method
