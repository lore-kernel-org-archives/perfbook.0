Return-Path: <SRS0=dY4q=RB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KP3fn46nKzrj3msk5hHUnn7LFZrfAYu0XSFvNYnmLno=;
        b=GacDTia830udIyodaZHzcN8IFMHhiZ6yBUpNeFEZz/oMLnRRb6UIGZcmRNDJ0VU8Qx
         u0LmtOiqF1Zl5+LyR4XMqLwBaNZxhoDvPeoOcbfw+5vC4TU3LGaAqrBs3TDajmPDbaom
         Lj2j+B49mv+tjUYMrIycyZKBqMneMeePIN73WGNfEBX83CKja6++5IkX2hYdRnCYQ6Lh
         UgCF75c1csx0yGKBKu3AOJXSWEBNq75wBq3tZUeTxbD4nOUKuYU+OhWM6lVhJtteXGYu
         z0vjJX72aa7zCv9Z41Rm2lo8dffrwliykgf/kZuTiNyFIYIUqSZ+WfPXgEe7MhZCupEs
         l0pg==
Subject: Re: [PATCH -perfbook] defer: Retouch RCUusecases.svg by Inkscape
 1.1.1
References: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3d3d0475-50aa-28dd-92a0-56ad7ba4dca1@gmail.com>
Date: Thu, 16 Dec 2021 23:06:45 +0900
MIME-Version: 1.0
In-Reply-To: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 16 Dec 2021 16:59:13 +0900, Akira Yokosawa wrote:
> Some of texts in the figure are lost when rendered by Inkscape
> 1.1.1 on Fedora 35.
> Those texts are placed far left from the viewBox of the figure
> when opened in Inkscape 1.1.1.
> 
> This issue is similar to the one resolved by commit 36b07176210d
> ("defer: Make RCUspacetime.svg compatible with Inkscape 1.0 and
> later").
> 
> Ungroup and adjust x-coordinates of those texts by Inkscape 1.1.1.
> 
> Resulting SVG is compatible with Inkscape 0.92.x on Ubuntu 18.04
> and Ubuntu 20.04 as well as Inkscape >=1.0.

Well, Firefox still has trouble with this.... (much better, but
still)

Paul, please wait for v2.

        Thanks, Akira

> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> So I said you are safe as far as you don't rotate texts.
> Apparently I was wrong!
> 
> I'm suspecting the cause of the incompatibility is likely related to
> grouping of texts and doing some operation on the grouped text.
> 
> In this retouch, I did ungrouping only.  So you might need to do
> proper grouping if you need further edit.
> 
>         Thanks, Akira
> --
>  defer/RCUusecases.svg | 1406 +++++++++++++++++++----------------------
>  1 file changed, 656 insertions(+), 750 deletions(-)
> 
> diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
[...]
