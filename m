Return-Path: <SRS0=EhcA=ZE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=R4S4LATDYxl/61nyo2g0jK7wAcbPbZSj+biYwymULS4=;
        b=Gpfm4L6wL0RxnYr6Rb9h/2HwoAKc2j5M1syuLzFuejm1mk1f2wBVm+1zOt/NUVkr9E
         Cx7bGNKwU49FUmusIjwhxgLNHudkPhiaPTuTGRUHqGn70//z2llAe2LoN+PxwFs+urlD
         bx3MroflbR8fjO/UZX6XljxY+VpyGlThIBbptvoKbUoZSkXuoCu4UjY0Exx8Deruw9Cv
         pqp90PSZeDIhtLOQznt0noqEcRxW8Y+3q+PUruaycjo6pWzVnl9O4Ujdo0dScPJHVnkH
         hMuYh95sphum23fjOA62TkmnQZsBRKjWupruoawBoAAjrRVvTC11BM2NxlTucJ4yDY6q
         kmeA==
Message-ID: <e03292ee-f379-c8c5-62af-766ac76644ed@gmail.com>
Date: Fri, 2 Sep 2022 00:18:11 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 2/2] Fix punctuation around footnotes
Content-Language: en-US
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
 <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 1 Sep 2022 22:47:22 +0900, Akira Yokosawa wrote:
> Perfbook's convention is to put footnotes after punctuation marks.
> There are a couple of footnotes placed in front of commas.
> 
> Fix them.
> 
> While here, fill in a missing comma in front of a footnote in datastruct
> so that the phrase "even with today's large-memory systems" reads as such.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> I'm thinking of adding rules to catch this sort of inconsistencies in
> punctcheck.pl.
> The one in datastuct would be hard for such a dumb script, though.
> 
>         Thanks, Akira
> --
>  datastruct/datastruct.tex     | 2 +-
>  intro/intro.tex               | 4 ++--
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 714795f7c5ed..2b802e0518a5 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -2132,7 +2132,7 @@ the one hand, and performance and simplicity on the other.
>  Fortunately, the relatively large memories available on modern
>  systems have allowed us to prioritize performance and simplicity
>  over memory overhead.
> -However, even with today's large-memory systems\footnote{
> +However, even with today's large-memory systems,\footnote{
>  	Smartphones with gigabytes of memory, anyone?}
Paul, you might want to update the text of this footnote.
Today's smartphones actually have gigabytes of memory...

        Thanks, Akira

>  it is sometimes necessary to take extreme measures to reduce
>  memory overhead.
[...]
