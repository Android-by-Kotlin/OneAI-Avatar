.class public interface abstract Landroid/gov/nist/javax/sip/stack/NioTlsChannelInterface;
.super Ljava/lang/Object;
.source "NioTlsChannelInterface.java"


# virtual methods
.method public abstract addPlaintextBytes([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract getEncapsulatedClientTransaction()Landroid/gov/nist/javax/sip/ClientTransactionExt;
.end method

.method public abstract getSIPStack()Landroid/gov/nist/javax/sip/SipStackImpl;
.end method

.method public abstract prepareAppDataBuffer()Ljava/nio/ByteBuffer;
.end method

.method public abstract prepareAppDataBuffer(I)Ljava/nio/ByteBuffer;
.end method

.method public abstract prepareEncryptedDataBuffer()Ljava/nio/ByteBuffer;
.end method

.method public abstract sendEncryptedData([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
