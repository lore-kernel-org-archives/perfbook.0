Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51089 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgBMP22 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 13 Feb 2020 10:28:28 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so2527533pjb.0
        for <perfbook@vger.kernel.org>; Thu, 13 Feb 2020 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kKGa6UCeQeddVIyx7Eg/cdhaR3yG/QmbvccByePXfws=;
        b=Q4xIjFC3ZYkQI472ygw44HmYcYmoQ7EL5AlSnZtSPwlQuepVhbrFq2IUSm2UrRJUbq
         Ny2eJ0sylgNaiRoFj4kGkpLdPzxbqiH71lenL0wmRG4mqFytsdc7gGFZZAf8f84OeKNO
         v56rGlyXL8KffwKiQBuyBCIM0Jcl9G7NslQP+mtWAbFQNmLanxHHLL4phBOEfiFphfyQ
         R7JSc5xfIITSt/VISkmfV5HiXI+CKa8/cnD25qViQ+cl20FTgii6lWZ6+HVSnOvVMTR1
         sh3F0m0uvJRqUVYVN627lVSjTUw3esrTVO0rGty9h9AbALO0Dj062+Zh2d5XrNC4yLud
         SFgQ==
Subject: Re: [PATCH] datastruct.tex: fix some minor typos
References: <20200212143457.GA25828@PhD>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <47d5dcd4-64e5-57fa-4834-26d077712de6@gmail.com>
Date: Fri, 14 Feb 2020 00:28:24 +0900
MIME-Version: 1.0
In-Reply-To: <20200212143457.GA25828@PhD>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchang2020@gmail.com>
Cc: perfbook@vger.kernel.org, junchangwang@gmail.com

Hi, Junchang,

On Wed, 12 Feb 2020 22:35:15 +0800, Junchang Wang wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
> 
> Hi Paul,
> 
> I'm reading the latest version of the perfbook and this patch contains fixes to
> some typos in Section Data Structures. Hope it helps.
> 
> Thanks,
> --Junchang
> 
> --
>  datastruct/datastruct.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 4b62471..e21952b 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -700,7 +700,7 @@ Of course, it is quite possible that the differences in lookup performance
>  are affected by the differences in update rates.
>  One way to check this is to artificially throttle the update rates of
>  per-bucket locking and hazard pointers to match that of RCU.
> -Doing so does not significantly improve the lookup performace of
> +Doing so does not significantly improve the lookup performance of
>  per-bucket locking, nor does it close the gap between hazard pointers
>  and RCU.
>  However, removing the read-side memory barriers from hazard pointers
> @@ -800,8 +800,8 @@ scalability, external consistency, or all of the above.
>  \section{Non-Partitionable Data Structures}
>  \label{sec:datastruct:Non-Partitionable Data Structures}
>  %
> -\epigraph{Undertake somthing difficult, otherwise you will never grow.}
> -	 {\emph{Ronald E.~Osburn}}
> +\epigraph{Undertake something difficult, otherwise you will never grow.}
> +	 {\emph{Ronald E.~Osborn}}
>  
>  \begin{figure}[tb]
>  \centering
> @@ -1063,7 +1063,7 @@ Otherwise, a concurrent resize operation has already distributed this
>  bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
>  line~\lnref{get_newbkt} selects the bucket corresponding to the key,
>  and line~\lnref{acq_newbkt} acquires the bucket's lock.
> -\Clnref{lsp1b}{lsp1e} store the bucket pointer and
> +\Clnrefrange{lsp1b}{lsp1e} store the bucket pointer and

Thanks for catching this!

As far as I see, there is no other error in the use of \clnrefrange/\crefrange
at the moment.
To prevent similar typos in the future, I'll add a check of this pattern somewhere
in the build script.

        Thanks, Akira

PS:

The email address in the From: field does not match the SOB tag.
Is this intentional?

>  pointer-set index into their respective fields in the
>  \co{ht_lock_state} structure, which again communicates this information to
>  \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
> 
