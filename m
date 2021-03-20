Return-Path: <SRS0=Ggdu=IS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+viocM96wtYfg3nl2SXDoLr7tt48NqCJZ7uRJYb7XFM=;
        b=T+uAIG4gmKWrTWLpLuD/+AO1MNajvLg8yWAQKuDO+NVtEFffnXopCwA7sGq7pAJsRY
         AtpFZw+1fuxpcw7p//tsMIkfn0sCVkwwmdjSRyFs7hmlD/kH/cQ8lUtgOLv0ExwUvSU8
         hX2AW36F5imQqVOsQ5gkHxXP1HqAxrF4AitfDmNDgsBfjKYmhVP4GCBIMcBedWW5WpRZ
         zjeS0FzvPdXQcMgo9+fn/HNsAQ1E/kS+KmCiXT3Xuc3GqX39zN1a8MLhsOcwkQ3NItMf
         bxHkymigUj0sH1TzJGtPLI0c9RQi2foqz2PcWQ8oNwj8+dNcKUwhJDwff6knfJ2Y5XfB
         uAow==
Subject: Re: [PATCH 3/3 -perfbook] debugging: Fix typo
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
 <bafeaad6-181b-e4cf-a2ef-588ea8268f02@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c623b30d-a732-1728-eceb-93501a49aa15@gmail.com>
Date: Sun, 21 Mar 2021 00:50:43 +0900
MIME-Version: 1.0
In-Reply-To: <bafeaad6-181b-e4cf-a2ef-588ea8268f02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 21 Mar 2021 00:24:46 +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  debugging/debugging.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index fd52d9e7..3f697f58 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -755,7 +755,7 @@ access to data.
>  The Kernel Concurrency Sanitizer (KCSAN)~\cite{JonathanCorbet2019KCSAN}
>  uses existing markings such as \co{READ_ONCE()} and \co{WRITE_ONCE()}
>  to determine which concurrent accesses deserve warning messages.
> -KCSAN has a significant false-positive rate, especially in from the
> +KCSAN has a significant false-positive rate, especially from the
>  viewpoint of developers thinking in terms of C as assembly language
>  with additional syntax.
>  KCSAN therefore provides a \co{data_race()} construct to forgive
> 

Paul,

I caught this one while searching the usage of "data race" in perfbook.
I thought "data race" also deserves an entry in Glossaries, especially
because our use of "data race" is heavily related to compiler
optimizations and somewhat stricter than the common definition
found on the web.

The first of data race in Section 4.2.2 (just before QQ4.8) does
not (explicitly) talk about optimizations.

Would it be possible for you to come up with some concise definition
of data race which will fit as an entry in the Glossaries?

        Thanks, Akira
 
