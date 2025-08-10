.class public Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel$SSLReconnectedException;
.super Ljava/io/IOException;
.source "NioTlsWebSocketMessageChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/gov/nist/javax/sip/stack/NioTlsWebSocketMessageChannel;
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

    .line 117
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    return-void
.end method
