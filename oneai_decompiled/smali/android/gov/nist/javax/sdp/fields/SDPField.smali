.class public abstract Landroid/gov/nist/javax/sdp/fields/SDPField;
.super Landroid/gov/nist/javax/sdp/fields/SDPObject;
.source "SDPField.java"


# instance fields
.field protected fieldName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    .line 66
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "hname"    # Ljava/lang/String;

    .line 47
    invoke-direct {p0}, Landroid/gov/nist/javax/sdp/fields/SDPObject;-><init>()V

    .line 48
    iput-object p1, p0, Landroid/gov/nist/javax/sdp/fields/SDPField;->fieldName:Ljava/lang/String;

    .line 49
    return-void
.end method


# virtual methods
.method public abstract encode()Ljava/lang/String;
.end method

.method public getFieldName()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPField;->fieldName:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeChar()C
    .locals 2

    .line 59
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPField;->fieldName:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 60
    return v1

    .line 62
    :cond_0
    iget-object v0, p0, Landroid/gov/nist/javax/sdp/fields/SDPField;->fieldName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 69
    invoke-virtual {p0}, Landroid/gov/nist/javax/sdp/fields/SDPField;->encode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
