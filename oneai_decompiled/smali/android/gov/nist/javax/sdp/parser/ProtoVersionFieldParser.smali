.class public Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;
.super Landroid/gov/nist/javax/sdp/parser/SDPParser;
.source "ProtoVersionFieldParser.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "protoVersionField"    # Ljava/lang/String;

    .line 46
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/parser/SDPParser;-><init>()V

    .line 47
    new-instance v0, Landroid/gov/nist/javax/sdp/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sdp/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 48
    return-void
.end method


# virtual methods
.method public parse()Landroid/gov/nist/javax/sdp/fields/SDPField;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 71
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->protoVersionField()Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    move-result-object v0

    return-object v0
.end method

.method public protoVersionField()Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 52
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x76

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 53
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 54
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 55
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 57
    new-instance v0, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;

    invoke-direct {v0}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;-><init>()V

    .line 58
    .local v0, "protoVersionField":Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v2, 0xfff

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 59
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getNextToken()Landroid/gov/nist/core/Token;

    move-result-object v1

    .line 60
    .local v1, "version":Landroid/gov/nist/core/Token;
    invoke-virtual {v1}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;->setProtoVersion(I)V

    .line 62
    iget-object v2, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    return-object v0

    .line 65
    .end local v0    # "protoVersionField":Landroid/gov/nist/javax/sdp/fields/ProtoVersionField;
    .end local v1    # "version":Landroid/gov/nist/core/Token;
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Landroid/gov/nist/javax/sdp/parser/ProtoVersionFieldParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->createParseException()Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
