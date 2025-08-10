.class public Landroid/gov/nist/javax/sdp/fields/SDPFormat;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "SDPFormat.java"


# instance fields
.field protected format:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    .line 53
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/SDPFormat;->format:Ljava/lang/String;

    .line 54
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFormat;->format:Ljava/lang/String;

    return-object v0
.end method

.method public getFormat()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPFormat;->format:Ljava/lang/String;

    return-object v0
.end method

.method public setFormat(Ljava/lang/String;)V
    .locals 0
    .param p1, "fmt"    # Ljava/lang/String;

    .line 45
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/SDPFormat;->format:Ljava/lang/String;

    .line 46
    return-void
.end method
