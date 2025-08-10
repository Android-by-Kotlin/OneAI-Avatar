.class public Landroid/gov/nist/javax/sip/stack/DefaultTlsSecurityPolicy;
.super Ljava/lang/Object;
.source "DefaultTlsSecurityPolicy.java"

# interfaces
.implements Landroid/gov/nist/javax/sip/TlsSecurityPolicy;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public enforceTlsPolicy(Landroid/gov/nist/javax/sip/ClientTransactionExt;)V
    .locals 0
    .param p1, "transaction"    # Landroid/gov/nist/javax/sip/ClientTransactionExt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .line 42
    return-void
.end method
