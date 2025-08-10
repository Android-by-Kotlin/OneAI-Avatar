.class public Landroid/gov/nist/javax/sip/parser/URLParser;
.super Landroid/gov/nist/javax/sip/parser/Parser;
.source "URLParser.java"


# direct methods
.method public constructor <init>(Landroid/gov/nist/javax/sip/parser/Lexer;)V
    .locals 2
    .param p1, "lexer"    # Landroid/gov/nist/javax/sip/parser/Lexer;

    .line 54
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 55
    iput-object p1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 56
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v1, "sip_urlLexer"

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/Parser;-><init>()V

    .line 50
    new-instance v0, Landroid/gov/nist/javax/sip/parser/Lexer;

    const-string/jumbo v1, "sip_urlLexer"

    invoke-direct {v0, v1, p1}, Landroid/gov/nist/javax/sip/parser/Lexer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    .line 51
    return-void
.end method

.method private base_phone_number()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 374
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 376
    .local v0, "s":Ljava/lang/StringBuilder;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v2, "base_phone_number"

    if-eqz v1, :cond_0

    .line 377
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 379
    :cond_0
    const/4 v1, 0x0

    .line 380
    .local v1, "lc":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 381
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 382
    .local v3, "w":C
    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/Lexer;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_3

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_3

    const/16 v4, 0x2e

    if-eq v3, v4, :cond_3

    const/16 v4, 0x28

    if-eq v3, v4, :cond_3

    const/16 v4, 0x29

    if-ne v3, v4, :cond_1

    goto :goto_1

    .line 390
    :cond_1
    if-lez v1, :cond_2

    .line 391
    goto :goto_2

    .line 393
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "unexpected "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "s":Ljava/lang/StringBuilder;
    throw v4

    .line 387
    .restart local v0    # "s":Ljava/lang/StringBuilder;
    :cond_3
    :goto_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 388
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 389
    add-int/lit8 v1, v1, 0x1

    .line 394
    .end local v3    # "w":C
    goto :goto_0

    .line 395
    :cond_4
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v4, :cond_5

    .line 398
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    return-object v3

    .line 397
    .end local v1    # "lc":I
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_6

    .line 398
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v1
.end method

.method private final global_phone_number(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    .locals 7
    .param p1, "inBrackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 474
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "global_phone_number"

    if-eqz v0, :cond_0

    .line 475
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 477
    :cond_0
    :try_start_0
    new-instance v0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;-><init>()V

    .line 478
    .local v0, "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setGlobal(Z)V

    .line 479
    const/4 v3, 0x0

    .line 480
    .local v3, "nv":Landroid/gov/nist/core/NameValueList;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v5, 0x2b

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 481
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->base_phone_number()Ljava/lang/String;

    move-result-object v4

    .line 482
    .local v4, "b":Ljava/lang/String;
    invoke-virtual {v0, v4}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setPhoneNumber(Ljava/lang/String;)V

    .line 483
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 484
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v5

    .line 485
    .local v5, "tok":C
    const/16 v6, 0x3b

    if-ne v5, v6, :cond_1

    if-eqz p1, :cond_1

    .line 486
    iget-object v6, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v6, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 487
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->tel_parameters()Landroid/gov/nist/core/NameValueList;

    move-result-object v2

    move-object v3, v2

    .line 488
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setParameters(Landroid/gov/nist/core/NameValueList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    .end local v5    # "tok":C
    :cond_1
    nop

    .line 493
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_2

    .line 494
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 493
    .end local v0    # "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    .end local v3    # "nv":Landroid/gov/nist/core/NameValueList;
    .end local v4    # "b":Ljava/lang/String;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_3

    .line 494
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v0
.end method

.method protected static isMark(C)Z
    .locals 1
    .param p0, "next"    # C

    .line 59
    sparse-switch p0, :sswitch_data_0

    .line 71
    const/4 v0, 0x0

    return v0

    .line 69
    :sswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x27 -> :sswitch_0
        0x28 -> :sswitch_0
        0x29 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
        0x5f -> :sswitch_0
        0x7e -> :sswitch_0
    .end sparse-switch
.end method

.method protected static isReserved(C)Z
    .locals 1
    .param p0, "next"    # C

    .line 177
    sparse-switch p0, :sswitch_data_0

    .line 190
    const/4 v0, 0x0

    return v0

    .line 188
    :sswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x24 -> :sswitch_0
        0x26 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2c -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
    .end sparse-switch
.end method

.method protected static isReservedNoSlash(C)Z
    .locals 1
    .param p0, "next"    # C

    .line 80
    sparse-switch p0, :sswitch_data_0

    .line 91
    const/4 v0, 0x0

    return v0

    .line 89
    :sswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x24 -> :sswitch_0
        0x26 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2c -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
    .end sparse-switch
.end method

.method protected static isUnreserved(C)Z
    .locals 1
    .param p0, "next"    # C

    .line 76
    invoke-static {p0}, Landroid/gov/nist/javax/sip/parser/Lexer;->isAlphaDigit(C)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isMark(C)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected static isUserUnreserved(C)Z
    .locals 1
    .param p0, "la"    # C

    .line 99
    sparse-switch p0, :sswitch_data_0

    .line 111
    const/4 v0, 0x0

    return v0

    .line 109
    :sswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_0
        0x24 -> :sswitch_0
        0x26 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2c -> :sswitch_0
        0x2f -> :sswitch_0
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
        0x3f -> :sswitch_0
    .end sparse-switch
.end method

.method private local_number()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 407
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 408
    .local v0, "s":Ljava/lang/StringBuilder;
    sget-boolean v1, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v2, "local_number"

    if-eqz v1, :cond_0

    .line 409
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 411
    :cond_0
    const/4 v1, 0x0

    .line 412
    .local v1, "lc":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 413
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 414
    .local v3, "la":C
    const/16 v4, 0x2a

    if-eq v3, v4, :cond_3

    const/16 v4, 0x23

    if-eq v3, v4, :cond_3

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_3

    const/16 v4, 0x2e

    if-eq v3, v4, :cond_3

    const/16 v4, 0x28

    if-eq v3, v4, :cond_3

    const/16 v4, 0x29

    if-eq v3, v4, :cond_3

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/Lexer;->isHexDigit(C)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 425
    :cond_1
    if-lez v1, :cond_2

    .line 426
    goto :goto_2

    .line 428
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "unexepcted "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v4

    .end local v0    # "s":Ljava/lang/StringBuilder;
    throw v4

    .line 422
    .restart local v0    # "s":Ljava/lang/StringBuilder;
    :cond_3
    :goto_1
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 423
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 424
    add-int/lit8 v1, v1, 0x1

    .line 429
    .end local v3    # "la":C
    goto :goto_0

    .line 430
    :cond_4
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v4, :cond_5

    .line 433
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    return-object v3

    .line 432
    .end local v1    # "lc":I
    :catchall_0
    move-exception v1

    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_6

    .line 433
    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v1
.end method

.method private local_phone_number(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    .locals 7
    .param p1, "inBrackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 499
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "local_phone_number"

    if-eqz v0, :cond_0

    .line 500
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 501
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;-><init>()V

    .line 502
    .local v0, "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setGlobal(Z)V

    .line 503
    const/4 v2, 0x0

    .line 504
    .local v2, "nv":Landroid/gov/nist/core/NameValueList;
    const/4 v3, 0x0

    .line 506
    .local v3, "b":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->local_number()Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    .line 507
    invoke-virtual {v0, v3}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setPhoneNumber(Ljava/lang/String;)V

    .line 508
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 509
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4}, Landroid/gov/nist/core/LexerCore;->peekNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 510
    .local v4, "tok":Landroid/gov/nist/core/Token;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 513
    :pswitch_0
    if-eqz p1, :cond_1

    .line 514
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 515
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->tel_parameters()Landroid/gov/nist/core/NameValueList;

    move-result-object v5

    move-object v2, v5

    .line 516
    invoke-virtual {v0, v2}, Landroid/gov/nist/javax/sip/address/TelephoneNumber;->setParameters(Landroid/gov/nist/core/NameValueList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    .end local v4    # "tok":Landroid/gov/nist/core/Token;
    :cond_1
    :goto_0
    sget-boolean v4, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v4, :cond_2

    .line 528
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    .line 530
    :cond_2
    return-object v0

    .line 527
    :catchall_0
    move-exception v4

    sget-boolean v5, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v5, :cond_3

    .line 528
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v4

    :pswitch_data_0
    .packed-switch 0x3b
        :pswitch_0
    .end packed-switch
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 810
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "sip:alice@example.com"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "sips:alice@examples.com"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "sip:3Zqkv5dajqaaas0tCjCxT0xH2ZEuEMsFl0xoasip%3A%2B3519116786244%40siplab.domain.com@213.0.115.163:7070"

    aput-object v2, v0, v1

    .line 814
    .local v0, "test":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 816
    new-instance v2, Landroid/gov/nist/javax/sip/parser/URLParser;

    aget-object v3, v0, v1

    invoke-direct {v2, v3}, Landroid/gov/nist/javax/sip/parser/URLParser;-><init>(Ljava/lang/String;)V

    .line 818
    .local v2, "p":Landroid/gov/nist/javax/sip/parser/URLParser;
    invoke-virtual {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->parse()Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v3

    .line 819
    .local v3, "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "uri type returned "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 820
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v6, v0, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is SipUri? "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/address/GenericURI;->isSipURI()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ">"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/address/GenericURI;->encode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 814
    .end local v2    # "p":Landroid/gov/nist/javax/sip/parser/URLParser;
    .end local v3    # "uri":Landroid/gov/nist/javax/sip/address/GenericURI;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 823
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private phone_context()Landroid/gov/nist/core/NameValue;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 570
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 572
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 574
    .local v0, "la":C
    const/16 v2, 0x2b

    if-ne v0, v2, :cond_0

    .line 575
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 576
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->base_phone_number()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .local v2, "value":Ljava/lang/Object;
    goto :goto_0

    .line 577
    .end local v2    # "value":Ljava/lang/Object;
    :cond_0
    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/Lexer;->isAlphaDigit(C)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 578
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v3, 0xfff

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 579
    .local v2, "t":Landroid/gov/nist/core/Token;
    invoke-virtual {v2}, Landroid/gov/nist/core/Token;->getTokenValue()Ljava/lang/String;

    move-result-object v2

    .line 580
    .local v2, "value":Ljava/lang/Object;
    nop

    .line 583
    :goto_0
    new-instance v3, Landroid/gov/nist/core/NameValue;

    const-string/jumbo v4, "phone-context"

    invoke-direct {v3, v4, v2, v1}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    return-object v3

    .line 581
    .end local v2    # "value":Ljava/lang/Object;
    :cond_1
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid phone-context:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private tel_parameters()Landroid/gov/nist/core/NameValueList;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 534
    new-instance v0, Landroid/gov/nist/core/NameValueList;

    invoke-direct {v0}, Landroid/gov/nist/core/NameValueList;-><init>()V

    .line 540
    .local v0, "nvList":Landroid/gov/nist/core/NameValueList;
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->paramNameOrValue()Ljava/lang/String;

    move-result-object v1

    .line 543
    .local v1, "pname":Ljava/lang/String;
    const-string/jumbo v2, "phone-context"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    .line 544
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->phone_context()Landroid/gov/nist/core/NameValue;

    move-result-object v2

    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    goto :goto_1

    .line 546
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    const/16 v5, 0x3d

    if-ne v2, v5, :cond_1

    .line 547
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 548
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->paramNameOrValue()Ljava/lang/String;

    move-result-object v2

    .line 549
    .local v2, "value":Ljava/lang/String;
    new-instance v5, Landroid/gov/nist/core/NameValue;

    invoke-direct {v5, v1, v2, v4}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    move-object v2, v5

    .line 550
    .local v2, "nv":Landroid/gov/nist/core/NameValue;
    goto :goto_1

    .line 551
    .end local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :cond_1
    new-instance v2, Landroid/gov/nist/core/NameValue;

    const-string v5, ""

    invoke-direct {v2, v1, v5, v3}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 554
    .restart local v2    # "nv":Landroid/gov/nist/core/NameValue;
    :goto_1
    invoke-virtual {v0, v2}, Landroid/gov/nist/core/NameValueList;->set(Landroid/gov/nist/core/NameValue;)V

    .line 556
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v4

    const/16 v5, 0x3b

    if-ne v4, v5, :cond_2

    .line 557
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v4, v3}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 561
    .end local v1    # "pname":Ljava/lang/String;
    goto :goto_0

    .line 559
    .restart local v1    # "pname":Ljava/lang/String;
    :cond_2
    return-object v0
.end method

.method private uriParam()Landroid/gov/nist/core/NameValue;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 153
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "uriParam"

    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 156
    :cond_0
    :try_start_0
    const-string v0, ""

    .line 157
    .local v0, "pvalue":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->paramNameOrValue()Ljava/lang/String;

    move-result-object v2

    .line 158
    .local v2, "pname":Ljava/lang/String;
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 159
    .local v3, "next":C
    const/4 v4, 0x1

    .line 160
    .local v4, "isFlagParam":Z
    const/16 v5, 0x3d

    if-ne v3, v5, :cond_1

    .line 161
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 162
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->paramNameOrValue()Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    .line 163
    const/4 v4, 0x0

    .line 165
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_4

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v5, :cond_4

    .line 168
    :cond_2
    nop

    .line 171
    sget-boolean v5, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v5, :cond_3

    .line 172
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    const/4 v1, 0x0

    return-object v1

    .line 169
    :cond_4
    :try_start_1
    new-instance v5, Landroid/gov/nist/core/NameValue;

    invoke-direct {v5, v2, v0, v4}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    sget-boolean v6, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v6, :cond_5

    .line 172
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    return-object v5

    .line 171
    .end local v0    # "pvalue":Ljava/lang/String;
    .end local v2    # "pname":Ljava/lang/String;
    .end local v3    # "next":C
    .end local v4    # "isFlagParam":Z
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_6

    .line 172
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_6
    throw v0
.end method


# virtual methods
.method protected escaped()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 214
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "escaped"

    if-eqz v0, :cond_0

    .line 215
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 217
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .local v0, "retval":Ljava/lang/StringBuilder;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 219
    .local v2, "next":C
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v3

    .line 220
    .local v3, "next1":C
    iget-object v4, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v4

    .line 221
    .local v4, "next2":C
    const/16 v5, 0x25

    if-ne v2, v5, :cond_2

    invoke-static {v3}, Landroid/gov/nist/javax/sip/parser/Lexer;->isHexDigit(C)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v4}, Landroid/gov/nist/javax/sip/parser/Lexer;->isHexDigit(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 224
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 225
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 226
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 227
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 230
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    sget-boolean v6, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v6, :cond_1

    .line 233
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v5

    .line 229
    :cond_2
    :try_start_1
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 232
    .end local v0    # "retval":Ljava/lang/StringBuilder;
    .end local v2    # "next":C
    .end local v3    # "next1":C
    .end local v4    # "next2":C
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_3

    .line 233
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v0
.end method

.method protected hvalue()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 692
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 693
    .local v0, "retval":Ljava/lang/StringBuilder;
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 694
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 696
    .local v1, "la":C
    const/4 v2, 0x0

    .line 697
    .local v2, "isValidChar":Z
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 714
    :sswitch_0
    const/4 v2, 0x1

    .line 716
    :goto_1
    if-nez v2, :cond_1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/Lexer;->isAlphaDigit(C)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    .line 719
    :cond_0
    const/16 v3, 0x25

    if-ne v1, v3, :cond_2

    .line 720
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->escaped()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 717
    :cond_1
    :goto_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 718
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 723
    .end local v1    # "la":C
    .end local v2    # "isValidChar":Z
    :goto_3
    goto :goto_0

    .line 724
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_0
        0x22 -> :sswitch_0
        0x24 -> :sswitch_0
        0x28 -> :sswitch_0
        0x29 -> :sswitch_0
        0x2a -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3f -> :sswitch_0
        0x5b -> :sswitch_0
        0x5d -> :sswitch_0
        0x5f -> :sswitch_0
        0x7e -> :sswitch_0
    .end sparse-switch
.end method

.method protected isEscaped()Z
    .locals 4

    .line 205
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1, v0}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    const/16 v2, 0x25

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/Lexer;->isHexDigit(C)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/Lexer;->isHexDigit(C)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    move v0, v2

    :cond_0
    return v0

    .line 208
    :catch_0
    move-exception v1

    .line 209
    .local v1, "ex":Ljava/lang/Exception;
    return v0
.end method

.method protected mark()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 238
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "mark"

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 241
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 242
    .local v0, "next":C
    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isMark(C)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 243
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 244
    new-instance v3, Ljava/lang/String;

    new-array v4, v4, [C

    aput-char v0, v4, v2

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([C)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_1

    .line 249
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v3

    .line 246
    :cond_2
    :try_start_1
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    .end local v0    # "next":C
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_3

    .line 249
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    throw v0
.end method

.method protected paramNameOrValue()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 128
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v0

    .line 129
    .local v0, "startIdx":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 130
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 131
    .local v1, "next":C
    const/4 v2, 0x0

    .line 132
    .local v2, "isValidChar":Z
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 140
    :sswitch_0
    const/4 v2, 0x1

    .line 142
    :goto_1
    if-nez v2, :cond_1

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUnreserved(C)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    .line 144
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isEscaped()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 145
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_3

    .line 143
    :cond_1
    :goto_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 148
    .end local v1    # "next":C
    .end local v2    # "isValidChar":Z
    :goto_3
    goto :goto_0

    .line 149
    :cond_2
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x24 -> :sswitch_0
        0x26 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x5b -> :sswitch_0
        0x5d -> :sswitch_0
    .end sparse-switch
.end method

.method public parse()Landroid/gov/nist/javax/sip/address/GenericURI;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 803
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;

    move-result-object v0

    return-object v0
.end method

.method public final parseTelephoneNumber(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    .locals 4
    .param p1, "inBrackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 447
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "telephone_subscriber"

    if-eqz v0, :cond_0

    .line 448
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 449
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v2, "charLexer"

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 451
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 452
    .local v0, "c":C
    const/16 v2, 0x2b

    if-ne v0, v2, :cond_1

    .line 453
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;->global_phone_number(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    move-result-object v2

    .local v2, "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    goto :goto_1

    .line 454
    .end local v2    # "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    :cond_1
    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/Lexer;->isHexDigit(C)Z

    move-result v2

    if-nez v2, :cond_3

    const/16 v2, 0x23

    if-eq v0, v2, :cond_3

    const/16 v2, 0x2a

    if-eq v0, v2, :cond_3

    const/16 v2, 0x2d

    if-eq v0, v2, :cond_3

    const/16 v2, 0x2e

    if-eq v0, v2, :cond_3

    const/16 v2, 0x28

    if-eq v0, v2, :cond_3

    const/16 v2, 0x29

    if-ne v0, v2, :cond_2

    goto :goto_0

    .line 464
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unexpected char "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v2

    .end local p1    # "inBrackets":Z
    throw v2

    .line 462
    .restart local p1    # "inBrackets":Z
    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;->local_phone_number(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 465
    .restart local v2    # "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    :goto_1
    nop

    .line 467
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_4

    .line 468
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v2

    .line 467
    .end local v0    # "c":C
    .end local v2    # "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_5

    .line 468
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v0
.end method

.method protected password()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 775
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v0

    .line 777
    .local v0, "startIdx":I
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 778
    .local v1, "la":C
    const/4 v2, 0x0

    .line 779
    .local v2, "isValidChar":Z
    sparse-switch v1, :sswitch_data_0

    goto :goto_1

    .line 785
    :sswitch_0
    const/4 v2, 0x1

    .line 787
    :goto_1
    if-nez v2, :cond_2

    invoke-static {v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUnreserved(C)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    .line 789
    :cond_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isEscaped()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 790
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_3

    .line 796
    .end local v1    # "la":C
    .end local v2    # "isValidChar":Z
    :cond_1
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 788
    .restart local v1    # "la":C
    .restart local v2    # "isValidChar":Z
    :cond_2
    :goto_2
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 795
    .end local v1    # "la":C
    .end local v2    # "isValidChar":Z
    :goto_3
    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x24 -> :sswitch_0
        0x26 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2c -> :sswitch_0
        0x3d -> :sswitch_0
    .end sparse-switch
.end method

.method public peekScheme()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 676
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->getString(C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected qheader()Landroid/gov/nist/core/NameValue;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 684
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->getNextToken(C)Ljava/lang/String;

    move-result-object v0

    .line 685
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 686
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->hvalue()Ljava/lang/String;

    move-result-object v1

    .line 687
    .local v1, "value":Ljava/lang/String;
    new-instance v2, Landroid/gov/nist/core/NameValue;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Landroid/gov/nist/core/NameValue;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    return-object v2
.end method

.method protected reserved()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 195
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 196
    .local v0, "next":C
    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isReserved(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 197
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 200
    :cond_0
    const-string/jumbo v1, "reserved"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method

.method public sipURL(Z)Landroid/gov/nist/javax/sip/address/SipUri;
    .locals 16
    .param p1, "inBrackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 606
    move-object/from16 v1, p0

    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v2, "sipURL"

    if-eqz v0, :cond_0

    .line 607
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 608
    :cond_0
    new-instance v0, Landroid/gov/nist/javax/sip/address/SipUri;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/address/SipUri;-><init>()V

    move-object v3, v0

    .line 610
    .local v3, "retval":Landroid/gov/nist/javax/sip/address/SipUri;
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->peekNextToken()Landroid/gov/nist/core/Token;

    move-result-object v4

    .line 611
    .local v4, "nextToken":Landroid/gov/nist/core/Token;
    const/16 v0, 0x803

    .line 612
    .local v0, "sipOrSips":I
    const-string/jumbo v5, "sip"

    .line 613
    .local v5, "scheme":Ljava/lang/String;
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v6

    const/16 v7, 0x858

    if-ne v6, v7, :cond_1

    .line 615
    const/16 v0, 0x858

    .line 616
    const-string/jumbo v5, "sips"

    move-object v6, v5

    move v5, v0

    goto :goto_0

    .line 613
    :cond_1
    move-object v6, v5

    move v5, v0

    .line 620
    .end local v0    # "sipOrSips":I
    .local v5, "sipOrSips":I
    .local v6, "scheme":Ljava/lang/String;
    :goto_0
    :try_start_0
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0, v5}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 621
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v7, 0x3a

    invoke-virtual {v0, v7}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 622
    invoke-virtual {v3, v6}, Landroid/gov/nist/javax/sip/address/SipUri;->setScheme(Ljava/lang/String;)V

    .line 623
    iget-object v0, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->markInputPosition()I

    move-result v0

    .line 624
    .local v0, "startOfUser":I
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->user()Ljava/lang/String;

    move-result-object v8

    .line 625
    .local v8, "userOrHost":Ljava/lang/String;
    const/4 v9, 0x0

    .line 628
    .local v9, "passOrPort":Ljava/lang/String;
    iget-object v10, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v10}, Landroid/gov/nist/core/LexerCore;->lookAhead()C

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v7, :cond_2

    .line 629
    iget-object v7, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v11}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 630
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->password()Ljava/lang/String;

    move-result-object v7

    move-object v9, v7

    .line 634
    :cond_2
    iget-object v7, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7}, Landroid/gov/nist/core/LexerCore;->lookAhead()C

    move-result v7

    const/16 v10, 0x40

    if-ne v7, v10, :cond_3

    .line 635
    iget-object v7, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v11}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 636
    invoke-virtual {v3, v8}, Landroid/gov/nist/javax/sip/address/SipUri;->setUser(Ljava/lang/String;)V

    .line 637
    if-eqz v9, :cond_4

    invoke-virtual {v3, v9}, Landroid/gov/nist/javax/sip/address/SipUri;->setUserPassword(Ljava/lang/String;)V

    goto :goto_1

    .line 640
    :cond_3
    iget-object v7, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v7, v0}, Landroid/gov/nist/core/LexerCore;->rewindInputPosition(I)V

    .line 643
    :cond_4
    :goto_1
    new-instance v7, Landroid/gov/nist/core/HostNameParser;

    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v10

    invoke-direct {v7, v10}, Landroid/gov/nist/core/HostNameParser;-><init>(Landroid/gov/nist/core/LexerCore;)V

    .line 644
    .local v7, "hnp":Landroid/gov/nist/core/HostNameParser;
    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Landroid/gov/nist/core/HostNameParser;->hostPort(Z)Landroid/gov/nist/core/HostPort;

    move-result-object v12

    .line 645
    .local v12, "hp":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v3, v12}, Landroid/gov/nist/javax/sip/address/SipUri;->setHostPort(Landroid/gov/nist/core/HostPort;)V

    .line 647
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v14, "charLexer"

    invoke-virtual {v13, v14}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 648
    :goto_2
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 650
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13, v10}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v13

    const/16 v14, 0x3b

    if-ne v13, v14, :cond_7

    if-nez p1, :cond_5

    .line 651
    goto :goto_3

    .line 652
    :cond_5
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13, v11}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 653
    invoke-direct/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->uriParam()Landroid/gov/nist/core/NameValue;

    move-result-object v13

    .line 654
    .local v13, "parms":Landroid/gov/nist/core/NameValue;
    if-eqz v13, :cond_6

    invoke-virtual {v3, v13}, Landroid/gov/nist/javax/sip/address/SipUri;->setUriParameter(Landroid/gov/nist/core/NameValue;)V

    .line 655
    .end local v13    # "parms":Landroid/gov/nist/core/NameValue;
    :cond_6
    goto :goto_2

    .line 657
    :cond_7
    :goto_3
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v13

    if-eqz v13, :cond_9

    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13, v10}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v13

    const/16 v14, 0x3f

    if-ne v13, v14, :cond_9

    .line 658
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13, v11}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 659
    :goto_4
    iget-object v13, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v13}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v13

    if-eqz v13, :cond_9

    .line 660
    invoke-virtual/range {p0 .. p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->qheader()Landroid/gov/nist/core/NameValue;

    move-result-object v13

    .line 661
    .restart local v13    # "parms":Landroid/gov/nist/core/NameValue;
    invoke-virtual {v3, v13}, Landroid/gov/nist/javax/sip/address/SipUri;->setQHeader(Landroid/gov/nist/core/NameValue;)V

    .line 662
    iget-object v14, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v14}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v14

    if-eqz v14, :cond_8

    iget-object v14, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v14, v10}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v14

    const/16 v15, 0x26

    if-eq v14, v15, :cond_8

    .line 663
    goto :goto_5

    .line 665
    :cond_8
    iget-object v14, v1, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v14, v11}, Landroid/gov/nist/core/LexerCore;->consume(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 666
    .end local v13    # "parms":Landroid/gov/nist/core/NameValue;
    goto :goto_4

    .line 668
    :cond_9
    :goto_5
    nop

    .line 670
    sget-boolean v10, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v10, :cond_a

    .line 671
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_a
    return-object v3

    .line 670
    .end local v0    # "startOfUser":I
    .end local v7    # "hnp":Landroid/gov/nist/core/HostNameParser;
    .end local v8    # "userOrHost":Ljava/lang/String;
    .end local v9    # "passOrPort":Ljava/lang/String;
    .end local v12    # "hp":Landroid/gov/nist/core/HostPort;
    :catchall_0
    move-exception v0

    sget-boolean v7, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v7, :cond_b

    .line 671
    invoke-virtual {v1, v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_b
    throw v0
.end method

.method public telURL(Z)Landroid/gov/nist/javax/sip/address/TelURLImpl;
    .locals 2
    .param p1, "inBrackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 591
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x839

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 592
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->match(I)Landroid/gov/nist/core/Token;

    .line 593
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;->parseTelephoneNumber(Z)Landroid/gov/nist/javax/sip/address/TelephoneNumber;

    move-result-object v0

    .line 594
    .local v0, "tn":Landroid/gov/nist/javax/sip/address/TelephoneNumber;
    new-instance v1, Landroid/gov/nist/javax/sip/address/TelURLImpl;

    invoke-direct {v1}, Landroid/gov/nist/javax/sip/address/TelURLImpl;-><init>()V

    .line 595
    .local v1, "telUrl":Landroid/gov/nist/javax/sip/address/TelURLImpl;
    invoke-virtual {v1, v0}, Landroid/gov/nist/javax/sip/address/TelURLImpl;->setTelephoneNumber(Landroid/gov/nist/javax/sip/address/TelephoneNumber;)V

    .line 596
    return-object v1
.end method

.method protected unreserved()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v0

    .line 117
    .local v0, "next":C
    invoke-static {v0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUnreserved(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 119
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 121
    :cond_0
    const-string/jumbo v1, "unreserved"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v1

    throw v1
.end method

.method public uriReference(Z)Landroid/gov/nist/javax/sip/address/GenericURI;
    .locals 9
    .param p1, "inBrackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 336
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "uriReference"

    if-eqz v0, :cond_0

    .line 337
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 338
    :cond_0
    const/4 v0, 0x0

    .line 339
    .local v0, "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->peekNextToken(I)[Landroid/gov/nist/core/Token;

    move-result-object v2

    .line 340
    .local v2, "tokens":[Landroid/gov/nist/core/Token;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    .line 341
    .local v3, "t1":Landroid/gov/nist/core/Token;
    const/4 v4, 0x1

    aget-object v4, v2, v4

    .line 344
    .local v4, "t2":Landroid/gov/nist/core/Token;
    :try_start_0
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v6, 0x803

    const-string v7, "Expecting \':\'"

    const/16 v8, 0x3a

    if-eq v5, v6, :cond_4

    :try_start_1
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v5

    const/16 v6, 0x858

    if-ne v5, v6, :cond_1

    goto :goto_0

    .line 350
    :cond_1
    invoke-virtual {v3}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v5

    const/16 v6, 0x839

    if-ne v5, v6, :cond_3

    .line 351
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v5

    if-ne v5, v8, :cond_2

    .line 352
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;->telURL(Z)Landroid/gov/nist/javax/sip/address/TelURLImpl;

    move-result-object v5

    move-object v0, v5

    goto :goto_1

    .line 354
    :cond_2
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    .end local v2    # "tokens":[Landroid/gov/nist/core/Token;
    .end local v3    # "t1":Landroid/gov/nist/core/Token;
    .end local v4    # "t2":Landroid/gov/nist/core/Token;
    .end local p1    # "inBrackets":Z
    throw v5

    .line 356
    .restart local v0    # "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    .restart local v2    # "tokens":[Landroid/gov/nist/core/Token;
    .restart local v3    # "t1":Landroid/gov/nist/core/Token;
    .restart local v4    # "t2":Landroid/gov/nist/core/Token;
    .restart local p1    # "inBrackets":Z
    :cond_3
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->uricString()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 358
    .local v5, "urlString":Ljava/lang/String;
    :try_start_2
    new-instance v6, Landroid/gov/nist/javax/sip/address/GenericURI;

    invoke-direct {v6, v5}, Landroid/gov/nist/javax/sip/address/GenericURI;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v0, v6

    .line 361
    goto :goto_1

    .line 359
    :catch_0
    move-exception v6

    .line 360
    .local v6, "ex":Ljava/text/ParseException;
    :try_start_3
    invoke-virtual {v6}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v7

    .end local v0    # "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    .end local v2    # "tokens":[Landroid/gov/nist/core/Token;
    .end local v3    # "t1":Landroid/gov/nist/core/Token;
    .end local v4    # "t2":Landroid/gov/nist/core/Token;
    .end local p1    # "inBrackets":Z
    throw v7

    .line 346
    .end local v5    # "urlString":Ljava/lang/String;
    .end local v6    # "ex":Ljava/text/ParseException;
    .restart local v0    # "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    .restart local v2    # "tokens":[Landroid/gov/nist/core/Token;
    .restart local v3    # "t1":Landroid/gov/nist/core/Token;
    .restart local v4    # "t2":Landroid/gov/nist/core/Token;
    .restart local p1    # "inBrackets":Z
    :cond_4
    :goto_0
    invoke-virtual {v4}, Landroid/gov/nist/core/Token;->getTokenType()I

    move-result v5

    if-ne v5, v8, :cond_6

    .line 347
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/parser/URLParser;->sipURL(Z)Landroid/gov/nist/javax/sip/address/SipUri;

    move-result-object v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v0, v5

    .line 364
    :goto_1
    sget-boolean v5, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v5, :cond_5

    .line 365
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    .line 367
    :cond_5
    return-object v0

    .line 349
    :cond_6
    :try_start_4
    invoke-virtual {p0, v7}, Landroid/gov/nist/javax/sip/parser/URLParser;->createParseException(Ljava/lang/String;)Ljava/text/ParseException;

    move-result-object v5

    .end local v0    # "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    .end local v2    # "tokens":[Landroid/gov/nist/core/Token;
    .end local v3    # "t1":Landroid/gov/nist/core/Token;
    .end local v4    # "t2":Landroid/gov/nist/core/Token;
    .end local p1    # "inBrackets":Z
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 364
    .restart local v0    # "retval":Landroid/gov/nist/javax/sip/address/GenericURI;
    .restart local v2    # "tokens":[Landroid/gov/nist/core/Token;
    .restart local v3    # "t1":Landroid/gov/nist/core/Token;
    .restart local v4    # "t2":Landroid/gov/nist/core/Token;
    .restart local p1    # "inBrackets":Z
    :catchall_0
    move-exception v5

    sget-boolean v6, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v6, :cond_7

    .line 365
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_7
    throw v5
.end method

.method protected uric()Ljava/lang/String;
    .locals 6

    .line 254
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "uric"

    if-eqz v0, :cond_0

    .line 255
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 258
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 259
    .local v2, "la":C
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUnreserved(C)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    .line 260
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 261
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/Lexer;->charAsString(C)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_1

    .line 276
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 262
    :cond_2
    :try_start_1
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->isReserved(C)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 263
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 264
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/Lexer;->charAsString(C)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 275
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_3

    .line 276
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 265
    :cond_4
    :try_start_2
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isEscaped()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 266
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->charAsString(I)Ljava/lang/String;

    move-result-object v3

    .line 267
    .local v3, "retval":Ljava/lang/String;
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 268
    nop

    .line 275
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v0, :cond_5

    .line 276
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    return-object v3

    .line 270
    .end local v3    # "retval":Ljava/lang/String;
    :cond_6
    nop

    .line 275
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_7

    .line 276
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_7
    return-object v0

    .line 275
    .end local v2    # "la":C
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_8

    .line 276
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_8
    throw v0

    .line 271
    :catch_0
    move-exception v2

    .line 272
    .local v2, "ex":Ljava/lang/Exception;
    nop

    .line 275
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_9

    .line 276
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_9
    return-object v0
.end method

.method protected uricNoSlash()Ljava/lang/String;
    .locals 6

    .line 282
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "uricNoSlash"

    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 286
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 287
    .local v2, "la":C
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isEscaped()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 288
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->charAsString(I)Ljava/lang/String;

    move-result-object v3

    .line 289
    .local v3, "retval":Ljava/lang/String;
    iget-object v5, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v5, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    nop

    .line 303
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v0, :cond_1

    .line 304
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_1
    return-object v3

    .line 291
    .end local v3    # "retval":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUnreserved(C)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    .line 292
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 293
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/Lexer;->charAsString(C)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 303
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_3

    .line 304
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_3
    return-object v0

    .line 294
    :cond_4
    :try_start_2
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->isReservedNoSlash(C)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 295
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 296
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/Lexer;->charAsString(C)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 303
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_5

    .line 304
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    return-object v0

    .line 298
    :cond_6
    nop

    .line 303
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_7

    .line 304
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_7
    return-object v0

    .line 303
    .end local v2    # "la":C
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_8

    .line 304
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_8
    throw v0

    .line 299
    :catch_0
    move-exception v2

    .line 300
    .local v2, "ex":Ljava/text/ParseException;
    nop

    .line 303
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_9

    .line 304
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_9
    return-object v0
.end method

.method protected uricString()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .local v0, "retval":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->uric()Ljava/lang/String;

    move-result-object v1

    .line 312
    .local v1, "next":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 313
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 316
    .local v2, "la":C
    const/16 v4, 0x5b

    if-ne v2, v4, :cond_0

    .line 317
    new-instance v4, Landroid/gov/nist/core/HostNameParser;

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->getLexer()Landroid/gov/nist/javax/sip/parser/Lexer;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/gov/nist/core/HostNameParser;-><init>(Landroid/gov/nist/core/LexerCore;)V

    .line 318
    .local v4, "hnp":Landroid/gov/nist/core/HostNameParser;
    invoke-virtual {v4, v3}, Landroid/gov/nist/core/HostNameParser;->hostPort(Z)Landroid/gov/nist/core/HostPort;

    move-result-object v3

    .line 319
    .local v3, "hp":Landroid/gov/nist/core/HostPort;
    invoke-virtual {v3}, Landroid/gov/nist/core/HostPort;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    goto :goto_0

    .line 326
    .end local v1    # "next":Ljava/lang/String;
    .end local v2    # "la":C
    .end local v3    # "hp":Landroid/gov/nist/core/HostPort;
    .end local v4    # "hnp":Landroid/gov/nist/core/HostNameParser;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 324
    .restart local v1    # "next":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .end local v1    # "next":Ljava/lang/String;
    goto :goto_0
.end method

.method protected urlString()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 734
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 735
    .local v0, "retval":Ljava/lang/StringBuilder;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const-string/jumbo v2, "charLexer"

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->selectLexer(Ljava/lang/String;)V

    .line 737
    :goto_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v1}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 738
    iget-object v1, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v1

    .line 740
    .local v1, "la":C
    const/16 v3, 0x20

    if-eq v1, v3, :cond_1

    const/16 v3, 0x9

    if-eq v1, v3, :cond_1

    const/16 v3, 0xa

    if-eq v1, v3, :cond_1

    const/16 v3, 0x3e

    if-eq v1, v3, :cond_1

    const/16 v3, 0x3c

    if-ne v1, v3, :cond_0

    .line 745
    goto :goto_1

    .line 746
    :cond_0
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3, v2}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 747
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 748
    .end local v1    # "la":C
    goto :goto_0

    .line 749
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected user()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 753
    sget-boolean v0, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    const-string/jumbo v1, "user"

    if-eqz v0, :cond_0

    .line 754
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_enter(Ljava/lang/String;)V

    .line 756
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v0}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v0

    .line 757
    .local v0, "startIdx":I
    :goto_0
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->hasMoreChars()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 758
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/gov/nist/core/LexerCore;->lookAhead(I)C

    move-result v2

    .line 759
    .local v2, "la":C
    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUnreserved(C)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v2}, Landroid/gov/nist/javax/sip/parser/URLParser;->isUserUnreserved(C)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    .line 761
    :cond_1
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/parser/URLParser;->isEscaped()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 762
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    goto :goto_2

    .line 760
    :cond_2
    :goto_1
    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/gov/nist/core/LexerCore;->consume(I)V

    .line 765
    .end local v2    # "la":C
    :goto_2
    goto :goto_0

    .line 766
    :cond_3
    iget-object v2, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v2}, Landroid/gov/nist/core/LexerCore;->getBuffer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/gov/nist/javax/sip/parser/URLParser;->lexer:Landroid/gov/nist/core/LexerCore;

    invoke-virtual {v3}, Landroid/gov/nist/core/LexerCore;->getPtr()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 768
    sget-boolean v3, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v3, :cond_4

    .line 769
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_4
    return-object v2

    .line 768
    .end local v0    # "startIdx":I
    :catchall_0
    move-exception v0

    sget-boolean v2, Landroid/gov/nist/javax/sip/parser/URLParser;->debug:Z

    if-eqz v2, :cond_5

    .line 769
    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/parser/URLParser;->dbg_leave(Ljava/lang/String;)V

    :cond_5
    throw v0
.end method
