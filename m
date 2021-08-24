Return-Path: <SRS0=6cBa=NP=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MOG4Kf4dWt4k1eO+WaJXdSfSTDAfUsYtiKjy9vfFkTE=;
        b=EtLMNL8jpFQWJIhKpM/N+1XCzn+rkeyVdIUgmnbsba2E6mR9dUUo3PFCNMzK44sfBq
         EGv/WXRPjbnyqLpKQfDhM+ec/zcQZ7rCQ/IWNsQYQNnf3nMpkasGD5zf+ZT3LkGCR7SJ
         ZI/dnUXBb/0bIGYB+R6ji4kr+Lv139R+Vg4HzwkRoO3zXTB8CjjHP993LaoQ9/Ong5yn
         293XnHw7T89ltwQMRIvPg5nYmKcz1hWJpYlJ+D9hsWsjTSaRvzfOO84akbIayTaHiHge
         9fXNfVm1hF2EcNKgoZ4+zuZSSvSf5KBYcZe35XeWZxhT7yVcrcw5Tg5HI8FoNh8glHE4
         zvNg==
MIME-Version: 1.0
References: <1629796607-6214-1-git-send-email-zhouzhouyi@gmail.com> <20210824164641.GD4156@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210824164641.GD4156@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 25 Aug 2021 02:36:34 +0800
Message-ID: <CAABZP2x7z38kHXNhfhF4R-soUxZ=U6ODaTkmMhcqLC8cn3d8RQ@mail.gmail.com>
Subject: Re: [PATCH-perfbook] fix a typo in QQ 10.15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Thank Paul for reviewing and wordsmithing the fix for me.

As usually, I read the new version many times=EF=BC=8Cand my English
proficiency obtained enhancement ;-)

Thanks again
Zhouyi

On Wed, Aug 25, 2021 at 12:46 AM Paul E. McKenney <paulmck@kernel.org> wrot=
e:
>
> On Tue, Aug 24, 2021 at 05:16:47PM +0800, Zhouyi Zhou wrote:
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Hi Paul,
> >
> > When I examine the answer to QQ 10.15, I can't find the word "roughly"
> > around, so I guess it should be "rough" instead ;-)
> >
> > Thanks
> > Zhouyi
>
> Right you are, and thank you!  I have queued and pushed your patch with
> the usual wordsmithing, so please take a look below.
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 6adb3af174ee4ccacd2d6e83025a06bf50f9aee0
> Author: Zhouyi Zhou <zhouzhouyi@gmail.com>
> Date:   Tue Aug 24 17:16:47 2021 +0800
>
>     datastruct: Fix a typo in QQ 10.15: s/roughly/rough/
>
>     There is no prior "roughly" for alert readers to have noted, so this
>     commit changes to that "roughly" to "rough", of which there are prior
>     instances.
>
>     Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index c3700332..552bd955 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1696,7 +1696,7 @@ bottleneck.
>         the bottleneck and the larger number of buckets increases this
>         workload's memory footprint.
>
> -       The alert reader will have noted the word ``roughly'' above
> +       The alert reader will have noted the word ``rough'' above
>         and might be interested in a more detailed analysis.
>         Such readers are invited to run similar benchmarks, using
>         whatever performance counters or hardware-analysis tools
