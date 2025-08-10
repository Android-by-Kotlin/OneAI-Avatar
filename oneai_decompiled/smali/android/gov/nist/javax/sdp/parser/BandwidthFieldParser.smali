.class public Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "BandwidthFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "bandwidthField"    # Ljava/lang/String;

    .line 39
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 40
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 41
    return-void
.end method


# virtual methods
.method public bandwidthField()Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 45
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x62

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 46
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 47
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 48
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 50
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;-><init>()V

    .line 52
    .local v0, "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    const/16 v1, 0x3a

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->nameValue(C)Landroid/gov/nist/core/NameValue;

    move-result-object v1

    .line 53
    .local v1, "nameValue":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v1}, Landroid/gov/nist/core/NameValue;->getName()Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/gov/nist/core/NameValue;->getValueAsObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 56
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setBandwidth(I)V

    .line 57
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/BandwidthField;->setBwtype(Ljava/lang/String;)V

    .line 59
    iget-object v4, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    return-object v0

    .line 61
    .end local v0    # "bandwidthField":Landroid/gov/nist/javax/sdp/fields/BandwidthField;
    .end local v1    # "nameValue":Landroid/gov/nist/core/NameValue;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 63
    new-instance v1, Ljava/text/ParseException;

    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

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

    .line 68
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/BandwidthFieldParser;->bandwidthField()Landroid/gov/nist/javax/sdp/fields/BandwidthField;

    move-result-object v0

    return-object v0
.end method
