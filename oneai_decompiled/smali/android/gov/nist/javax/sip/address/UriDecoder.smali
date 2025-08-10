.class public Landroid/gov/nist/javax/sip/address/UriDecoder;
.super Ljava/lang/Object;
.source "UriDecoder.java"


# static fields
.field static utf8CharSet:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    const/4 v0, 0x0

    sput-object v0, Landroid/gov/nist/javax/sip/address/UriDecoder;->utf8CharSet:Ljava/nio/charset/Charset;

    .line 43
    :try_start_0
    const-string/jumbo v0, "UTF8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Landroid/gov/nist/javax/sip/address/UriDecoder;->utf8CharSet:Ljava/nio/charset/Charset;
    :try_end_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    nop

    .line 48
    return-void

    .line 44
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/nio/charset/UnsupportedCharsetException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Problem in decodePath: UTF-8 charset not supported."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "uri"    # Ljava/lang/String;

    .line 59
    move-object v0, p0

    .line 60
    .local v0, "uriToWorkOn":Ljava/lang/String;
    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 61
    .local v2, "indexOfNextPercent":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .local v3, "decodedUri":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v4, -0x1

    if-eq v2, v4, :cond_1

    .line 64
    const/4 v4, 0x0

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    add-int/lit8 v5, v2, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_0

    .line 66
    add-int/lit8 v5, v2, 0x1

    add-int/lit8 v6, v2, 0x3

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 68
    .local v5, "hexadecimalString":Ljava/lang/String;
    const/16 v6, 0x10

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v6

    int-to-byte v6, v6

    .line 69
    .local v6, "hexadecimalNumber":B
    sget-object v7, Landroid/gov/nist/javax/sip/address/UriDecoder;->utf8CharSet:Ljava/nio/charset/Charset;

    const/4 v8, 0x1

    new-array v8, v8, [B

    aput-byte v6, v8, v4

    invoke-static {v8}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 70
    .local v4, "correspondingCharacter":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    nop

    .end local v4    # "correspondingCharacter":Ljava/lang/String;
    .end local v6    # "hexadecimalNumber":B
    goto :goto_1

    .line 71
    :catch_0
    move-exception v1

    .line 72
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Illegal hex characters in pattern %"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 75
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v5    # "hexadecimalString":Ljava/lang/String;
    :cond_0
    :goto_1
    add-int/lit8 v4, v2, 0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
