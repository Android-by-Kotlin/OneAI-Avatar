.class public Landroid/support/v4/media/session/MediaSessionCompat;
.super Ljava/lang/Object;
.source "MediaSessionCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaSessionCompat$RegistrationCallbackHandler;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi29;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi22;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi21;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi19;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi18;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplBase;,
        Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;,
        Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;,
        Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;,
        Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;,
        Landroid/support/v4/media/session/MediaSessionCompat$Token;,
        Landroid/support/v4/media/session/MediaSessionCompat$RegistrationCallback;,
        Landroid/support/v4/media/session/MediaSessionCompat$Callback;
    }
.end annotation


# static fields
.field public static final ACTION_ARGUMENT_CAPTIONING_ENABLED:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_CAPTIONING_ENABLED"

.field public static final ACTION_ARGUMENT_EXTRAS:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_EXTRAS"

.field public static final ACTION_ARGUMENT_MEDIA_ID:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_MEDIA_ID"

.field public static final ACTION_ARGUMENT_PLAYBACK_SPEED:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_PLAYBACK_SPEED"

.field public static final ACTION_ARGUMENT_QUERY:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_QUERY"

.field public static final ACTION_ARGUMENT_RATING:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_RATING"

.field public static final ACTION_ARGUMENT_REPEAT_MODE:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_REPEAT_MODE"

.field public static final ACTION_ARGUMENT_SHUFFLE_MODE:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_SHUFFLE_MODE"

.field public static final ACTION_ARGUMENT_URI:Ljava/lang/String; = "android.support.v4.media.session.action.ARGUMENT_URI"

.field public static final ACTION_FLAG_AS_INAPPROPRIATE:Ljava/lang/String; = "android.support.v4.media.session.action.FLAG_AS_INAPPROPRIATE"

.field public static final ACTION_FOLLOW:Ljava/lang/String; = "android.support.v4.media.session.action.FOLLOW"

.field public static final ACTION_PLAY_FROM_URI:Ljava/lang/String; = "android.support.v4.media.session.action.PLAY_FROM_URI"

.field public static final ACTION_PREPARE:Ljava/lang/String; = "android.support.v4.media.session.action.PREPARE"

.field public static final ACTION_PREPARE_FROM_MEDIA_ID:Ljava/lang/String; = "android.support.v4.media.session.action.PREPARE_FROM_MEDIA_ID"

.field public static final ACTION_PREPARE_FROM_SEARCH:Ljava/lang/String; = "android.support.v4.media.session.action.PREPARE_FROM_SEARCH"

.field public static final ACTION_PREPARE_FROM_URI:Ljava/lang/String; = "android.support.v4.media.session.action.PREPARE_FROM_URI"

.field public static final ACTION_SET_CAPTIONING_ENABLED:Ljava/lang/String; = "android.support.v4.media.session.action.SET_CAPTIONING_ENABLED"

.field public static final ACTION_SET_PLAYBACK_SPEED:Ljava/lang/String; = "android.support.v4.media.session.action.SET_PLAYBACK_SPEED"

.field public static final ACTION_SET_RATING:Ljava/lang/String; = "android.support.v4.media.session.action.SET_RATING"

.field public static final ACTION_SET_REPEAT_MODE:Ljava/lang/String; = "android.support.v4.media.session.action.SET_REPEAT_MODE"

.field public static final ACTION_SET_SHUFFLE_MODE:Ljava/lang/String; = "android.support.v4.media.session.action.SET_SHUFFLE_MODE"

.field public static final ACTION_SKIP_AD:Ljava/lang/String; = "android.support.v4.media.session.action.SKIP_AD"

.field public static final ACTION_UNFOLLOW:Ljava/lang/String; = "android.support.v4.media.session.action.UNFOLLOW"

.field public static final ARGUMENT_MEDIA_ATTRIBUTE:Ljava/lang/String; = "android.support.v4.media.session.ARGUMENT_MEDIA_ATTRIBUTE"

.field public static final ARGUMENT_MEDIA_ATTRIBUTE_VALUE:Ljava/lang/String; = "android.support.v4.media.session.ARGUMENT_MEDIA_ATTRIBUTE_VALUE"

.field private static final DATA_CALLING_PACKAGE:Ljava/lang/String; = "data_calling_pkg"

.field private static final DATA_CALLING_PID:Ljava/lang/String; = "data_calling_pid"

.field private static final DATA_CALLING_UID:Ljava/lang/String; = "data_calling_uid"

.field private static final DATA_EXTRAS:Ljava/lang/String; = "data_extras"

.field public static final FLAG_HANDLES_MEDIA_BUTTONS:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FLAG_HANDLES_QUEUE_COMMANDS:I = 0x4

.field public static final FLAG_HANDLES_TRANSPORT_CONTROLS:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final KEY_EXTRA_BINDER:Ljava/lang/String; = "android.support.v4.media.session.EXTRA_BINDER"

.field public static final KEY_SESSION2_TOKEN:Ljava/lang/String; = "android.support.v4.media.session.SESSION_TOKEN2"

.field public static final KEY_TOKEN:Ljava/lang/String; = "android.support.v4.media.session.TOKEN"

.field private static final MAX_BITMAP_SIZE_IN_DP:I = 0x140

.field public static final MEDIA_ATTRIBUTE_ALBUM:I = 0x1

.field public static final MEDIA_ATTRIBUTE_ARTIST:I = 0x0

.field public static final MEDIA_ATTRIBUTE_PLAYLIST:I = 0x2

.field static final TAG:Ljava/lang/String; = "MediaSessionCompat"

.field static sMaxBitmapSize:I


# instance fields
.field private final mActiveListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mController:Landroid/support/v4/media/session/MediaControllerCompat;

.field private final mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "impl"    # Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    .line 597
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mActiveListeners:Ljava/util/ArrayList;

    .line 598
    iput-object p2, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    .line 599
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat;

    invoke-direct {v0, p1, p0}, Landroid/support/v4/media/session/MediaControllerCompat;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mController:Landroid/support/v4/media/session/MediaControllerCompat;

    .line 600
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;

    .line 468
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;)V

    .line 469
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "mbrComponent"    # Landroid/content/ComponentName;
    .param p4, "mbrIntent"    # Landroid/app/PendingIntent;

    .line 494
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;Landroid/os/Bundle;)V

    .line 495
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "mbrComponent"    # Landroid/content/ComponentName;
    .param p4, "mbrIntent"    # Landroid/app/PendingIntent;
    .param p5, "sessionInfo"    # Landroid/os/Bundle;

    .line 530
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;Landroid/os/Bundle;Landroidx/versionedparcelable/VersionedParcelable;)V

    .line 531
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/ComponentName;Landroid/app/PendingIntent;Landroid/os/Bundle;Landroidx/versionedparcelable/VersionedParcelable;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "mbrComponent"    # Landroid/content/ComponentName;
    .param p4, "mbrIntent"    # Landroid/app/PendingIntent;
    .param p5, "sessionInfo"    # Landroid/os/Bundle;
    .param p6, "session2Token"    # Landroidx/versionedparcelable/VersionedParcelable;

    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mActiveListeners:Ljava/util/ArrayList;

    .line 540
    if-eqz p1, :cond_7

    .line 543
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 547
    if-nez p3, :cond_0

    .line 548
    invoke-static {p1}, Landroidx/media/session/MediaButtonReceiver;->getMediaButtonReceiverComponent(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object p3

    .line 549
    if-nez p3, :cond_0

    .line 550
    const-string v0, "MediaSessionCompat"

    const-string v1, "Couldn\'t find a unique registered media button receiver in the given context."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    :cond_0
    if-eqz p3, :cond_2

    if-nez p4, :cond_2

    .line 556
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MEDIA_BUTTON"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 558
    .local v0, "mediaButtonIntent":Landroid/content/Intent;
    invoke-virtual {v0, p3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 559
    nop

    .line 561
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    const/4 v3, 0x0

    if-lt v1, v2, :cond_1

    const/high16 v1, 0x2000000

    goto :goto_0

    :cond_1
    move v1, v3

    .line 559
    :goto_0
    invoke-static {p1, v3, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p4

    .line 564
    .end local v0    # "mediaButtonIntent":Landroid/content/Intent;
    :cond_2
    nop

    .line 565
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_3

    .line 566
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi29;

    invoke-direct {v0, p1, p2, p6, p5}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi29;-><init>(Landroid/content/Context;Ljava/lang/String;Landroidx/versionedparcelable/VersionedParcelable;Landroid/os/Bundle;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    goto :goto_1

    .line 567
    :cond_3
    nop

    .line 568
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;

    invoke-direct {v0, p1, p2, p6, p5}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;-><init>(Landroid/content/Context;Ljava/lang/String;Landroidx/versionedparcelable/VersionedParcelable;Landroid/os/Bundle;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    .line 575
    :goto_1
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 576
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    goto :goto_2

    :cond_4
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    :goto_2
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 577
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Landroid/support/v4/media/session/MediaSessionCompat$1;

    invoke-direct {v1, p0}, Landroid/support/v4/media/session/MediaSessionCompat$1;-><init>(Landroid/support/v4/media/session/MediaSessionCompat;)V

    invoke-virtual {p0, v1, v0}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/os/Handler;)V

    .line 578
    iget-object v1, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v1, p4}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setMediaButtonReceiver(Landroid/app/PendingIntent;)V

    .line 579
    .end local v0    # "handler":Landroid/os/Handler;
    nop

    .line 589
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat;

    invoke-direct {v0, p1, p0}, Landroid/support/v4/media/session/MediaControllerCompat;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mController:Landroid/support/v4/media/session/MediaControllerCompat;

    .line 591
    sget v0, Landroid/support/v4/media/session/MediaSessionCompat;->sMaxBitmapSize:I

    if-nez v0, :cond_5

    .line 592
    nop

    .line 593
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 592
    const/4 v1, 0x1

    const/high16 v2, 0x43a00000    # 320.0f

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    sput v0, Landroid/support/v4/media/session/MediaSessionCompat;->sMaxBitmapSize:I

    .line 595
    :cond_5
    return-void

    .line 544
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "tag must not be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 541
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "context must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static ensureClassLoader(Landroid/os/Bundle;)V
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 1064
    if-eqz p0, :cond_0

    .line 1065
    const-class v0, Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 1067
    :cond_0
    return-void
.end method

.method public static fromMediaSession(Landroid/content/Context;Ljava/lang/Object;)Landroid/support/v4/media/session/MediaSessionCompat;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mediaSession"    # Ljava/lang/Object;

    .line 1042
    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_1

    .line 1046
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    .line 1047
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi29;

    invoke-direct {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi29;-><init>(Ljava/lang/Object;)V

    .local v0, "impl":Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;
    goto :goto_0

    .line 1048
    .end local v0    # "impl":Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;
    :cond_1
    nop

    .line 1049
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;

    invoke-direct {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;-><init>(Ljava/lang/Object;)V

    .line 1054
    .restart local v0    # "impl":Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;
    :goto_0
    new-instance v1, Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-direct {v1, p0, v0}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;)V

    return-object v1

    .line 1043
    .end local v0    # "impl":Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;
    :cond_2
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method static getStateWithUpdatedPosition(Landroid/support/v4/media/session/PlaybackStateCompat;Landroid/support/v4/media/MediaMetadataCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;
    .locals 18
    .param p0, "state"    # Landroid/support/v4/media/session/PlaybackStateCompat;
    .param p1, "metadata"    # Landroid/support/v4/media/MediaMetadataCompat;

    .line 1096
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v0, :cond_6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPosition()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    goto/16 :goto_2

    .line 1100
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    .line 1101
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_1

    .line 1102
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_5

    .line 1103
    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getLastPositionUpdateTime()J

    move-result-wide v2

    .line 1104
    .local v2, "updateTime":J
    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_5

    .line 1105
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v14

    .line 1106
    .local v14, "currentTime":J
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPlaybackSpeed()F

    move-result v6

    sub-long v7, v14, v2

    long-to-float v7, v7

    mul-float/2addr v6, v7

    float-to-long v6, v6

    .line 1107
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPosition()J

    move-result-wide v8

    add-long/2addr v6, v8

    .line 1108
    .local v6, "position":J
    const-wide/16 v8, -0x1

    .line 1109
    .local v8, "duration":J
    if-eqz v1, :cond_2

    const-string/jumbo v10, "android.media.metadata.DURATION"

    invoke-virtual {v1, v10}, Landroid/support/v4/media/MediaMetadataCompat;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 1111
    invoke-virtual {v1, v10}, Landroid/support/v4/media/MediaMetadataCompat;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    move-wide/from16 v16, v8

    goto :goto_0

    .line 1114
    :cond_2
    move-wide/from16 v16, v8

    .end local v8    # "duration":J
    .local v16, "duration":J
    :goto_0
    cmp-long v8, v16, v4

    if-ltz v8, :cond_3

    cmp-long v8, v6, v16

    if-lez v8, :cond_3

    .line 1115
    move-wide/from16 v6, v16

    move-wide v4, v6

    goto :goto_1

    .line 1116
    :cond_3
    cmp-long v4, v6, v4

    if-gez v4, :cond_4

    .line 1117
    const-wide/16 v6, 0x0

    move-wide v4, v6

    goto :goto_1

    .line 1116
    :cond_4
    move-wide v4, v6

    .line 1119
    .end local v6    # "position":J
    .local v4, "position":J
    :goto_1
    new-instance v7, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    invoke-direct {v7, v0}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;-><init>(Landroid/support/v4/media/session/PlaybackStateCompat;)V

    .line 1120
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getPlaybackSpeed()F

    move-result v11

    move-wide v9, v4

    move-wide v12, v14

    invoke-virtual/range {v7 .. v13}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJFJ)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    move-result-object v6

    .line 1121
    invoke-virtual {v6}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v6

    .line 1119
    return-object v6

    .line 1124
    .end local v2    # "updateTime":J
    .end local v4    # "position":J
    .end local v14    # "currentTime":J
    .end local v16    # "duration":J
    :cond_5
    return-object v0

    .line 1097
    :cond_6
    :goto_2
    return-object v0
.end method

.method public static unparcelWithClassLoader(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 4
    .param p0, "bundle"    # Landroid/os/Bundle;

    .line 1079
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1080
    return-object v0

    .line 1082
    :cond_0
    invoke-static {p0}, Landroid/support/v4/media/session/MediaSessionCompat;->ensureClassLoader(Landroid/os/Bundle;)V

    .line 1084
    :try_start_0
    invoke-virtual {p0}, Landroid/os/Bundle;->isEmpty()Z
    :try_end_0
    .catch Landroid/os/BadParcelableException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1085
    return-object p0

    .line 1086
    :catch_0
    move-exception v1

    .line 1088
    .local v1, "e":Landroid/os/BadParcelableException;
    const-string v2, "MediaSessionCompat"

    const-string v3, "Could not unparcel the data."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1089
    return-object v0
.end method


# virtual methods
.method public addOnActiveChangeListener(Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;

    .line 1006
    if-eqz p1, :cond_0

    .line 1009
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mActiveListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1010
    return-void

    .line 1007
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Listener may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCallingPackage()Ljava/lang/String;
    .locals 1

    .line 995
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->getCallingPackage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getController()Landroid/support/v4/media/session/MediaControllerCompat;
    .locals 1

    .line 801
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mController:Landroid/support/v4/media/session/MediaControllerCompat;

    return-object v0
.end method

.method public final getCurrentControllerInfo()Landroidx/media/MediaSessionManager$RemoteUserInfo;
    .locals 1

    .line 983
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->getCurrentControllerInfo()Landroidx/media/MediaSessionManager$RemoteUserInfo;

    move-result-object v0

    return-object v0
.end method

.method public getMediaSession()Ljava/lang/Object;
    .locals 1

    .line 945
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->getMediaSession()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteControlClient()Ljava/lang/Object;
    .locals 1

    .line 959
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->getRemoteControlClient()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;
    .locals 1

    .line 791
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v0

    return-object v0
.end method

.method public isActive()Z
    .locals 1

    .line 749
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->isActive()Z

    move-result v0

    return v0
.end method

.method public release()V
    .locals 1

    .line 773
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->release()V

    .line 774
    return-void
.end method

.method public removeOnActiveChangeListener(Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;

    .line 1019
    if-eqz p1, :cond_0

    .line 1022
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mActiveListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1023
    return-void

    .line 1020
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Listener may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sendSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .line 761
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 764
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->sendSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 765
    return-void

    .line 762
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "event cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActive(Z)V
    .locals 2
    .param p1, "active"    # Z

    .line 737
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setActive(Z)V

    .line 738
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mActiveListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;

    .line 739
    .local v1, "listener":Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;
    invoke-interface {v1}, Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;->onActiveChanged()V

    .line 740
    .end local v1    # "listener":Landroid/support/v4/media/session/MediaSessionCompat$OnActiveChangeListener;
    goto :goto_0

    .line 741
    :cond_0
    return-void
.end method

.method public setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V
    .locals 1
    .param p1, "callback"    # Landroid/support/v4/media/session/MediaSessionCompat$Callback;

    .line 613
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/os/Handler;)V

    .line 614
    return-void
.end method

.method public setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/os/Handler;)V
    .locals 2
    .param p1, "callback"    # Landroid/support/v4/media/session/MediaSessionCompat$Callback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 629
    if-nez p1, :cond_0

    .line 630
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    const/4 v1, 0x0

    invoke-interface {v0, v1, v1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/os/Handler;)V

    goto :goto_1

    .line 632
    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    if-eqz p2, :cond_1

    move-object v1, p2

    goto :goto_0

    :cond_1
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    :goto_0
    invoke-interface {v0, p1, v1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/os/Handler;)V

    .line 634
    :goto_1
    return-void
.end method

.method public setCaptioningEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 888
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setCaptioningEnabled(Z)V

    .line 889
    return-void
.end method

.method public setExtras(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "extras"    # Landroid/os/Bundle;

    .line 931
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setExtras(Landroid/os/Bundle;)V

    .line 932
    return-void
.end method

.method public setFlags(I)V
    .locals 1
    .param p1, "flags"    # I

    .line 684
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setFlags(I)V

    .line 685
    return-void
.end method

.method public setMediaButtonReceiver(Landroid/app/PendingIntent;)V
    .locals 1
    .param p1, "mbr"    # Landroid/app/PendingIntent;

    .line 675
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setMediaButtonReceiver(Landroid/app/PendingIntent;)V

    .line 676
    return-void
.end method

.method public setMetadata(Landroid/support/v4/media/MediaMetadataCompat;)V
    .locals 1
    .param p1, "metadata"    # Landroid/support/v4/media/MediaMetadataCompat;

    .line 822
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setMetadata(Landroid/support/v4/media/MediaMetadataCompat;)V

    .line 823
    return-void
.end method

.method public setPlaybackState(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 1
    .param p1, "state"    # Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 810
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setPlaybackState(Landroid/support/v4/media/session/PlaybackStateCompat;)V

    .line 811
    return-void
.end method

.method public setPlaybackToLocal(I)V
    .locals 1
    .param p1, "stream"    # I

    .line 698
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setPlaybackToLocal(I)V

    .line 699
    return-void
.end method

.method public setPlaybackToRemote(Landroidx/media/VolumeProviderCompat;)V
    .locals 2
    .param p1, "volumeProvider"    # Landroidx/media/VolumeProviderCompat;

    .line 717
    if-eqz p1, :cond_0

    .line 720
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setPlaybackToRemote(Landroidx/media/VolumeProviderCompat;)V

    .line 721
    return-void

    .line 718
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "volumeProvider may not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setQueue(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;",
            ">;)V"
        }
    .end annotation

    .line 838
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;>;"
    if-eqz p1, :cond_2

    .line 839
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 840
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;

    .line 841
    .local v2, "item":Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;
    if-eqz v2, :cond_1

    .line 844
    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;->getQueueId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 845
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Found duplicate queue id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;->getQueueId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "id of each queue item should be unique"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    const-string v5, "MediaSessionCompat"

    invoke-static {v5, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 848
    :cond_0
    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;->getQueueId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 849
    .end local v2    # "item":Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;
    goto :goto_0

    .line 842
    .restart local v2    # "item":Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "queue shouldn\'t have null items"

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 851
    .end local v0    # "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .end local v2    # "item":Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;
    :cond_2
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setQueue(Ljava/util/List;)V

    .line 852
    return-void
.end method

.method public setQueueTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 862
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setQueueTitle(Ljava/lang/CharSequence;)V

    .line 863
    return-void
.end method

.method public setRatingType(I)V
    .locals 1
    .param p1, "type"    # I

    .line 879
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setRatingType(I)V

    .line 880
    return-void
.end method

.method public setRegistrationCallback(Landroid/support/v4/media/session/MediaSessionCompat$RegistrationCallback;Landroid/os/Handler;)V
    .locals 1
    .param p1, "callback"    # Landroid/support/v4/media/session/MediaSessionCompat$RegistrationCallback;
    .param p2, "handler"    # Landroid/os/Handler;

    .line 646
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setRegistrationCallback(Landroid/support/v4/media/session/MediaSessionCompat$RegistrationCallback;Landroid/os/Handler;)V

    .line 647
    return-void
.end method

.method public setRepeatMode(I)V
    .locals 1
    .param p1, "repeatMode"    # I

    .line 904
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setRepeatMode(I)V

    .line 905
    return-void
.end method

.method public setSessionActivity(Landroid/app/PendingIntent;)V
    .locals 1
    .param p1, "pi"    # Landroid/app/PendingIntent;

    .line 658
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setSessionActivity(Landroid/app/PendingIntent;)V

    .line 659
    return-void
.end method

.method public setShuffleMode(I)V
    .locals 1
    .param p1, "shuffleMode"    # I

    .line 919
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat;->mImpl:Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImpl;->setShuffleMode(I)V

    .line 920
    return-void
.end method
