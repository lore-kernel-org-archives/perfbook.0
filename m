Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=GUdQZNQh68uOk5Ue/1WgGpUYq51AsBNPUiRi29N4pck=;
 b=0VM/hPZAKGLQ0faJQn5FLapbNRRG4zmauoMs9hJ4oTNrWtjAMm0qCcBrmnKDyAV7Dm
 1b6SwMnS4ujnTtiJNrhcc9jqVkkO+HlKyYHTxJquwaWaHOpPWCyKe+ru2BmdMoNcCxFe
 4JKsW5sg4kSxeTCp7+hPosENzV3gmmDNxoTtQeBUATYE3zwkrTos+T6QoTNYHooJW2Hb
 eXO8mNg2v2RRQV5CYSpSAi9quA7gP3QF07Q1C+9n65Ynh+SBIA7vA92HJdQaZ0SyCj7U
 KVZR6XKGS6BNk/HbR5ZVGXcNFqjjH75UGIWfVyOWHCrnzMTlSJBDXBVD08lUUnVfM8bU
 Furw==
Subject: Re: [PATCH 3/4] defer/whichtochoose: Trim a sentence
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
 <1468655930-9894-4-git-send-email-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e8aae464-9c9c-411b-597b-50344d81612b@gmail.com>
Date: Sun, 17 Jul 2016 00:45:01 +0900
MIME-Version: 1.0
In-Reply-To: <1468655930-9894-4-git-send-email-sj38.park@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,

On 2016/07/16 16:58:49 +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  defer/whichtochoose.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index 648cdc8..884de9d 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -135,7 +135,7 @@ capable of unconditionally acquiring references.
>  The entry for sequence locks is ``N/A'' because, again, sequence locks
>  detect updates rather than acquiring references.
>  Reference counting and hazard pointers require that traversals be
> -restarted from the beginning should a given acquisition fail because
> +restarted from the beginning if a given acquisition fail because

I can't get the point of this change. Original sentence seems quite natural
for me.

>  the currrent object might be removed and all of its
>  possible successsors might be not only be removed, but also freed.
>  For example, when using reference counting or hazard pointers to
>

However, there are typos here. We need to modify as follows.

-the currrent object might be removed and all of its
-possible successsors might be not only be removed, but also freed.
+the current object might be removed and all of its
+possible successors might be not only be removed, but also freed.

I'm sorry but I didn't compose in a patch format.
Paul, if you want a proper patch, feel free to ask me.
I'd rather refrain from sending patches that touch Chapter 9, which I assume
is being intensively rewritten right now.

                                                  Thanks, Akira

