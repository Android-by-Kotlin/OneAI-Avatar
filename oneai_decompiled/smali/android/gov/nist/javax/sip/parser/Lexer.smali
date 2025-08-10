.class public Landroid/gov/nist/javax/sip/parser/Lexer;
.super Landroid/gov/nist/core/LexerCore;
.source "Lexer.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lexerName"    # Ljava/lang/String;
    .param p2, "buffer"    # Ljava/lang/String;

    .line 144
    invoke-direct {p0, p1, p2}, Landroid/gov/nist/core/LexerCore;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    invoke-virtual {p0, p1}, Landroid/gov/nist/javax/sip/parser/Lexer;->selectLexer(Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public static getHeaderName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "line"    # Ljava/lang/String;

    .line 129
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 130
    return-object v0

    .line 131
    :cond_0
    const/4 v1, 0x0

    .line 133
    .local v1, "headerName":Ljava/lang/String;
    :try_start_0
    const-string v2, ":"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 134
    .local v2, "begin":I
    const/4 v1, 0x0

    .line 135
    const/4 v3, 0x1

    if-lt v2, v3, :cond_1

    .line 136
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    .line 139
    .end local v2    # "begin":I
    :cond_1
    nop

    .line 140
    return-object v1

    .line 137
    :catch_0
    move-exception v2

    .line 138
    .local v2, "e":Ljava/lang/IndexOutOfBoundsException;
    return-object v0
.end method

.method public static getHeaderValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "line"    # Ljava/lang/String;

    .line 154
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 155
    return-object v0

    .line 156
    :cond_0
    const/4 v1, 0x0

    .line 158
    .local v1, "headerValue":Ljava/lang/String;
    :try_start_0
    const-string v2, ":"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 159
    .local v2, "begin":I
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v1    # "headerValue":Ljava/lang/String;
    .end local v2    # "begin":I
    .local v0, "headerValue":Ljava/lang/String;
    nop

    .line 163
    return-object v0

    .line 160
    .end local v0    # "headerValue":Ljava/lang/String;
    .restart local v1    # "headerValue":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 161
    .local v2, "e":Ljava/lang/IndexOutOfBoundsException;
    return-object v0
.end method


# virtual methods
.method public selectLexer(Ljava/lang/String;)V
    .locals 16
    .param p1, "lexerName"    # Ljava/lang/String;

    .line 168
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Landroid/gov/nist/javax/sip/parser/Lexer;->lexerTables:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 169
    .local v2, "lexer":Ljava/util/concurrent/ConcurrentHashMap;, "Ljava/util/concurrent/ConcurrentHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    iput-object v1, v0, Landroid/gov/nist/javax/sip/parser/Lexer;->currentLexerName:Ljava/lang/String;

    .line 170
    if-nez v2, :cond_6

    .line 171
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 173
    .local v3, "newLexer":Ljava/util/concurrent/ConcurrentHashMap;, "Ljava/util/concurrent/ConcurrentHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    iput-object v3, v0, Landroid/gov/nist/javax/sip/parser/Lexer;->currentLexer:Ljava/util/Map;

    .line 175
    const-string/jumbo v4, "method_keywordLexer"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x858

    const-string/jumbo v6, "sips"

    const/16 v7, 0x803

    const-string/jumbo v8, "sip"

    if-eqz v4, :cond_0

    .line 176
    const-string/jumbo v4, "REGISTER"

    const/16 v9, 0x804

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 177
    const-string v4, "ACK"

    const/16 v9, 0x806

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 178
    const-string v4, "OPTIONS"

    const/16 v9, 0x808

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 179
    const-string v4, "BYE"

    const/16 v9, 0x807

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 180
    const-string v4, "INVITE"

    const/16 v9, 0x805

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 181
    invoke-virtual {v0, v8, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 182
    invoke-virtual {v0, v6, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 183
    const-string/jumbo v4, "SUBSCRIBE"

    const/16 v5, 0x835

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 184
    const-string v4, "NOTIFY"

    const/16 v5, 0x836

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 185
    const-string v4, "MESSAGE"

    const/16 v5, 0x846

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 188
    const-string/jumbo v4, "PUBLISH"

    const/16 v5, 0x843

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 190
    :cond_0
    const-string/jumbo v4, "command_keywordLexer"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 191
    const-string v4, "Error-Info"

    const/16 v5, 0x80a

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 193
    const-string v4, "Allow-Events"

    const/16 v5, 0x841

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 195
    const-string v4, "Authentication-Info"

    const/16 v6, 0x840

    invoke-virtual {v0, v4, v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 197
    const-string v4, "Event"

    const/16 v6, 0x83f

    invoke-virtual {v0, v4, v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 198
    const-string v4, "Min-Expires"

    const/16 v7, 0x83e

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 200
    const-string/jumbo v4, "RSeq"

    const/16 v7, 0x83c

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 201
    const-string/jumbo v4, "RAck"

    const/16 v7, 0x83d

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 202
    const-string/jumbo v4, "Reason"

    const/16 v7, 0x83b

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 204
    const-string/jumbo v4, "Reply-To"

    const/16 v7, 0x83a

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 206
    const-string/jumbo v4, "Subscription-State"

    const/16 v7, 0x838

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 208
    const-string/jumbo v4, "Timestamp"

    const/16 v7, 0x837

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 210
    const-string v4, "In-Reply-To"

    const/16 v7, 0x80b

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 212
    const-string v4, "MIME-Version"

    const/16 v7, 0x80c

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 214
    const-string v4, "Alert-Info"

    const/16 v7, 0x80d

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 216
    const-string v4, "From"

    const/16 v7, 0x80e

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 217
    const-string/jumbo v4, "To"

    const/16 v8, 0x80f

    invoke-virtual {v0, v4, v8}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 218
    const-string/jumbo v4, "Refer-To"

    const/16 v9, 0x842

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 220
    const-string/jumbo v4, "Via"

    const/16 v10, 0x810

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 221
    const-string/jumbo v4, "User-Agent"

    const/16 v11, 0x811

    invoke-virtual {v0, v4, v11}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 223
    const-string/jumbo v4, "Server"

    const/16 v11, 0x812

    invoke-virtual {v0, v4, v11}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 225
    const-string v4, "Accept-Encoding"

    const/16 v11, 0x813

    invoke-virtual {v0, v4, v11}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 227
    const-string v4, "Accept"

    const/16 v11, 0x814

    invoke-virtual {v0, v4, v11}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 229
    const-string v4, "Allow"

    const/16 v12, 0x815

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 230
    const-string/jumbo v4, "Route"

    const/16 v12, 0x816

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 231
    const-string v4, "Authorization"

    const/16 v12, 0x817

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 233
    const-string/jumbo v4, "Proxy-Authorization"

    const/16 v12, 0x818

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 235
    const-string/jumbo v4, "Retry-After"

    const/16 v12, 0x819

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 237
    const-string/jumbo v4, "Proxy-Require"

    const/16 v12, 0x81a

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 239
    const-string v4, "Content-Language"

    const/16 v12, 0x81b

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 241
    const-string/jumbo v4, "Unsupported"

    const/16 v12, 0x81c

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 243
    const-string/jumbo v4, "Supported"

    invoke-virtual {v0, v4, v11}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 245
    const-string/jumbo v4, "Warning"

    const/16 v12, 0x81e

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 247
    const-string v4, "Max-Forwards"

    const/16 v12, 0x81f

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 249
    const-string v4, "Date"

    const/16 v12, 0x820

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 250
    const-string/jumbo v4, "Priority"

    const/16 v12, 0x821

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 252
    const-string/jumbo v4, "Proxy-Authenticate"

    const/16 v12, 0x822

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 254
    const-string v4, "Content-Encoding"

    const/16 v12, 0x823

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 256
    const-string v4, "Content-Length"

    const/16 v13, 0x824

    invoke-virtual {v0, v4, v13}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 258
    const-string/jumbo v4, "Subject"

    const/16 v14, 0x825

    invoke-virtual {v0, v4, v14}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 260
    const-string v4, "Content-Type"

    const/16 v15, 0x826

    invoke-virtual {v0, v4, v15}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 262
    const-string v4, "Contact"

    const/16 v6, 0x827

    invoke-virtual {v0, v4, v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 264
    const-string v4, "Call-ID"

    const/16 v9, 0x828

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 266
    const-string/jumbo v4, "Require"

    const/16 v10, 0x829

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 268
    const-string v4, "Expires"

    const/16 v10, 0x82a

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 270
    const-string/jumbo v4, "Record-Route"

    const/16 v10, 0x82c

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 272
    const-string v4, "Organization"

    const/16 v10, 0x82d

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 274
    const-string v4, "CSeq"

    const/16 v10, 0x82e

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 275
    const-string v4, "Accept-Language"

    const/16 v10, 0x82f

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 277
    const-string/jumbo v4, "WWW-Authenticate"

    const/16 v10, 0x830

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 279
    const-string v4, "Call-Info"

    const/16 v10, 0x833

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 281
    const-string v4, "Content-Disposition"

    const/16 v10, 0x834

    invoke-virtual {v0, v4, v10}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 284
    const-string v4, "K"

    invoke-virtual {v0, v4, v11}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 285
    const-string v4, "C"

    invoke-virtual {v0, v4, v15}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 287
    const-string v4, "E"

    invoke-virtual {v0, v4, v12}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 289
    const-string v4, "F"

    invoke-virtual {v0, v4, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 290
    const-string v4, "I"

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 291
    const-string v4, "M"

    invoke-virtual {v0, v4, v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 292
    const-string v4, "L"

    invoke-virtual {v0, v4, v13}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 294
    const-string/jumbo v4, "S"

    invoke-virtual {v0, v4, v14}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 295
    const-string/jumbo v4, "T"

    invoke-virtual {v0, v4, v8}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 296
    const-string/jumbo v4, "U"

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 298
    const-string/jumbo v4, "V"

    const/16 v5, 0x810

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 299
    const-string/jumbo v4, "R"

    const/16 v5, 0x842

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 300
    const-string v4, "O"

    const/16 v5, 0x83f

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 305
    const-string/jumbo v4, "X"

    const/16 v5, 0x855

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 308
    const-string/jumbo v4, "SIP-ETag"

    const/16 v6, 0x844

    invoke-virtual {v0, v4, v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 310
    const-string/jumbo v4, "SIP-If-Match"

    const/16 v6, 0x845

    invoke-virtual {v0, v4, v6}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 314
    const-string/jumbo v4, "Session-Expires"

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 316
    const-string v4, "Min-SE"

    const/16 v5, 0x856

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 318
    const-string/jumbo v4, "Referred-By"

    const/16 v5, 0x854

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 322
    const-string/jumbo v4, "Replaces"

    const/16 v5, 0x857

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 325
    const-string v4, "Join"

    const/16 v5, 0x85c

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 329
    const-string/jumbo v4, "Path"

    const/16 v5, 0x847

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 330
    const-string/jumbo v4, "Service-Route"

    const/16 v5, 0x848

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 332
    const-string/jumbo v4, "P-Asserted-Identity"

    const/16 v5, 0x849

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 334
    const-string/jumbo v4, "P-Preferred-Identity"

    const/16 v5, 0x84a

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 336
    const-string/jumbo v4, "Privacy"

    const/16 v5, 0x84e

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 340
    const-string/jumbo v4, "P-Called-Party-ID"

    const/16 v5, 0x850

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 342
    const-string/jumbo v4, "P-Associated-URI"

    const/16 v5, 0x851

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 344
    const-string/jumbo v4, "P-Visited-Network-ID"

    const/16 v5, 0x84b

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 346
    const-string/jumbo v4, "P-Charging-Function-Addresses"

    const/16 v5, 0x84c

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 348
    const-string/jumbo v4, "P-Charging-Vector"

    const/16 v5, 0x84d

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 350
    const-string/jumbo v4, "P-Access-Network-Info"

    const/16 v5, 0x84f

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 352
    const-string/jumbo v4, "P-Media-Authorization"

    const/16 v5, 0x852

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 355
    const-string/jumbo v4, "Security-Server"

    const/16 v5, 0x859

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 357
    const-string/jumbo v4, "Security-Verify"

    const/16 v5, 0x85b

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 359
    const-string/jumbo v4, "Security-Client"

    const/16 v5, 0x85a

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 363
    const-string/jumbo v4, "P-User-Database"

    const/16 v5, 0x85d    # 3.0E-42f

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 367
    const-string/jumbo v4, "P-Profile-Key"

    const/16 v5, 0x85e

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 371
    const-string/jumbo v4, "P-Served-User"

    const/16 v5, 0x85f

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 375
    const-string/jumbo v4, "P-Preferred-Service"

    const/16 v5, 0x860

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 379
    const-string/jumbo v4, "P-Asserted-Service"

    const/16 v5, 0x861

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 383
    const-string/jumbo v4, "References"

    const/16 v5, 0x862

    invoke-virtual {v0, v4, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    goto :goto_0

    .line 388
    :cond_1
    const-string/jumbo v4, "status_lineLexer"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 389
    invoke-virtual {v0, v8, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    goto :goto_0

    .line 390
    :cond_2
    const-string/jumbo v4, "request_lineLexer"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 391
    invoke-virtual {v0, v8, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    goto :goto_0

    .line 392
    :cond_3
    const-string/jumbo v4, "sip_urlLexer"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 393
    const-string/jumbo v4, "tel"

    const/16 v9, 0x839

    invoke-virtual {v0, v4, v9}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 394
    invoke-virtual {v0, v8, v7}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 395
    invoke-virtual {v0, v6, v5}, Landroid/gov/nist/javax/sip/parser/Lexer;->addKeyword(Ljava/lang/String;I)V

    .line 400
    :cond_4
    :goto_0
    sget-object v4, Landroid/gov/nist/javax/sip/parser/Lexer;->lexerTables:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v2, v4

    check-cast v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 401
    if-nez v2, :cond_5

    .line 403
    move-object v2, v3

    .line 405
    :cond_5
    iput-object v2, v0, Landroid/gov/nist/javax/sip/parser/Lexer;->currentLexer:Ljava/util/Map;

    .line 406
    .end local v3    # "newLexer":Ljava/util/concurrent/ConcurrentHashMap;, "Ljava/util/concurrent/ConcurrentHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    goto :goto_1

    .line 407
    :cond_6
    iput-object v2, v0, Landroid/gov/nist/javax/sip/parser/Lexer;->currentLexer:Ljava/util/Map;

    .line 409
    :goto_1
    return-void
.end method
