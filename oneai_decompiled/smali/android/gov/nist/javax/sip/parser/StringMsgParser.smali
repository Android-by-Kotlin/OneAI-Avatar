.class public Landroid/gov/nist/javax/sip/parser/StringMsgParser;
.super Ljava/lang/Object;
.source "StringMsgParser.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/parser/MessageParser;


# static fields
.field protected static computeContentLengthFromMessage:Z

.field private static logger:Landroid/gov/nist/core/StackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 83
    const/4 v0, 0x0

    sput-boolean v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->computeContentLengthFromMessage:Z

    .line 85
    const-class v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;

    invoke-static {v0}, Landroid/gov/nist/core/CommonLogger;->getLogger(Ljava/lang/Class;)Landroid/gov/nist/core/StackLogger;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 519
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "SIP/2.0 200 OK\r\nTo: \"The Little Blister\" <sip:LittleGuy@there.com>;tag=469bc066\r\nFrom: \"The Master Blaster\" <sip:BigGuy@here.com>;tag=11\r\nVia: SIP/2.0/UDP 139.10.134.246:5060;branch=z9hG4bK8b0a86f6_1030c7d18e0_17;received=139.10.134.246\r\nCall-ID: 1030c7d18ae_a97b0b_b@8b0a86f6\r\nCSeq: 1 SUBSCRIBE\r\nContact: <sip:172.16.11.162:5070>\r\nContent-Length: 0\r\n\r\n"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "SIP/2.0 180 Ringing\r\nVia: SIP/2.0/UDP 172.18.1.29:5060;branch=z9hG4bK43fc10fb4446d55fc5c8f969607991f4\r\nTo: \"0440\" <sip:0440@212.209.220.131>;tag=2600\r\nFrom: \"Andreas\" <sip:andreas@e-horizon.se>;tag=8524\r\nCall-ID: f51a1851c5f570606140f14c8eb64fd3@172.18.1.29\r\nCSeq: 1 INVITE\r\nMax-Forwards: 70\r\nRecord-Route: <sip:212.209.220.131:5060>\r\nContent-Length: 0\r\n\r\n"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "REGISTER sip:nist.gov SIP/2.0\r\nVia: SIP/2.0/UDP 129.6.55.182:14826\r\nMax-Forwards: 70\r\nFrom: <sip:mranga@nist.gov>;tag=6fcd5c7ace8b4a45acf0f0cd539b168b;epid=0d4c418ddf\r\nTo: <sip:mranga@nist.gov>\r\nCall-ID: c5679907eb954a8da9f9dceb282d7230@129.6.55.182\r\nCSeq: 1 REGISTER\r\nContact: <sip:129.6.55.182:14826>;methods=\"INVITE, MESSAGE, INFO, SUBSCRIBE, OPTIONS, BYE, CANCEL, NOTIFY, ACK, REFER\"\r\nUser-Agent: RTC/(Microsoft RTC)\r\nEvent:  registration\r\nAllow-Events: presence\r\nContent-Length: 0\r\n\r\nINVITE sip:littleguy@there.com:5060 SIP/2.0\r\nVia: SIP/2.0/UDP 65.243.118.100:5050\r\nFrom: M. Ranganathan  <sip:M.Ranganathan@sipbakeoff.com>;tag=1234\r\nTo: \"littleguy@there.com\" <sip:littleguy@there.com:5060> \r\nCall-ID: Q2AboBsaGn9!?x6@sipbakeoff.com \r\nCSeq: 1 INVITE \r\nContent-Length: 247\r\n\r\nv=0\r\no=4855 13760799956958020 13760799956958020 IN IP4  129.6.55.78\r\ns=mysession session\r\np=+46 8 52018010\r\nc=IN IP4  129.6.55.78\r\nt=0 0\r\nm=audio 6022 RTP/AVP 0 4 18\r\na=rtpmap:0 PCMU/8000\r\na=rtpmap:4 G723/8000\r\na=rtpmap:18 G729A/8000\r\na=ptime:20\r\n"

    aput-object v2, v0, v1

    .line 592
    .local v0, "messages":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x14

    if-ge v1, v2, :cond_0

    .line 593
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Landroid/gov/nist/javax/sip/parser/StringMsgParser$1ParserThread;

    invoke-direct {v3, v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser$1ParserThread;-><init>([Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 592
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 596
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method public static parseSIPHeader(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/SIPHeader;
    .locals 11
    .param p0, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 423
    const/4 v0, 0x0

    .line 424
    .local v0, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 427
    .local v1, "end":I
    :goto_0
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-gt v3, v4, :cond_0

    .line 428
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 431
    :cond_0
    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    if-gt v3, v4, :cond_1

    .line 432
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 437
    :cond_1
    nop

    .line 439
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v5, v1, 0x1

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 440
    .local v3, "buffer":Ljava/lang/StringBuilder;
    move v5, v0

    .line 441
    .local v5, "i":I
    move v6, v0

    .line 442
    .local v6, "lineStart":I
    const/4 v7, 0x0

    .line 443
    .local v7, "endOfLine":Z
    :goto_2
    const/16 v8, 0xa

    if-gt v5, v1, :cond_7

    .line 444
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 445
    .local v9, "c":C
    const/16 v10, 0xd

    if-eq v9, v10, :cond_5

    if-ne v9, v8, :cond_2

    goto :goto_4

    .line 452
    :cond_2
    if-eqz v7, :cond_6

    .line 453
    const/4 v7, 0x0

    .line 454
    if-eq v9, v4, :cond_4

    const/16 v8, 0x9

    if-ne v9, v8, :cond_3

    goto :goto_3

    .line 459
    :cond_3
    move v6, v5

    goto :goto_5

    .line 455
    :cond_4
    :goto_3
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 456
    add-int/lit8 v6, v5, 0x1

    goto :goto_5

    .line 446
    :cond_5
    :goto_4
    if-nez v7, :cond_6

    .line 447
    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    const/4 v7, 0x1

    .line 464
    :cond_6
    :goto_5
    nop

    .end local v9    # "c":C
    add-int/lit8 v5, v5, 0x1

    .line 465
    goto :goto_2

    .line 466
    :cond_7
    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 469
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/ParserFactory;->createParser(Ljava/lang/String;)Landroid/gov/nist/javax/sip/parser/HeaderParser;

    move-result-object v4

    .line 470
    .local v4, "hp":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    if-eqz v4, :cond_8

    .line 472
    invoke-virtual {v4}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v2

    return-object v2

    .line 471
    :cond_8
    new-instance v8, Ljava/text/ParseException;

    const-string/jumbo v9, "could not create parser"

    invoke-direct {v8, v9, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 434
    .end local v3    # "buffer":Ljava/lang/StringBuilder;
    .end local v4    # "hp":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    .end local v5    # "i":I
    .end local v6    # "lineStart":I
    .end local v7    # "endOfLine":Z
    :catch_0
    move-exception v3

    .line 436
    .local v3, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Empty header."

    invoke-direct {v4, v5, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4
.end method

.method public static setComputeContentLengthFromMessage(Z)V
    .locals 0
    .param p0, "computeContentLengthFromMessage"    # Z

    .line 510
    sput-boolean p0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->computeContentLengthFromMessage:Z

    .line 511
    return-void
.end method

.method protected static trimEndOfLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "line"    # Ljava/lang/String;

    .line 218
    if-nez p0, :cond_0

    .line 219
    return-object p0

    .line 221
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 222
    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x20

    if-gt v1, v2, :cond_1

    .line 223
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 225
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_2

    .line 226
    return-object p0

    .line 228
    :cond_2
    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 229
    const-string v1, ""

    return-object v1

    .line 231
    :cond_3
    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public parseAddress(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/AddressImpl;
    .locals 2
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 327
    new-instance v0, Landroid/gov/nist/javax/sip/parser/AddressParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/AddressParser;-><init>(Ljava/lang/String;)V

    .line 328
    .local v0, "addressParser":Landroid/gov/nist/javax/sip/parser/AddressParser;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/parser/AddressParser;->address(Z)Landroid/gov/nist/javax/sip/address/AddressImpl;

    move-result-object v1

    return-object v1
.end method

.method public parseHost(Ljava/lang/String;)Landroid/gov/nist/core/Host;
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 359
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Lexer;

    const-string/jumbo v1, "charLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sip/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    .local v0, "lexer":Landroid/gov/nist/javax/sip/parser/Lexer;
    new-instance v1, Landroid/gov/nist/core/HostNameParser;

    invoke-direct {v1, v0}, Landroid/gov/nist/core/HostNameParser;-><init>(Landroid/gov/nist/core/LexerCore;)V

    invoke-virtual {v1}, Landroid/gov/nist/core/HostNameParser;->host()Landroid/gov/nist/core/Host;

    move-result-object v1

    return-object v1
.end method

.method public parseSIPMessage([BZZLandroid/gov/nist/javax/sip/parser/ParseExceptionListener;)Landroid/gov/nist/javax/sip/message/SIPMessage;
    .locals 17
    .param p1, "msgBuffer"    # [B
    .param p2, "readBody"    # Z
    .param p3, "strict"    # Z
    .param p4, "parseExceptionListener"    # Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 111
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    const/4 v4, 0x0

    if-eqz v2, :cond_13

    array-length v0, v2

    if-nez v0, :cond_0

    goto/16 :goto_8

    .line 114
    :cond_0
    const/4 v0, 0x0

    move v5, v0

    .line 118
    .local v5, "i":I
    :goto_0
    const/16 v6, 0x20

    :try_start_0
    aget-byte v0, v2, v5
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_2

    if-ge v0, v6, :cond_1

    .line 119
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 127
    :cond_1
    nop

    .line 130
    const/4 v0, 0x0

    .line 131
    .local v0, "currentLine":Ljava/lang/String;
    const/4 v4, 0x0

    .line 132
    .local v4, "currentHeader":Ljava/lang/String;
    const/4 v7, 0x1

    .line 133
    .local v7, "isFirstLine":Z
    const/4 v8, 0x0

    move-object/from16 v16, v4

    move-object v4, v0

    move v0, v5

    move-object/from16 v5, v16

    .line 136
    .local v0, "i":I
    .local v4, "currentLine":Ljava/lang/String;
    .local v5, "currentHeader":Ljava/lang/String;
    .local v8, "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :goto_1
    move v9, v0

    move v10, v0

    .line 140
    .end local v0    # "i":I
    .local v9, "lineStart":I
    .local v10, "i":I
    :goto_2
    const/4 v11, 0x0

    const/4 v12, 0x1

    :try_start_1
    aget-byte v0, v2, v10

    const/16 v13, 0xa

    const/16 v14, 0xd

    if-eq v0, v14, :cond_2

    aget-byte v0, v2, v10
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    if-eq v0, v13, :cond_2

    .line 141
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 146
    :cond_2
    nop

    .line 147
    sub-int v15, v10, v9

    .line 151
    .local v15, "lineLength":I
    :try_start_2
    new-instance v0, Ljava/lang/String;

    const-string/jumbo v13, "UTF-8"

    invoke-direct {v0, v2, v9, v15, v13}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    .line 154
    .end local v4    # "currentLine":Ljava/lang/String;
    .local v0, "currentLine":Ljava/lang/String;
    nop

    .line 156
    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->trimEndOfLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 158
    .end local v0    # "currentLine":Ljava/lang/String;
    .restart local v4    # "currentLine":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 160
    if-eqz v5, :cond_8

    if-eqz v8, :cond_8

    .line 161
    invoke-virtual {v1, v5, v8, v3, v2}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->processHeader(Ljava/lang/String;Landroid/gov/nist/javax/sip/message/SIPMessage;Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;[B)V

    goto :goto_4

    .line 166
    :cond_3
    if-eqz v7, :cond_4

    .line 167
    invoke-virtual {v1, v4, v3, v2}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->processFirstLine(Ljava/lang/String;Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;[B)Landroid/gov/nist/javax/sip/message/SIPMessage;

    move-result-object v0

    move-object v8, v0

    .end local v8    # "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .local v0, "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    goto :goto_4

    .line 169
    .end local v0    # "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .restart local v8    # "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :cond_4
    invoke-virtual {v4, v11}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 170
    .local v0, "firstChar":C
    const/16 v13, 0x9

    if-eq v0, v13, :cond_7

    if-ne v0, v6, :cond_5

    goto :goto_3

    .line 178
    :cond_5
    if-eqz v5, :cond_6

    if-eqz v8, :cond_6

    .line 179
    invoke-virtual {v1, v5, v8, v3, v2}, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->processHeader(Ljava/lang/String;Landroid/gov/nist/javax/sip/message/SIPMessage;Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;[B)V

    .line 181
    :cond_6
    move-object v5, v4

    goto :goto_4

    .line 171
    :cond_7
    :goto_3
    if-eqz v5, :cond_b

    .line 175
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 186
    .end local v0    # "firstChar":C
    :cond_8
    :goto_4
    aget-byte v0, v2, v10

    if-ne v0, v14, :cond_9

    array-length v0, v2

    add-int/lit8 v6, v10, 0x1

    if-le v0, v6, :cond_9

    add-int/lit8 v0, v10, 0x1

    aget-byte v0, v2, v0

    const/16 v6, 0xa

    if-ne v0, v6, :cond_9

    .line 187
    add-int/lit8 v10, v10, 0x1

    .line 189
    :cond_9
    add-int/lit8 v0, v10, 0x1

    .line 191
    .end local v10    # "i":I
    .local v0, "i":I
    const/4 v7, 0x0

    .line 192
    .end local v9    # "lineStart":I
    .end local v15    # "lineLength":I
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-gtz v6, :cond_a

    move v10, v0

    goto :goto_5

    :cond_a
    const/16 v6, 0x20

    goto/16 :goto_1

    .line 172
    .local v0, "firstChar":C
    .restart local v9    # "lineStart":I
    .restart local v10    # "i":I
    .restart local v15    # "lineLength":I
    :cond_b
    new-instance v6, Ljava/text/ParseException;

    const-string v12, "Bad header continuation."

    invoke-direct {v6, v12, v11}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 152
    .end local v0    # "firstChar":C
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v6, Ljava/text/ParseException;

    const-string v12, "Bad message encoding!"

    invoke-direct {v6, v12, v11}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 143
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v15    # "lineLength":I
    :catch_1
    move-exception v0

    .line 145
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    nop

    .line 194
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v9    # "lineStart":I
    :goto_5
    if-eqz v8, :cond_11

    .line 195
    invoke-virtual {v8, v10}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setSize(I)V

    .line 198
    if-eqz p2, :cond_10

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 199
    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v0

    if-eqz v0, :cond_c

    .line 200
    array-length v0, v2

    sub-int/2addr v0, v10

    .line 202
    .local v0, "bodyLength":I
    new-array v6, v0, [B

    .line 203
    .local v6, "body":[B
    invoke-static {v2, v10, v6, v11, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    xor-int/lit8 v9, p3, 0x1

    sget-boolean v11, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->computeContentLengthFromMessage:Z

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v12

    invoke-interface {v12}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v12

    invoke-virtual {v8, v6, v9, v11, v12}, Landroid/gov/nist/javax/sip/message/SIPMessage;->setMessageContent([BZZI)V

    .end local v0    # "bodyLength":I
    .end local v6    # "body":[B
    goto :goto_6

    .line 205
    :cond_c
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->computeContentLengthFromMessage:Z

    if-nez v0, :cond_f

    invoke-virtual {v8}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getContentLength()Landroid/javax/sip/header/ContentLengthHeader;

    move-result-object v0

    invoke-interface {v0}, Landroid/javax/sip/header/ContentLengthHeader;->getContentLength()I

    move-result v0

    if-nez v0, :cond_d

    move v11, v12

    :cond_d
    and-int v0, v11, p3

    if-eqz v0, :cond_f

    .line 206
    new-instance v0, Ljava/lang/String;

    array-length v6, v2

    const/4 v9, 0x4

    sub-int/2addr v6, v9

    invoke-direct {v0, v2, v6, v9}, Ljava/lang/String;-><init>([BII)V

    .line 207
    .local v0, "last4Chars":Ljava/lang/String;
    const-string v6, "\r\n\r\n"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    goto :goto_7

    .line 208
    :cond_e
    new-instance v6, Ljava/text/ParseException;

    const-string v9, "Extraneous characters at the end of the message "

    invoke-direct {v6, v9, v10}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 205
    .end local v0    # "last4Chars":Ljava/lang/String;
    :cond_f
    :goto_6
    nop

    .line 214
    :cond_10
    :goto_7
    return-object v8

    .line 194
    :cond_11
    new-instance v0, Ljava/text/ParseException;

    const-string v6, "Bad message"

    invoke-direct {v0, v6, v11}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 121
    .end local v4    # "currentLine":Ljava/lang/String;
    .end local v7    # "isFirstLine":Z
    .end local v8    # "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local v10    # "i":I
    .local v5, "i":I
    :catch_2
    move-exception v0

    move-object v6, v0

    move-object v0, v6

    .line 123
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    sget-object v6, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const/16 v7, 0x20

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->isLoggingEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 124
    sget-object v6, Landroid/gov/nist/javax/sip/parser/StringMsgParser;->logger:Landroid/gov/nist/core/StackLogger;

    const-string/jumbo v7, "handled only control char so returning null"

    invoke-interface {v6, v7}, Landroid/gov/nist/core/StackLogger;->logDebug(Ljava/lang/String;)V

    .line 126
    :cond_12
    return-object v4

    .line 112
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v5    # "i":I
    :cond_13
    :goto_8
    return-object v4
.end method

.method public parseSIPRequestLine(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/RequestLine;
    .locals 2
    .param p1, "requestLine"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 487
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 488
    new-instance v0, Landroid/gov/nist/javax/sip/parser/RequestLineParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/RequestLineParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/RequestLineParser;->parse()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v0

    return-object v0
.end method

.method public parseSIPStatusLine(Ljava/lang/String;)Landroid/gov/nist/javax/sip/header/StatusLine;
    .locals 2
    .param p1, "statusLine"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 504
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 505
    new-instance v0, Landroid/gov/nist/javax/sip/parser/StatusLineParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->parse()Landroid/gov/nist/javax/sip/header/StatusLine;

    move-result-object v0

    return-object v0
.end method

.method public parseSIPUrl(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/SipUri;
    .locals 4
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 393
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/parser/URLParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->sipURL(Z)Landroid/gov/nist/javax/sip/address/SipUri;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 394
    :catch_0
    move-exception v0

    .line 395
    .local v0, "ex":Ljava/lang/ClassCastException;
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Not a SIP URL "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public parseTelephoneNumber(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    .locals 2
    .param p1, "telephone_number"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 377
    new-instance v0, Landroid/gov/nist/javax/sip/parser/URLParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->parseTelephoneNumber(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    move-result-object v0

    return-object v0
.end method

.method public parseUrl(Ljava/lang/String;)Landroid/gov/nist/javax/sip/address/GenericURI;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 410
    new-instance v0, Landroid/gov/nist/javax/sip/parser/URLParser;

    invoke-direct {v0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/URLParser;->parse()Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v0

    return-object v0
.end method

.method protected processFirstLine(Ljava/lang/String;Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;[B)Landroid/gov/nist/javax/sip/message/SIPMessage;
    .locals 9
    .param p1, "firstLine"    # Ljava/lang/String;
    .param p2, "parseExceptionListener"    # Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    .param p3, "msgBuffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 236
    const-string/jumbo v0, "SIP/2.0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string/jumbo v1, "UTF-8"

    const-string v2, "\n"

    if-nez v0, :cond_1

    .line 237
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPRequest;-><init>()V

    .line 239
    .local v0, "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :try_start_0
    new-instance v3, Landroid/gov/nist/javax/sip/parser/RequestLineParser;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Landroid/gov/nist/javax/sip/parser/RequestLineParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/parser/RequestLineParser;->parse()Landroid/gov/nist/javax/sip/header/RequestLine;

    move-result-object v2

    .line 241
    .local v2, "requestLine":Landroid/gov/nist/javax/sip/header/RequestLine;
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPRequest;

    invoke-virtual {v3, v2}, Landroid/gov/nist/javax/sip/message/SIPRequest;->setRequestLine(Landroid/gov/nist/javax/sip/header/RequestLine;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "requestLine":Landroid/gov/nist/javax/sip/header/RequestLine;
    goto :goto_1

    .line 242
    :catch_0
    move-exception v2

    .line 243
    .local v2, "ex":Ljava/text/ParseException;
    if-eqz p2, :cond_0

    .line 245
    :try_start_1
    const-class v6, Landroid/gov/nist/javax/sip/header/RequestLine;

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, p3, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v3, p2

    move-object v4, v2

    move-object v5, v0

    move-object v7, p1

    invoke-interface/range {v3 .. v8}, Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;->handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 247
    :catch_1
    move-exception v1

    .line 248
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 249
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_0
    nop

    .line 253
    .end local v2    # "ex":Ljava/text/ParseException;
    :goto_1
    goto :goto_3

    .line 251
    .restart local v2    # "ex":Ljava/text/ParseException;
    :cond_0
    throw v2

    .line 255
    .end local v0    # "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    .end local v2    # "ex":Ljava/text/ParseException;
    :cond_1
    new-instance v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;-><init>()V

    .line 257
    .restart local v0    # "message":Landroid/gov/nist/javax/sip/message/SIPMessage;
    :try_start_2
    new-instance v3, Landroid/gov/nist/javax/sip/parser/StatusLineParser;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/parser/StatusLineParser;->parse()Landroid/gov/nist/javax/sip/header/StatusLine;

    move-result-object v2

    .line 258
    .local v2, "sl":Landroid/gov/nist/javax/sip/header/StatusLine;
    move-object v3, v0

    check-cast v3, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v3, v2}, Landroid/gov/nist/javax/sip/message/SIPResponse;->setStatusLine(Landroid/gov/nist/javax/sip/header/StatusLine;)V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_2

    .line 270
    .end local v2    # "sl":Landroid/gov/nist/javax/sip/header/StatusLine;
    goto :goto_3

    .line 259
    :catch_2
    move-exception v2

    .line 260
    .local v2, "ex":Ljava/text/ParseException;
    if-eqz p2, :cond_2

    .line 262
    :try_start_3
    const-class v6, Landroid/gov/nist/javax/sip/header/StatusLine;

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, p3, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v3, p2

    move-object v4, v2

    move-object v5, v0

    move-object v7, p1

    invoke-interface/range {v3 .. v8}, Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;->handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_2

    .line 264
    :catch_3
    move-exception v1

    .line 265
    .restart local v1    # "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 266
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_2
    nop

    .line 272
    .end local v2    # "ex":Ljava/text/ParseException;
    :goto_3
    return-object v0

    .line 268
    .restart local v2    # "ex":Ljava/text/ParseException;
    :cond_2
    throw v2
.end method

.method protected processHeader(Ljava/lang/String;Landroid/gov/nist/javax/sip/message/SIPMessage;Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;[B)V
    .locals 9
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "message"    # Landroid/gov/nist/javax/sip/message/SIPMessage;
    .param p3, "parseExceptionListener"    # Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;
    .param p4, "rawMessage"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 276
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 279
    :cond_0
    const/4 v0, 0x0

    .line 281
    .local v0, "headerParser":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/ParserFactory;->createParser(Ljava/lang/String;)Landroid/gov/nist/javax/sip/parser/HeaderParser;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_2

    move-object v0, v1

    .line 291
    nop

    .line 294
    :try_start_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/parser/HeaderParser;->parse()Landroid/gov/nist/javax/sip/header/SIPHeader;

    move-result-object v1

    .line 295
    .local v1, "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/gov/nist/javax/sip/message/SIPMessage;->attachHeader(Landroid/gov/nist/javax/sip/header/SIPHeader;Z)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    .line 312
    .end local v1    # "sipHeader":Landroid/gov/nist/javax/sip/header/SIPHeader;
    goto :goto_1

    .line 296
    :catch_0
    move-exception v1

    move-object v3, v1

    .line 297
    .local v3, "ex":Ljava/text/ParseException;
    if-eqz p3, :cond_2

    .line 298
    invoke-static {p1}, Landroid/gov/nist/javax/sip/parser/Lexer;->getHeaderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 299
    .local v1, "headerName":Ljava/lang/String;
    invoke-static {v1}, Landroid/gov/nist/javax/sip/header/NameMap;->getClassFromName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 300
    .local v2, "headerClass":Ljava/lang/Class;
    if-nez v2, :cond_1

    .line 301
    const-class v2, Landroid/gov/nist/javax/sip/header/ExtensionHeaderImpl;

    move-object v8, v2

    goto :goto_0

    .line 300
    :cond_1
    move-object v8, v2

    .line 305
    .end local v2    # "headerClass":Ljava/lang/Class;
    .local v8, "headerClass":Ljava/lang/Class;
    :goto_0
    :try_start_2
    new-instance v7, Ljava/lang/String;

    const-string/jumbo v2, "UTF-8"

    invoke-direct {v7, p4, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v2, p3

    move-object v4, p2

    move-object v5, v8

    move-object v6, p1

    invoke-interface/range {v2 .. v7}, Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;->handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    .line 309
    goto :goto_1

    .line 307
    :catch_1
    move-exception v2

    .line 308
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 313
    .end local v1    # "headerName":Ljava/lang/String;
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v3    # "ex":Ljava/text/ParseException;
    .end local v8    # "headerClass":Ljava/lang/Class;
    :cond_2
    :goto_1
    return-void

    .line 282
    :catch_2
    move-exception v1

    .line 284
    .local v1, "ex":Ljava/text/ParseException;
    if-eqz p3, :cond_3

    .line 285
    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v2, p3

    move-object v3, v1

    move-object v4, p2

    move-object v6, p1

    invoke-interface/range {v2 .. v7}, Landroid/gov/nist/javax/sip/parser/ParseExceptionListener;->handleException(Ljava/text/ParseException;Landroid/gov/nist/javax/sip/message/SIPMessage;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    return-void

    .line 289
    :cond_3
    throw v1

    .line 277
    .end local v0    # "headerParser":Landroid/gov/nist/javax/sip/parser/HeaderParser;
    .end local v1    # "ex":Ljava/text/ParseException;
    :cond_4
    :goto_2
    return-void
.end method
