.class public interface abstract Landroid/gov/nist/javax/sip/TransactionExt;
.super Ljava/lang/Object;
.source "TransactionExt.java"

# interfaces
.implements Landroid/javax/sip/Transaction;


# virtual methods
.method public abstract extractCertIdentities()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation
.end method

.method public abstract getCipherSuite()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method

.method public abstract getHost()Ljava/lang/String;
.end method

.method public abstract getLocalCertificates()[Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method

.method public abstract getPeerAddress()Ljava/lang/String;
.end method

.method public abstract getPeerCertificates()[Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation
.end method

.method public abstract getPeerPort()I
.end method

.method public abstract getPort()I
.end method

.method public abstract getReleaseReferencesStrategy()Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;
.end method

.method public abstract getSipProvider()Landroid/javax/sip/SipProvider;
.end method

.method public abstract getTimerD()I
.end method

.method public abstract getTimerT2()I
.end method

.method public abstract getTimerT4()I
.end method

.method public abstract getTransport()Ljava/lang/String;
.end method

.method public abstract setReleaseReferencesStrategy(Landroid/gov/nist/javax/sip/ReleaseReferencesStrategy;)V
.end method

.method public abstract setTimerD(I)V
.end method

.method public abstract setTimerT2(I)V
.end method

.method public abstract setTimerT4(I)V
.end method
