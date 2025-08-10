.class public Landroid/gov/nist/javax/sip/header/ContactList;
.super Landroid/gov/nist/javax/sip/header/SIPHeaderList;
.source "ContactList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/gov/nist/javax/sip/header/SIPHeaderList<",
        "Landroid/gov/nist/javax/sip/header/Contact;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x10ff635463180a3eL


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 55
    const-class v0, Landroid/gov/nist/javax/sip/header/Contact;

    const-string v1, "Contact"

    invoke-direct {p0, v0, v1}, Landroid/gov/nist/javax/sip/header/SIPHeaderList;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 57
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 47
    new-instance v0, Landroid/gov/nist/javax/sip/header/ContactList;

    invoke-direct {v0}, Landroid/gov/nist/javax/sip/header/ContactList;-><init>()V

    .line 48
    .local v0, "retval":Landroid/gov/nist/javax/sip/header/ContactList;
    iget-object v1, p0, Landroid/gov/nist/javax/sip/header/ContactList;->hlist:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/header/ContactList;->clonehlist(Ljava/util/List;)Landroid/gov/nist/javax/sip/header/SIPHeaderList;

    .line 49
    return-object v0
.end method
