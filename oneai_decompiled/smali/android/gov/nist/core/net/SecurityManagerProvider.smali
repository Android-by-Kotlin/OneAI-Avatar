.class public interface abstract Landroid/gov/nist/core/net/SecurityManagerProvider;
.super Ljava/lang/Object;
.source "SecurityManagerProvider.java"


# virtual methods
.method public abstract getKeyManagers(Z)[Ljavax/net/ssl/KeyManager;
.end method

.method public abstract getTrustManagers(Z)[Ljavax/net/ssl/TrustManager;
.end method

.method public abstract init(Ljava/util/Properties;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
