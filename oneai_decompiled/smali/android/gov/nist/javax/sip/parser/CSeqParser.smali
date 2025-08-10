.class public Landroid/gov/nist/javax/sip/parser/CSeqParser;
.super Landroid/gov/nist/javax/sip/parser/HeaderParser;
.source "CSeqParser.java"


# direct methods
.method protected constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 0
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 52
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "cseq"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/HeaderParser;-><init>(Ljava/lang/String;)V

    .line 49
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

    .line 57
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/header/CSeq;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/CSeq;-><init>()V

    .line 58
    .local v0, "c":Landroid/gov/nist/javax/sip/header/CSeq;
    const/16 v1, 0x82e

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/CSeqParser;->headerName(I)V

    .line 59
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/CSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->number()Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "number":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/gov/nist/javax/sip/header/CSeq;->setSeqNumber(J)V

    .line 61
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/CSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 62
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/CSeqParser;->method()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->getCannonicalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "m":Ljava/lang/String;
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/header/CSeq;->setMethod(Ljava/lang/String;)V

    .line 64
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/CSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->SPorHT()V

    .line 65
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/CSeqParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/javax/sip/InvalidArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    return-object v0

    .line 70
    .end local v0    # "c":Landroid/gov/nist/javax/sip/header/CSeq;
    .end local v1    # "number":Ljava/lang/String;
    .end local v2    # "m":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 71
    .local v0, "ex":Landroid/javax/sip/InvalidArgumentException;
    invoke-static {v0}, Landroid/gov/nist/core/Debug;->printStackTrace(Ljava/lang/Exception;)V

    .line 72
    invoke-virtual {v0}, Landroid/javax/sip/InvalidArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/CSeqParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v1

    throw v1

    .line 67
    .end local v0    # "ex":Landroid/javax/sip/InvalidArgumentException;
    :catch_1
    move-exception v0

    .line 68
    .local v0, "ex":Ljava/lang/NumberFormatException;
    invoke-static {v0}, Landroid/gov/nist/core/Debug;->printStackTrace(Ljava/lang/Exception;)V

    .line 69
    const-string v1, "Number format exception"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/CSeqParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method
