.class public Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
.super Ljava/io/FilterInputStream;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputStream"
.end annotation


# instance fields
.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private decodabet:[B

.field private encode:Z

.field private lineLength:I

.field private numSigBytes:I

.field private options:I

.field private position:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;

    .line 1661
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 1662
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "options"    # I

    .line 1687
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1688
    iput p2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->options:I

    .line 1689
    and-int/lit8 v0, p2, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->breakLines:Z

    .line 1690
    and-int/lit8 v0, p2, 0x1

    if-lez v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    iput-boolean v1, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->encode:Z

    .line 1691
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    goto :goto_2

    :cond_2
    const/4 v0, 0x3

    :goto_2
    iput v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->bufferLength:I

    .line 1692
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->bufferLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->buffer:[B

    .line 1693
    const/4 v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    .line 1694
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->lineLength:I

    .line 1695
    invoke-static {p2}, Landroid/gov/nist/javax/sip/stack/Base64;->access$000(I)[B

    move-result-object v0

    iput-object v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->decodabet:[B

    .line 1696
    return-void
.end method


# virtual methods
.method public read()I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1709
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-gez v0, :cond_9

    .line 1710
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->encode:Z

    const/4 v3, 0x4

    if-eqz v0, :cond_2

    .line 1711
    const/4 v0, 0x3

    new-array v10, v0, [B

    .line 1712
    .local v10, "b3":[B
    const/4 v4, 0x0

    .line 1713
    .local v4, "numBinaryBytes":I
    const/4 v5, 0x0

    move v11, v4

    .end local v4    # "numBinaryBytes":I
    .local v5, "i":I
    .local v11, "numBinaryBytes":I
    :goto_0
    if-ge v5, v0, :cond_0

    .line 1714
    iget-object v4, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v4

    .line 1717
    .local v4, "b":I
    if-ltz v4, :cond_0

    .line 1718
    int-to-byte v6, v4

    aput-byte v6, v10, v5

    .line 1719
    nop

    .end local v4    # "b":I
    add-int/lit8 v11, v11, 0x1

    .line 1713
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1726
    .end local v5    # "i":I
    :cond_0
    if-lez v11, :cond_1

    .line 1727
    iget-object v7, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->buffer:[B

    const/4 v8, 0x0

    iget v9, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->options:I

    const/4 v5, 0x0

    move-object v4, v10

    move v6, v11

    invoke-static/range {v4 .. v9}, Landroid/gov/nist/javax/sip/stack/Base64;->access$100([BII[BII)[B

    .line 1728
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    .line 1729
    iput v3, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->numSigBytes:I

    .line 1734
    .end local v10    # "b3":[B
    .end local v11    # "numBinaryBytes":I
    goto :goto_3

    .line 1732
    .restart local v10    # "b3":[B
    .restart local v11    # "numBinaryBytes":I
    :cond_1
    return v1

    .line 1738
    .end local v10    # "b3":[B
    .end local v11    # "numBinaryBytes":I
    :cond_2
    new-array v0, v3, [B

    .line 1739
    .local v0, "b4":[B
    const/4 v4, 0x0

    .line 1740
    .local v4, "i":I
    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_6

    .line 1742
    const/4 v5, 0x0

    .line 1743
    .local v5, "b":I
    :cond_3
    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 1744
    if-ltz v5, :cond_4

    iget-object v6, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->decodabet:[B

    and-int/lit8 v7, v5, 0x7f

    aget-byte v6, v6, v7

    const/4 v7, -0x5

    if-le v6, v7, :cond_3

    .line 1746
    :cond_4
    if-gez v5, :cond_5

    .line 1747
    goto :goto_2

    .line 1750
    :cond_5
    int-to-byte v6, v5

    aput-byte v6, v0, v4

    .line 1740
    .end local v5    # "b":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1753
    :cond_6
    :goto_2
    if-ne v4, v3, :cond_7

    .line 1754
    iget-object v3, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->buffer:[B

    iget v5, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->options:I

    invoke-static {v0, v2, v3, v2, v5}, Landroid/gov/nist/javax/sip/stack/Base64;->access$200([BI[BII)I

    move-result v3

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->numSigBytes:I

    .line 1755
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    goto :goto_3

    .line 1757
    :cond_7
    if-nez v4, :cond_8

    .line 1758
    return v1

    .line 1762
    :cond_8
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Improperly padded Base64 input."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1769
    .end local v0    # "b4":[B
    .end local v4    # "i":I
    :cond_9
    :goto_3
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    if-ltz v0, :cond_d

    .line 1771
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->numSigBytes:I

    if-lt v0, v3, :cond_a

    .line 1772
    return v1

    .line 1775
    :cond_a
    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_b

    iget-boolean v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->breakLines:Z

    if-eqz v0, :cond_b

    iget v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->lineLength:I

    const/16 v3, 0x4c

    if-lt v0, v3, :cond_b

    .line 1776
    iput v2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->lineLength:I

    .line 1777
    const/16 v0, 0xa

    return v0

    .line 1780
    :cond_b
    iget v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->lineLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->lineLength:I

    .line 1784
    iget-object v0, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->buffer:[B

    iget v2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    aget-byte v0, v0, v2

    .line 1786
    .local v0, "b":I
    iget v2, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    iget v3, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->bufferLength:I

    if-lt v2, v3, :cond_c

    .line 1787
    iput v1, p0, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->position:I

    .line 1790
    :cond_c
    and-int/lit16 v1, v0, 0xff

    return v1

    .line 1797
    .end local v0    # "b":I
    :cond_d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Error in Base64 code reading stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([BII)I
    .locals 4
    .param p1, "dest"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1819
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 1820
    invoke-virtual {p0}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->read()I

    move-result v1

    .line 1822
    .local v1, "b":I
    if-ltz v1, :cond_0

    .line 1823
    add-int v2, p2, v0

    int-to-byte v3, v1

    aput-byte v3, p1, v2

    .line 1819
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1825
    :cond_0
    if-nez v0, :cond_1

    .line 1826
    const/4 v2, -0x1

    return v2

    .line 1832
    .end local v1    # "b":I
    :cond_1
    return v0
.end method
