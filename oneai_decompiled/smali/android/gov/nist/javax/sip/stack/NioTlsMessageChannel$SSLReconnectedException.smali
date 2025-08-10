.class public Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel$SSLReconnectedException;
.super Ljava/io/IOException;
.source "NioTlsMessageChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsMessageChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SSLReconnectedException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 120
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    return-void
.end method
