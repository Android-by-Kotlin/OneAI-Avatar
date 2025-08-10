.class Landroid/gov/nist/javax/sdp/fields/Indentation;
.super Ljava/lang/Object;
.source "Indentation.java"


# instance fields
.field private indentation:I


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    .line 38
    return-void
.end method

.method protected constructor <init>(I)V
    .locals 0
    .param p1, "initval"    # I

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    .line 41
    return-void
.end method


# virtual methods
.method protected decrement()V
    .locals 1

    .line 52
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    .line 53
    return-void
.end method

.method protected getCount()I
    .locals 1

    .line 46
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    return v0
.end method

.method protected getIndentation()Ljava/lang/String;
    .locals 2

    .line 55
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    new-array v0, v0, [C

    .line 56
    .local v0, "chars":[C
    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 57
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method protected increment()V
    .locals 1

    .line 49
    iget v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    .line 50
    return-void
.end method

.method protected setIndentation(I)V
    .locals 0
    .param p1, "initval"    # I

    .line 43
    iput p1, p0, Landroid/gov/nist/javax/sdp/fields/Indentation;->indentation:I

    .line 44
    return-void
.end method
