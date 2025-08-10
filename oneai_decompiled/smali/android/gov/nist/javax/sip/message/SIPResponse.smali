.class public Landroid/gov/nist/javax/sip/message/SIPResponse;
.super Landroid/gov/nist/javax/sip/message/SIPMessage;
.source "SIPResponse.java"

# interfaces
.implements Landroid/javax/sip/message/Response;
.implements Landroid/gov/nist/javax/sip/message/ResponseExt;


# instance fields
.field private isRetransmission:Z

.field protected statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 364
    invoke-direct {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->isRetransmission:Z

    .line 365
    return-void
.end method

.method public static getReasonPhrase(I)Ljava/lang/String;
    .locals 1
    .param p0, "rc"    # I

    .line 61
    const/4 v0, 0x0

    .line 62
    .local v0, "retval":Ljava/lang/String;
    sparse-switch p0, :sswitch_data_0

    .line 278
    const-string/jumbo v0, "Unknown Status"

    goto/16 :goto_0

    .line 270
    :sswitch_0
    const-string/jumbo v0, "Session Not acceptable"

    .line 271
    goto/16 :goto_0

    .line 266
    :sswitch_1
    const-string v0, "Does not exist anywhere"

    .line 267
    goto/16 :goto_0

    .line 262
    :sswitch_2
    const-string v0, "Decline"

    .line 263
    goto/16 :goto_0

    .line 258
    :sswitch_3
    const-string v0, "Busy everywhere"

    .line 259
    goto/16 :goto_0

    .line 254
    :sswitch_4
    const-string v0, "Message Too Large"

    .line 255
    goto/16 :goto_0

    .line 250
    :sswitch_5
    const-string/jumbo v0, "SIP version not supported"

    .line 251
    goto/16 :goto_0

    .line 246
    :sswitch_6
    const-string v0, "Gateway timeout"

    .line 247
    goto/16 :goto_0

    .line 242
    :sswitch_7
    const-string/jumbo v0, "Service unavailable"

    .line 243
    goto/16 :goto_0

    .line 238
    :sswitch_8
    const-string v0, "Bad gateway"

    .line 239
    goto/16 :goto_0

    .line 234
    :sswitch_9
    const-string v0, "Not implemented"

    .line 235
    goto/16 :goto_0

    .line 226
    :sswitch_a
    const-string/jumbo v0, "Server Internal Error"

    .line 227
    goto/16 :goto_0

    .line 230
    :sswitch_b
    const-string/jumbo v0, "Undecipherable"

    .line 231
    goto/16 :goto_0

    .line 222
    :sswitch_c
    const-string/jumbo v0, "Request Pending"

    .line 223
    goto/16 :goto_0

    .line 218
    :sswitch_d
    const-string v0, "Bad Event"

    .line 219
    goto/16 :goto_0

    .line 214
    :sswitch_e
    const-string v0, "Not Acceptable here"

    .line 215
    goto/16 :goto_0

    .line 209
    :sswitch_f
    const-string/jumbo v0, "Request Terminated"

    .line 210
    goto/16 :goto_0

    .line 205
    :sswitch_10
    const-string v0, "Busy here"

    .line 206
    goto/16 :goto_0

    .line 201
    :sswitch_11
    const-string v0, "Ambiguous"

    .line 202
    goto/16 :goto_0

    .line 197
    :sswitch_12
    const-string v0, "Address incomplete"

    .line 198
    goto/16 :goto_0

    .line 193
    :sswitch_13
    const-string/jumbo v0, "Too many hops"

    .line 194
    goto/16 :goto_0

    .line 189
    :sswitch_14
    const-string v0, "Loop detected"

    .line 190
    goto/16 :goto_0

    .line 185
    :sswitch_15
    const-string v0, "Call leg/Transaction does not exist"

    .line 186
    goto/16 :goto_0

    .line 153
    :sswitch_16
    const-string/jumbo v0, "Temporarily Unavailable"

    .line 154
    goto/16 :goto_0

    .line 181
    :sswitch_17
    const-string v0, "Interval too brief"

    .line 182
    goto/16 :goto_0

    .line 177
    :sswitch_18
    const-string v0, "Etension Required"

    .line 178
    goto/16 :goto_0

    .line 173
    :sswitch_19
    const-string v0, "Bad extension"

    .line 174
    goto/16 :goto_0

    .line 169
    :sswitch_1a
    const-string/jumbo v0, "Unsupported URI Scheme"

    .line 170
    goto/16 :goto_0

    .line 165
    :sswitch_1b
    const-string/jumbo v0, "Unsupported media type"

    .line 166
    goto :goto_0

    .line 161
    :sswitch_1c
    const-string/jumbo v0, "Request-URI too large"

    .line 162
    goto :goto_0

    .line 157
    :sswitch_1d
    const-string/jumbo v0, "Request entity too large"

    .line 158
    goto :goto_0

    .line 274
    :sswitch_1e
    const-string v0, "Conditional request failed"

    .line 275
    goto :goto_0

    .line 149
    :sswitch_1f
    const-string v0, "Gone"

    .line 150
    goto :goto_0

    .line 145
    :sswitch_20
    const-string/jumbo v0, "Request timeout"

    .line 146
    goto :goto_0

    .line 141
    :sswitch_21
    const-string/jumbo v0, "Proxy Authentication required"

    .line 142
    goto :goto_0

    .line 137
    :sswitch_22
    const-string v0, "Not acceptable"

    .line 138
    goto :goto_0

    .line 133
    :sswitch_23
    const-string v0, "Method not allowed"

    .line 134
    goto :goto_0

    .line 129
    :sswitch_24
    const-string v0, "Not found"

    .line 130
    goto :goto_0

    .line 125
    :sswitch_25
    const-string v0, "Forbidden"

    .line 126
    goto :goto_0

    .line 121
    :sswitch_26
    const-string/jumbo v0, "Payment required"

    .line 122
    goto :goto_0

    .line 117
    :sswitch_27
    const-string/jumbo v0, "Unauthorized"

    .line 118
    goto :goto_0

    .line 113
    :sswitch_28
    const-string v0, "Bad request"

    .line 114
    goto :goto_0

    .line 109
    :sswitch_29
    const-string v0, "Alternative service"

    .line 110
    goto :goto_0

    .line 105
    :sswitch_2a
    const-string/jumbo v0, "Use proxy"

    .line 106
    goto :goto_0

    .line 101
    :sswitch_2b
    const-string v0, "Moved Temporarily"

    .line 102
    goto :goto_0

    .line 97
    :sswitch_2c
    const-string v0, "Moved permanently"

    .line 98
    goto :goto_0

    .line 93
    :sswitch_2d
    const-string v0, "Multiple choices"

    .line 94
    goto :goto_0

    .line 89
    :sswitch_2e
    const-string v0, "Accepted"

    .line 90
    goto :goto_0

    .line 85
    :sswitch_2f
    const-string v0, "OK"

    .line 86
    goto :goto_0

    .line 81
    :sswitch_30
    const-string/jumbo v0, "Session progress"

    .line 82
    goto :goto_0

    .line 77
    :sswitch_31
    const-string/jumbo v0, "Queued"

    .line 78
    goto :goto_0

    .line 73
    :sswitch_32
    const-string v0, "Call is being forwarded"

    .line 74
    goto :goto_0

    .line 69
    :sswitch_33
    const-string/jumbo v0, "Ringing"

    .line 70
    goto :goto_0

    .line 65
    :sswitch_34
    const-string/jumbo v0, "Trying"

    .line 66
    nop

    .line 281
    :goto_0
    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_34
        0xb4 -> :sswitch_33
        0xb5 -> :sswitch_32
        0xb6 -> :sswitch_31
        0xb7 -> :sswitch_30
        0xc8 -> :sswitch_2f
        0xca -> :sswitch_2e
        0x12c -> :sswitch_2d
        0x12d -> :sswitch_2c
        0x12e -> :sswitch_2b
        0x131 -> :sswitch_2a
        0x17c -> :sswitch_29
        0x190 -> :sswitch_28
        0x191 -> :sswitch_27
        0x192 -> :sswitch_26
        0x193 -> :sswitch_25
        0x194 -> :sswitch_24
        0x195 -> :sswitch_23
        0x196 -> :sswitch_22
        0x197 -> :sswitch_21
        0x198 -> :sswitch_20
        0x19a -> :sswitch_1f
        0x19c -> :sswitch_1e
        0x19d -> :sswitch_1d
        0x19e -> :sswitch_1c
        0x19f -> :sswitch_1b
        0x1a0 -> :sswitch_1a
        0x1a4 -> :sswitch_19
        0x1a5 -> :sswitch_18
        0x1a7 -> :sswitch_17
        0x1e0 -> :sswitch_16
        0x1e1 -> :sswitch_15
        0x1e2 -> :sswitch_14
        0x1e3 -> :sswitch_13
        0x1e4 -> :sswitch_12
        0x1e5 -> :sswitch_11
        0x1e6 -> :sswitch_10
        0x1e7 -> :sswitch_f
        0x1e8 -> :sswitch_e
        0x1e9 -> :sswitch_d
        0x1eb -> :sswitch_c
        0x1ed -> :sswitch_b
        0x1f4 -> :sswitch_a
        0x1f5 -> :sswitch_9
        0x1f6 -> :sswitch_8
        0x1f7 -> :sswitch_7
        0x1f8 -> :sswitch_6
        0x1f9 -> :sswitch_5
        0x201 -> :sswitch_4
        0x258 -> :sswitch_3
        0x25b -> :sswitch_2
        0x25c -> :sswitch_1
        0x25e -> :sswitch_0
    .end sparse-switch
.end method

.method public static isFinalResponse(I)Z
    .locals 1
    .param p0, "rc"    # I

    .line 343
    const/16 v0, 0xc8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x2bc

    if-ge p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public checkHeaders()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 392
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCSeq()Landroid/javax/sip/header/CSeqHeader;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 395
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getTo()Landroid/javax/sip/header/ToHeader;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 398
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getFrom()Landroid/javax/sip/header/FromHeader;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 401
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getViaHeaders()Landroid/gov/nist/javax/sip/header/ViaList;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 404
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getCallId()Landroid/javax/sip/header/CallIdHeader;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 409
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v0

    const/16 v2, 0x2bb

    if-gt v0, v2, :cond_0

    .line 413
    return-void

    .line 410
    :cond_0
    new-instance v0, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown error code!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->getStatusCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 405
    :cond_1
    new-instance v0, Ljava/text/ParseException;

    const-string v2, "Call-ID Is missing "

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 402
    :cond_2
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v2, "Via Is missing "

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 399
    :cond_3
    new-instance v0, Ljava/text/ParseException;

    const-string v2, "From Is missing "

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 396
    :cond_4
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v2, "To Is missing "

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 393
    :cond_5
    new-instance v0, Ljava/text/ParseException;

    const-string v2, "CSeq Is missing "

    invoke-direct {v0, v2, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public cleanUp()V
    .locals 0

    .line 565
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->cleanUp()V

    .line 566
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 467
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 468
    .local v0, "retval":Landroid/gov/nist/javax/sip/message/SIPResponse;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v1, :cond_0

    .line 469
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/gov/nist/javax/sip/header/StatusLine;

    iput-object v1, v0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    .line 470
    :cond_0
    return-object v0
.end method

.method public debugDump()Ljava/lang/String;
    .locals 2

    .line 375
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->debugDump()Ljava/lang/String;

    move-result-object v0

    .line 376
    .local v0, "superstring":Ljava/lang/String;
    const-string v1, ""

    iput-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->stringRepresentation:Ljava/lang/String;

    .line 377
    const-class v1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->sprint(Ljava/lang/String;)V

    .line 378
    const-string/jumbo v1, "{"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->sprint(Ljava/lang/String;)V

    .line 379
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v1, :cond_0

    .line 380
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;->debugDump()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->sprint(Ljava/lang/String;)V

    .line 382
    :cond_0
    invoke-virtual {p0, v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->sprint(Ljava/lang/String;)V

    .line 383
    const-string/jumbo v1, "}"

    invoke-virtual {p0, v1}, Landroid/gov/nist/javax/sip/message/SIPResponse;->sprint(Ljava/lang/String;)V

    .line 384
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->stringRepresentation:Ljava/lang/String;

    return-object v1
.end method

.method public encode()Ljava/lang/String;
    .locals 2

    .line 422
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v0, :cond_0

    .line 423
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "retval":Ljava/lang/String;
    goto :goto_0

    .line 425
    .end local v0    # "retval":Ljava/lang/String;
    :cond_0
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v0

    .line 426
    .restart local v0    # "retval":Ljava/lang/String;
    :goto_0
    return-object v0
.end method

.method public encodeAsBytes(Ljava/lang/String;)[B
    .locals 6
    .param p1, "transport"    # Ljava/lang/String;

    .line 520
    const/4 v0, 0x0

    .line 521
    .local v0, "slbytes":[B
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v1, :cond_0

    .line 523
    :try_start_0
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;->encode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 526
    goto :goto_0

    .line 524
    :catch_0
    move-exception v1

    .line 525
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v1}, Landroid/gov/nist/core/InternalErrorHandler;->handleException(Ljava/lang/Exception;)V

    .line 528
    .end local v1    # "ex":Ljava/io/UnsupportedEncodingException;
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeAsBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 529
    .local v1, "superbytes":[B
    array-length v2, v0

    array-length v3, v1

    add-int/2addr v2, v3

    new-array v2, v2, [B

    .line 530
    .local v2, "retval":[B
    array-length v3, v0

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 531
    array-length v3, v0

    array-length v5, v1

    invoke-static {v1, v4, v2, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 533
    return-object v2
.end method

.method public encodeMessage(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .param p1, "retval"    # Ljava/lang/StringBuilder;

    .line 436
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->encode(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 438
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeSIPHeaders(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 440
    :cond_0
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encodeSIPHeaders(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 442
    :goto_0
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 479
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 480
    return v1

    .line 481
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 482
    .local v0, "that":Landroid/gov/nist/javax/sip/message/SIPResponse;
    iget-object v2, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    iget-object v3, v0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v2, v3}, Landroid/gov/nist/javax/sip/header/StatusLine;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getFirstLine()Ljava/lang/String;
    .locals 1

    .line 543
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-nez v0, :cond_0

    .line 544
    const/4 v0, 0x0

    return-object v0

    .line 546
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMessageAsEncodedStrings()Ljava/util/LinkedList;
    .locals 2

    .line 453
    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->getMessageAsEncodedStrings()Ljava/util/LinkedList;

    move-result-object v0

    .line 455
    .local v0, "retval":Ljava/util/LinkedList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v1, :cond_0

    .line 456
    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 457
    :cond_0
    return-object v0
.end method

.method public getReasonPhrase()Ljava/lang/String;
    .locals 1

    .line 332
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 335
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 333
    :cond_1
    :goto_0
    const-string v0, ""

    return-object v0
.end method

.method public getSIPVersion()Ljava/lang/String;
    .locals 1

    .line 554
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;->getSipVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .line 313
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public getStatusLine()Landroid/gov/nist/javax/sip/header/StatusLine;
    .locals 1

    .line 306
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    return-object v0
.end method

.method public isFinalResponse()Z
    .locals 1

    .line 350
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;->getStatusCode()I

    move-result v0

    invoke-static {v0}, Landroid/gov/nist/javax/sip/message/SIPResponse;->isFinalResponse(I)Z

    move-result v0

    return v0
.end method

.method public isRetransmission()Z
    .locals 1

    .line 580
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->isRetransmission:Z

    return v0
.end method

.method public match(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "matchObj"    # Ljava/lang/Object;

    .line 491
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 492
    return v0

    .line 493
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 494
    return v2

    .line 495
    :cond_1
    if-ne p1, p0, :cond_2

    .line 496
    return v0

    .line 497
    :cond_2
    move-object v1, p1

    check-cast v1, Landroid/gov/nist/javax/sip/message/SIPResponse;

    .line 499
    .local v1, "that":Landroid/gov/nist/javax/sip/message/SIPResponse;
    iget-object v3, v1, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    .line 500
    .local v3, "rline":Landroid/gov/nist/javax/sip/header/StatusLine;
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-nez v4, :cond_3

    if-eqz v3, :cond_3

    .line 501
    return v2

    .line 502
    :cond_3
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-ne v4, v3, :cond_4

    .line 503
    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->match(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 506
    :cond_4
    iget-object v4, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    iget-object v5, v1, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v4, v5}, Landroid/gov/nist/javax/sip/header/StatusLine;->match(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-super {p0, p1}, Landroid/gov/nist/javax/sip/message/SIPMessage;->match(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_0

    :cond_5
    move v0, v2

    :goto_0
    return v0
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .locals 2
    .param p1, "reasonPhrase"    # Ljava/lang/String;

    .line 321
    if-eqz p1, :cond_1

    .line 323
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-nez v0, :cond_0

    .line 324
    new-instance v0, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    .line 325
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->setReasonPhrase(Ljava/lang/String;)V

    .line 326
    return-void

    .line 322
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad reason phrase"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRetransmission(Z)V
    .locals 0
    .param p1, "isRetransmission"    # Z

    .line 573
    iput-boolean p1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->isRetransmission:Z

    .line 574
    return-void
.end method

.method public setSIPVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "sipVersion"    # Ljava/lang/String;

    .line 550
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->setSipVersion(Ljava/lang/String;)V

    .line 551
    return-void
.end method

.method public setStatusCode(I)V
    .locals 3
    .param p1, "statusCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 294
    const/16 v0, 0x64

    if-lt p1, v0, :cond_1

    const/16 v0, 0x2bb

    if-gt p1, v0, :cond_1

    .line 296
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/StatusLine;-><init>()V

    iput-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    .line 298
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v0, p1}, Landroid/gov/nist/javax/sip/header/StatusLine;->setStatusCode(I)V

    .line 299
    return-void

    .line 295
    :cond_1
    new-instance v0, Ljava/text/ParseException;

    const-string/jumbo v1, "bad status code"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public setStatusLine(Landroid/gov/nist/javax/sip/header/StatusLine;)V
    .locals 0
    .param p1, "sl"    # Landroid/gov/nist/javax/sip/header/StatusLine;

    .line 358
    iput-object p1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    .line 359
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 558
    iget-object v0, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 559
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/gov/nist/javax/sip/message/SIPResponse;->statusLine:Landroid/gov/nist/javax/sip/header/StatusLine;

    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/header/StatusLine;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Landroid/gov/nist/javax/sip/message/SIPMessage;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
